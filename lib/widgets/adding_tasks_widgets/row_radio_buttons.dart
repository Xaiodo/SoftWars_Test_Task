import 'package:flutter/material.dart';
import '../../cubits/creating_task/creating_task_cubit.dart';

import '../../values/app_colors.dart';
import '../radio_button.dart';

class RowRadioButtons extends StatelessWidget {
  final void Function(TaskType status) onPressed;
  final TaskType currentValue;
  const RowRadioButtons({
    super.key,
    required this.onPressed,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.disabled,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RadioButton(
              title: 'Робочі',
              onPressed: onPressed,
              value: TaskType.work,
              currentValue: currentValue,
            ),
            RadioButton(
              title: 'Особисті',
              onPressed: onPressed,
              value: TaskType.personal,
              currentValue: currentValue,
            ),
          ],
        ),
      );
}
