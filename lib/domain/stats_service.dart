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

  Future<void> saveQuizResult(
    String categoryName,
    int correct,
    int total,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final safeCategoryName = categoryName.replaceAll(RegExp(r'[\/\.]'), '_');

      final categoryRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('categoryStats')
          .doc(safeCategoryName);

      final snapshot = await categoryRef.get().timeout(
        const Duration(seconds: 10),
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

      await categoryRef
          .set({
            'categoryName': categoryName,
            'quizzes': quizzes + 1,
            'totalCorrect': totalCorrect + correct,
            'totalAnswered': totalAnswered + total,
            'lastPlayed': FieldValue.serverTimestamp(),
          }, SetOptions(merge: true))
          .timeout(const Duration(seconds: 10));
    } on FirebaseAuthException {
      //
    } on FirebaseException {
      //
    } catch (e) {
      //
    }
  }

  Future<Map<String, CategoryStats>> loadAllCategoryStats() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return {};
      }

      final querySnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('categoryStats')
          .get(const GetOptions(source: Source.serverAndCache))
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              return _firestore
                  .collection('users')
                  .doc(user.uid)
                  .collection('categoryStats')
                  .get(const GetOptions(source: Source.cache));
            },
          );

      final Map<String, CategoryStats> stats = {};
      for (var doc in querySnapshot.docs) {
        try {
          final data = doc.data();
          final categoryName = data['categoryName'] as String? ?? doc.id;

          stats[categoryName] = CategoryStats(
            categoryName: categoryName,
            quizzes: (data['quizzes'] as num?)?.toInt() ?? 0,
            totalCorrect: (data['totalCorrect'] as num?)?.toInt() ?? 0,
            totalAnswered: (data['totalAnswered'] as num?)?.toInt() ?? 0,
          );
        } catch (e) {
          continue;
        }
      }

      return stats;
    } on FirebaseAuthException {
      return {};
    } on FirebaseException {
      try {
        final user = _auth.currentUser;
        if (user != null) {
          final cachedSnapshot = await _firestore
              .collection('users')
              .doc(user.uid)
              .collection('categoryStats')
              .get(const GetOptions(source: Source.cache));

          final Map<String, CategoryStats> stats = {};
          for (var doc in cachedSnapshot.docs) {
            final data = doc.data();
            final categoryName = data['categoryName'] as String? ?? doc.id;

            stats[categoryName] = CategoryStats(
              categoryName: categoryName,
              quizzes: (data['quizzes'] as num?)?.toInt() ?? 0,
              totalCorrect: (data['totalCorrect'] as num?)?.toInt() ?? 0,
              totalAnswered: (data['totalAnswered'] as num?)?.toInt() ?? 0,
            );
          }
          return stats;
        }
      } catch (cacheError) {
        //
      }

      return {};
    } catch (e) {
      return {};
    }
  }
}

class CategoryStats {
  final String categoryName;
  final int quizzes;
  final int totalCorrect;
  final int totalAnswered;

  CategoryStats({
    required this.categoryName,
    required this.quizzes,
    required this.totalCorrect,
    required this.totalAnswered,
  });

  double get accuracy => totalAnswered > 0 ? totalCorrect / totalAnswered : 0;
}
