import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubits/edit_task/edit_task_cubit.dart';
import '../models/task.dart';
import '/widgets/adding_tasks_widgets/creating_task_body.dart';
import '/widgets/elevated_button.dart';

import '../cubits/tasks/tasks_cubit.dart';
import '../values/app_colors.dart';
import '../widgets/adding_tasks_widgets/adding_task_appbar.dart';

class EditingScreen extends StatelessWidget {
  final Task task;
  const EditingScreen({super.key, required this.task});
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => EditTaskCubit(
          callback: context.read<TasksCubit>(),
          task: task,
        ),
        child: Builder(
          builder: (context) => BlocBuilder<EditTaskCubit, EditTaskState>(
            builder: (context, state) {
              final updatedTask = Task(
                taskId: state.finishDate.toString(),
                status: state.status,
                type: state.type.index + 1,
                name: state.title,
                description: state.description,
                finishDate: state.finishDate,
                urgent: state.isUrgent ? 1 : 0,
                syncTime: state.finishDate,
              );
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AddingTaskAppBar(
                  onChanged: context.read<EditTaskCubit>().onTitleChanged,
                  initialTitle: state.title,
                  onEditTaskPressed: context.read<EditTaskCubit>().onUpdate,
                  isUpdate: true,
                ),
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.backgroundGradient,
                  ),
                  constraints: const BoxConstraints.expand(),
                  child: CreatingTaskBody(
                    onDateChanged: context.read<EditTaskCubit>().onDateChanged,
                    onDescriptionChanged:
                        context.read<EditTaskCubit>().onDescriptionChanged,
                    onTypeChanged:
                        context.read<EditTaskCubit>().onStatusChanged,
                    onUrgentChanged:
                        context.read<EditTaskCubit>().onUrgentChanged,
                    task: updatedTask,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      alignment: Alignment.center,
                      color: AppColors.secondary,
                      child: MyElevatedButton(
                        title: "Видалити",
                        backgroundColor: AppColors.accentRed,
                        onPressed: () {
                          context.read<EditTaskCubit>().onDelete();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
