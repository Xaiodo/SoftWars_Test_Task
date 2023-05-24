import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwars_test_task/cubit/tasks_cubit.dart';
import 'package:softwars_test_task/widgets/filter_button.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) => Row(
            children: [
              FilterButton(
                title: 'Усі',
                onPressed: context.read<TasksCubit>().onQueryChanged,
                value: TasksFilter.all,
                currentValue: state.filter,
              ),
              const SizedBox(width: 10),
              FilterButton(
                title: 'Робочі',
                onPressed: context.read<TasksCubit>().onQueryChanged,
                value: TasksFilter.work,
                currentValue: state.filter,
              ),
              const SizedBox(width: 10),
              FilterButton(
                title: 'Особисті',
                onPressed: context.read<TasksCubit>().onQueryChanged,
                value: TasksFilter.personal,
                currentValue: state.filter,
              ),
            ],
          ),
        ),
      );
}
