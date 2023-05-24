part of 'tasks_cubit.dart';

enum TasksFilter { all, work, personal }

@immutable
abstract class TasksState extends Equatable {
  final List<Task> tasks;
  final TasksFilter filter;

  const TasksState({
    required this.tasks,
    this.filter = TasksFilter.all,
  });

  TasksState updatedTasks(List<Task> tasks, TasksFilter filter) =>
      TasksLoaded(tasks: tasks, filter: filter);
  TasksState loadingTasks(List<Task> tasks) => TasksLoading(tasks: tasks);

  @override
  List<Object?> get props => [tasks, filter];
}

class TasksInitial extends TasksState {
  const TasksInitial({super.tasks = const []});
}

class TasksLoaded extends TasksState {
  const TasksLoaded({required super.tasks, required super.filter});
}

class TasksLoading extends TasksState {
  const TasksLoading({required super.tasks});
}
