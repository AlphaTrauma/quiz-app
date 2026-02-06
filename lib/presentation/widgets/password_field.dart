import 'package:flutter/material.dart';
import 'package:quizapp/l10n/app_localizations.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const PasswordFieldWidget({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.onToggleVisibility,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).password,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            widget.obscureText ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: widget.onToggleVisibility,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator:
          widget.validator ??
          (v) => v == null || v.isEmpty
              ? AppLocalizations.of(context).enterPassword
              : null,
    );
  }
}
