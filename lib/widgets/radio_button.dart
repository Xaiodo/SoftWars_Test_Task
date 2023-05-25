import 'package:flutter/material.dart';
import '../cubits/creating_task/creating_task_cubit.dart';
import '../values/app_colors.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final void Function(TaskType) onPressed;
  final TaskType value;
  final TaskType currentValue;

  const RadioButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.value,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == currentValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onPressed(value),
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
                    isSelected ? AppColors.primaryVariant : Colors.transparent,
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
}
