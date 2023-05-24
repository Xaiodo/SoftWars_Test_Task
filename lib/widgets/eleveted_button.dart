import 'package:flutter/material.dart';
import '../values/app_colors.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  const MyElevatedButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    this.foregroundColor = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
