import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/tasks_cubit.dart';
import '../widgets/todo_item.dart';
import '../values/app_colors.dart';
import '../widgets/tab_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width / 20,
              35,
              MediaQuery.of(context).size.width / 20,
              0,
            ),
            child: Column(
              children: [
                const FilterButtons(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: BlocBuilder<TasksCubit, TasksState>(
                    builder: (context, state) => ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) => TodoItem(
                        status: state.tasks[index].status,
                        type: state.tasks[index].type,
                        urgent: state.tasks[index].urgent,
                        name: state.tasks[index].name,
                        date: state.tasks[index].finishDate,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () => context.go('/adding'),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryVariant,
              borderRadius: BorderRadius.circular(25),
            ),
            height: 71,
            width: 71,
            child: const Icon(
              Icons.add,
              color: AppColors.secondary,
              size: 40,
            ),
          ),
        ),
      );
}
