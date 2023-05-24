import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String taskId;
  final int status;
  final int type;
  final String name;
  final String description;
  final DateTime finishDate;
  final int urgent;
  final DateTime syncTime;

  const Task({
    required this.taskId,
    required this.status,
    required this.type,
    required this.name,
    required this.description,
    required this.finishDate,
    required this.urgent,
    required this.syncTime,
  });

  @override
  List<Object?> get props =>
      [taskId, status, name, description, finishDate, urgent, syncTime];

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskId: json['taskId'] as String,
        status: json['status'] as int,
        type: json['type'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        finishDate: DateTime.parse(json['finishDate']),
        urgent: json['urgent'] as int,
        syncTime: DateTime.parse(json['syncTime']),
      );

  Map<String, dynamic> toJson() => {
        'taskId': taskId,
        'status': status,
        'type': type,
        'name': name,
        'description': description,
        'finishDate': finishDate.toIso8601String(),
        'urgent': urgent,
        'syncTime': syncTime.toIso8601String(),
      };
}
