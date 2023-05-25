part of 'edit_task_cubit.dart';

abstract class EditTaskState extends Equatable {
  final TaskType type;
  final String title;
  final int status;
  final String description;
  final DateTime finishDate;
  final bool isUrgent;
  const EditTaskState(
      {required this.type,
      required this.title,
      required this.description,
      required this.finishDate,
      required this.isUrgent,
      required this.status});

  EditTaskState titleUpdated(String title) => EditTaskUpdated(
        title: title,
        type: type,
        description: description,
        isUrgent: isUrgent,
        finishDate: finishDate,
        status: status,
      );

  EditTaskState descriptionUpdated(String description) => EditTaskUpdated(
        title: title,
        description: description,
        finishDate: finishDate,
        isUrgent: isUrgent,
        type: type,
        status: status,
      );

  EditTaskState statusUpdated(TaskType type) => EditTaskUpdated(
        title: title,
        description: description,
        finishDate: finishDate,
        isUrgent: isUrgent,
        type: type,
        status: status,
      );

  EditTaskState finishDateUpdated(DateTime finishDate) => EditTaskUpdated(
        title: title,
        description: description,
        finishDate: finishDate,
        isUrgent: isUrgent,
        type: type,
        status: status,
      );

  EditTaskState isUrgentUpdated(bool isUrgent) => EditTaskUpdated(
        title: title,
        status: status,
        description: description,
        finishDate: finishDate,
        type: type,
        isUrgent: isUrgent,
      );

  @override
  List<Object> get props => [type, title, description, finishDate, isUrgent];
}

class EditTaskInitial extends EditTaskState {
  const EditTaskInitial({
    required super.status,
    required super.type,
    required super.title,
    required super.description,
    required super.finishDate,
    required super.isUrgent,
  });
}

class EditTaskUpdated extends EditTaskState {
  const EditTaskUpdated({
    required super.type,
    required super.title,
    required super.description,
    required super.finishDate,
    required super.isUrgent,
    required super.status,
  });
}
