import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repositories/tasks_repository.dart';
import '../models/task.dart';
import 'package:equatable/equatable.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepository _tasksRepository;

  TasksCubit({required TasksRepository repository})
      : _tasksRepository = repository,
        super(const TasksInitial()) {
    _init();
  }
  void _init() async {
    emit(state.loadingTasks(state.tasks));
    final response = await _tasksRepository.getTasks();
    emit(state.updatedTasks(response, state.filter));
  }

  void loadTasks() async {
    emit(state.loadingTasks(state.tasks));
    final response = await _tasksRepository.getTasks();
    emit(state.updatedTasks(response, state.filter));
  }

  void onQueryChanged(TasksFilter status) async {
    final tasks = await _tasksRepository.onQueryChanged(status);
    emit(state.updatedTasks(tasks, status));
  }

  // void updateTask(Task task) async {
  //   await _tasksRepository.updateTask(task);
  //   final tasks = await _tasksRepository.getTasks();
  //   emit(TasksLoaded(tasks));
  // }

  // void deleteTask(Task task) async {
  //   await _tasksRepository.deleteTask(task);
  //   final tasks = await _tasksRepository.getTasks();
  //   emit(TasksLoaded(tasks));
  // }

  // void createTask(Task task) async {
  //   await _tasksRepository.createTask(task);
  //   final tasks = await _tasksRepository.getTasks();
  //   emit(TasksLoaded(tasks));
  // }
}
