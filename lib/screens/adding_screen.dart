import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task.dart';
import '/cubits/tasks/tasks_cubit.dart';
import '../cubits/creating_task/creating_task_cubit.dart';
import '../widgets/adding_tasks_widgets/creating_task_body.dart';
import '../widgets/adding_tasks_widgets/adding_task_appbar.dart';
import '../values/app_colors.dart';
import '../widgets/elevated_button.dart';

class AddingScreen extends StatelessWidget {
  const AddingScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => CreatingTaskCubit(
          callback: context.read<TasksCubit>(),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AddingTaskAppBar(
            onChanged: context.read<CreatingTaskCubit>().onTitleChanged,
            initialTitle: '',
            isUpdate: false,
            onEditTaskPressed: () {},
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundGradient,
            ),
            child: BlocBuilder<CreatingTaskCubit, CreatingTaskState>(
              builder: (context, state) => CreatingTaskBody(
                task: Task(
                  taskId: state.finishDate.toIso8601String(),
                  name: state.title,
                  description: state.description,
                  finishDate: state.finishDate,
                  status: 1,
                  type: state.type.index + 1,
                  syncTime: state.finishDate,
                  urgent: state.isUrgent ? 1 : 0,
                ),
                onDateChanged: context.read<CreatingTaskCubit>().onDateChanged,
                onDescriptionChanged:
                    context.read<CreatingTaskCubit>().onDescriptionChanged,
                onTypeChanged:
                    context.read<CreatingTaskCubit>().onStatusChanged,
                onUrgentChanged:
                    context.read<CreatingTaskCubit>().onUrgentChanged,
                child: MyElevatedButton(
                  title: "Створити",
                  backgroundColor: AppColors.primaryVariant,
                  onPressed: () {
                    context.read<CreatingTaskCubit>().onSave();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
      );
}
