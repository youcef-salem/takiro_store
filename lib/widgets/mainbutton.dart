import 'package:flutter/material.dart';

class Mainbutton extends StatelessWidget {
  final String txt;
  final VoidCallback? onPressed;

  const Mainbutton({super.key, required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(txt, style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        )),
      ),
    );
  }
}
