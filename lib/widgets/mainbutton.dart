import 'package:flutter/material.dart';

class Mainbutton extends StatelessWidget {
  final String txt;
  final VoidCallback? onPressed;
  final Color? color;
  final double? border_rdios;
  final double? widh;
  final double? height;
  const Mainbutton({
    super.key,
    required this.txt,
    required this.onPressed,
    this.color,
    this.border_rdios,
    this.height,
    this.widh
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widh ?? double.infinity,
      height: height??  50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border_rdios ?? 8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          txt,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
