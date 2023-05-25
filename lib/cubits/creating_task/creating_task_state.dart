part of 'creating_task_cubit.dart';

enum TaskType { work, personal }

abstract class CreatingTaskState extends Equatable {
  final TaskType type;
  final String title;
  final String description;
  final DateTime finishDate;
  final bool isUrgent;
  CreatingTaskState({
    this.type = TaskType.work,
    this.title = '',
    this.description = '',
    DateTime? finishDateTime,
    this.isUrgent = false,
  }) : finishDate = finishDateTime ?? DateTime.now();

  @override
  List<Object> get props => [type, title, description, finishDate, isUrgent];

  CreatingTaskState titleUpdated(String title) => CreatingTaskUpdated(
        title: title,
        type: type,
        description: description,
        isUrgent: isUrgent,
        finishDateTime: finishDate,
      );

  CreatingTaskState descriptionUpdated(String description) =>
      CreatingTaskUpdated(
        title: title,
        description: description,
        finishDateTime: finishDate,
        isUrgent: isUrgent,
        type: type,
      );

  CreatingTaskState statusUpdated(TaskType type) => CreatingTaskUpdated(
        title: title,
        description: description,
        finishDateTime: finishDate,
        isUrgent: isUrgent,
        type: type,
      );

  CreatingTaskState finishDateUpdated(DateTime finishDate) =>
      CreatingTaskUpdated(
        title: title,
        description: description,
        finishDateTime: finishDate,
        isUrgent: isUrgent,
        type: type,
      );

  CreatingTaskState isUrgentUpdated(bool isUrgent) => CreatingTaskUpdated(
        title: title,
        description: description,
        finishDateTime: finishDate,
        type: type,
        isUrgent: isUrgent,
      );
}

class CreatingTaskInitial extends CreatingTaskState {}

class CreatingTaskUpdated extends CreatingTaskState {
  CreatingTaskUpdated({
    required super.type,
    required super.title,
    required super.description,
    required super.isUrgent,
    required super.finishDateTime,
  });
}
