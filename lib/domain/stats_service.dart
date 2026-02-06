import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StatsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  StatsService() {
    _firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  Future<void> saveQuizResult(String categoryName, int correct, int total) async {
    try {
      final user = _auth.currentUser; 

      final categoryRef = _firestore
          .collection('users')
          .doc(user!.uid)
          .collection('categoryStats')
          .doc(categoryName);

      final snapshot = await categoryRef.get().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Connection timeout while fetching stats');
        },
      );

      int quizzes = 0;
      int totalCorrect = 0;
      int totalAnswered = 0;

      if (snapshot.exists) {
        final data = snapshot.data()!;
        quizzes = (data['quizzes'] as num?)?.toInt() ?? 0;
        totalCorrect = (data['totalCorrect'] as num?)?.toInt() ?? 0;
        totalAnswered = (data['totalAnswered'] as num?)?.toInt() ?? 0;
      }

      await categoryRef.set({
        'quizzes': quizzes + 1,
        'totalCorrect': totalCorrect + correct,
        'totalAnswered': totalAnswered + total,
        'lastPlayed': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Connection timeout while saving stats');
        },
      );

      print('Quiz result saved successfully');
    } on FirebaseAuthException catch (e) {
      print('Auth error while saving quiz result: ${e.code} - ${e.message}'); 
    } on FirebaseException catch (e) {
      print('Firestore error while saving quiz result: ${e.code} - ${e.message}'); 
    } catch (e) {
      print('Unexpected error while saving quiz result: $e');
      rethrow;
    }
  }

  Future<Map<int, CategoryStats>> loadAllCategoryStats() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        print('No user logged in, returning empty stats');
        return {};
      }

      final querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('categoryStats')
          .get(const GetOptions(source: Source.serverAndCache)) // Используем кэш если нет сети
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              print('Timeout while loading stats, trying cache');
              return _firestore
                  .collection('users')
                  .doc(user.uid)
                  .collection('categoryStats')
                  .get(const GetOptions(source: Source.cache));
            },
          );

      final Map<int, CategoryStats> stats = {};
      for (var doc in querySnapshot.docs) {
        try {
          final categoryId = int.tryParse(doc.id);
          if (categoryId == null) {
            print('Invalid category ID: ${doc.id}');
            continue;
          }

          final data = doc.data();
          stats[categoryId] = CategoryStats(
            quizzes: (data['quizzes'] as num?)?.toInt() ?? 0,
            totalCorrect: (data['totalCorrect'] as num?)?.toInt() ?? 0,
            totalAnswered: (data['totalAnswered'] as num?)?.toInt() ?? 0,
          );
        } catch (e) {
          print('Error parsing document ${doc.id}: $e');
          continue;
        }
      }

      print('Loaded ${stats.length} category stats');
      return stats;
    } on FirebaseAuthException catch (e) {
      print('Auth error while loading stats: ${e.code} - ${e.message}');
      return {};
    } on FirebaseException catch (e) {
      print('Firestore error while loading stats: ${e.code} - ${e.message}');
      
      // Пытаемся загрузить из кэша
      try {
        final user = _auth.currentUser;
        if (user != null) {
          final cachedSnapshot = await _firestore
              .collection('users')
              .doc(user.uid)
              .collection('categoryStats')
              .get(const GetOptions(source: Source.cache));

          final Map<int, CategoryStats> stats = {};
          for (var doc in cachedSnapshot.docs) {
            final categoryId = int.tryParse(doc.id);
            if (categoryId != null) {
              final data = doc.data();
              stats[categoryId] = CategoryStats(
                quizzes: (data['quizzes'] as num?)?.toInt() ?? 0,
                totalCorrect: (data['totalCorrect'] as num?)?.toInt() ?? 0,
                totalAnswered: (data['totalAnswered'] as num?)?.toInt() ?? 0,
              );
            }
          }
          print('Loaded ${stats.length} category stats from cache');
          return stats;
        }
      } catch (cacheError) {
        print('Error loading from cache: $cacheError');
      }
      
      return {};
    } catch (e) {
      print('Unexpected error while loading stats: $e');
      return {};
    }
  }
}

class CategoryStats {
  final int quizzes;
  final int totalCorrect;
  final int totalAnswered;

  CategoryStats({
    required this.quizzes,
    required this.totalCorrect,
    required this.totalAnswered,
  });

  double get accuracy => totalAnswered > 0 ? totalCorrect / totalAnswered : 0;
}