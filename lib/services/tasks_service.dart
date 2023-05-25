import 'package:dio/dio.dart';
import '../values/api.dart';
import '../models/task.dart';

class TasksService {
  final String baseUrl = Api.baseUrl;
  final Dio _dio;

  TasksService({required Dio dio}) : _dio = dio;

  Future<List<Task>> getTasks() async {
    try {
      final response = await _dio.get('${baseUrl}tasks');
      final tasks = response.data['data']
          .map<Task>((task) => Task.fromJson(task))
          .toList();
      return tasks;
    } on DioError {
      rethrow;
    }
  }

  Future<void> createTask(Task task) async {
    try {
      print(task.toJson());
    } on DioError {
      rethrow;
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      print(task.toJson());
    } on DioError {
      rethrow;
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      print(task.toJson());
    } on DioError {
      rethrow;
    }
  }
}
