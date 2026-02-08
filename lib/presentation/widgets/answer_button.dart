import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback? onPressed;

  const AnswerButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color borderColor;

    if (isSelected) {
      if (isCorrect) {
        backgroundColor = Colors.green;
        textColor = Colors.white;
        borderColor = Colors.green.shade700;
      } else {
        backgroundColor = Colors.red;
        textColor = Colors.white;
        borderColor = Colors.red.shade700;
      }
    } else {
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      borderColor = Colors.grey.shade300;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            side: BorderSide(color: borderColor, width: 2.0),
            elevation: isSelected ? 4 : 1,
            overlayColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
