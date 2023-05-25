import 'package:flutter/material.dart';
import '../values/app_colors.dart';

class SingleRadioButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isUrgent;

  const SingleRadioButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isUrgent,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.primary,
              ),
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color:
                      isUrgent ? AppColors.primaryVariant : Colors.transparent,
                ),
                padding: const EdgeInsets.all(8),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      );
}
