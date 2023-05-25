import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/task.dart';
import '/cubits/creating_task/creating_task_cubit.dart';
import '/widgets/adding_tasks_widgets/row_radio_buttons.dart';

import '../single_radio_button.dart';
import '../text_input.dart';
import 'background_container.dart';

class CreatingTaskBody extends StatelessWidget {
  final Task task;
  final Widget child;
  final Function(TaskType) onTypeChanged;
  final Function(String) onDescriptionChanged;
  final Function(DateTime) onDateChanged;
  final VoidCallback onUrgentChanged;
  const CreatingTaskBody({
    super.key,
    required this.onDateChanged,
    required this.onTypeChanged,
    required this.onDescriptionChanged,
    required this.child,
    required this.task,
    required this.onUrgentChanged,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                RowRadioButtons(
                  onPressed: onTypeChanged,
                  currentValue: TaskType.values[task.type - 1],
                ),
                const SizedBox(height: 16),
                BackgroundContainer(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.width / 2.5,
                  ),
                  child: TextInput(
                    initialValue: task.name,
                    onChanged: onDescriptionChanged,
                    hintText: 'Додати опис...',
                    textStyle: Theme.of(context).textTheme.titleMedium!,
                  ),
                ),
                const SizedBox(height: 16),
                BackgroundContainer(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Text(
                    'Прикріпити файл...',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023, 05, 25),
                      lastDate: DateTime(2024, 05, 25),
                    );
                    if (pickedDate != null) {
                      onDateChanged(pickedDate);
                    }
                  },
                  child: BackgroundContainer(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Text(
                      DateFormat('dd.MM.yyyy')
                          .format(task.finishDate)
                          .toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                BackgroundContainer(
                  child: SingleRadioButton(
                    onPressed: onUrgentChanged,
                    title: 'Термінове',
                    isUrgent: task.urgent == 1 ? true : false,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          child,
        ],
      );
}
