import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../edit_task/update_task_callback.dart';
import '/cubits/creating_task/add_task_callback.dart';
import '../../repositories/tasks_repository.dart';
import '../../models/task.dart';
import 'package:equatable/equatable.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState>
    implements AddTaskCallback, UpdateTaskCallback {
  final TasksRepository _tasksRepository;

  TasksCubit({required TasksRepository repository})
      : _tasksRepository = repository,
        super(TasksInitial()) {
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

  void deleteTask(Task task) async {
    await _tasksRepository.deleteTask(task);
    final tasks = await _tasksRepository.getTasks();
    emit(state.updatedTasks(tasks, state.filter));
  }

  @override
  void updateTask(Task task) async {
    await _tasksRepository.updateTask(task);
    final tasks = await _tasksRepository.getTasks();
    emit(state.updatedTasks(tasks, state.filter));
  }

  @override
  void addTask(Task task) async {
    await _tasksRepository.createTask(task);
    final tasks = await _tasksRepository.getTasks();
    emit(state.updatedTasks(tasks, state.filter));
  }

  @override
  void onDeleted(Task task) async {
    await _tasksRepository.deleteTask(task);
    final tasks = await _tasksRepository.getTasks();
    emit(state.updatedTasks(tasks, state.filter));
  }
}
