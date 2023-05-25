import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubits/tasks/tasks_cubit.dart';
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
                const TabButtons(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: BlocBuilder<TasksCubit, TasksState>(
                    builder: (context, state) {
                      if (state ==
                          TasksLoaded(
                            tasks: state.tasks,
                            filter: state.filter,
                          )) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: state.tasks.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => TodoItem(
                            task: state.tasks[index],
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () => context.push('/adding'),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryVariant,
              borderRadius: BorderRadius.circular(25),
            ),
            height: 65,
            width: 65,
            child: const Icon(
              Icons.add,
              color: AppColors.secondary,
              size: 40,
            ),
          ),
        ),
      );
}
