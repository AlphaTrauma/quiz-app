import 'package:flutter/material.dart';
import 'package:quizapp/app/router/routes/app_routes.dart';
import 'package:quizapp/providers/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/l10n/app_localizations.dart';
import 'package:quizapp/presentation/widgets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await UserProvider.of(context).authService.signIn(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context).errorMessage}: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).login)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).email,
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (v) => v == null || v.isEmpty
                    ? AppLocalizations.of(context).enterEmail
                    : null,
              ),
              const SizedBox(height: 16),
              PasswordFieldWidget(
                controller: _passwordController,
                obscureText: _obscurePassword,
                onToggleVisibility: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text(AppLocalizations.of(context).login),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => context.go(registerRoute),
                child: Text(AppLocalizations.of(context).register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
