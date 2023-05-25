import '../cubits/tasks/tasks_cubit.dart';

import '../models/task.dart';
import '../services/tasks_service.dart';

class TasksRepository {
  final TasksService _tasksService;

  TasksRepository({required TasksService tasksService})
      : _tasksService = tasksService;

  Future<List<Task>> getTasks() async {
    try {
      return await _tasksService.getTasks();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Task>> onQueryChanged(
    TasksFilter status,
  ) async {
    try {
      final tasks = await _tasksService.getTasks();
      if (status == TasksFilter.all) return tasks;
      final filteredTasks =
          tasks.where((task) => task.type == status.index).toList();
      return filteredTasks;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _tasksService.updateTask(task);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _tasksService.deleteTask(task);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createTask(Task task) async {
    try {
      await _tasksService.createTask(task);
    } catch (e) {
      rethrow;
    }
  }
}
