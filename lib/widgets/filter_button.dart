import 'package:flutter/material.dart';
import 'package:softwars_test_task/cubit/tasks_cubit.dart';

import '../values/app_colors.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final void Function(TasksFilter filter) onPressed;
  final TasksFilter value;
  final TasksFilter currentValue;

  const FilterButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.value,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == currentValue;
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(value),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isSelected ? AppColors.disabled : AppColors.primary,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
