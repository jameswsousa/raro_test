import 'package:flutter/material.dart';
import 'package:raro_test/core/theme/typography.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({required this.onPressed, required this.text});

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.teal),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        onPressed: onPressed,
        child: Text(text, style: h3));
  }
}
