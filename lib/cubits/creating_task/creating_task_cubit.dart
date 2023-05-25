import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/cubits/creating_task/add_task_callback.dart';

import '../../models/task.dart';

part 'creating_task_state.dart';

class CreatingTaskCubit extends Cubit<CreatingTaskState> {
  final AddTaskCallback _callback;
  CreatingTaskCubit({
    required AddTaskCallback callback,
  })  : _callback = callback,
        super(CreatingTaskInitial());

  void onTitleChanged(String title) {
    emit(state.titleUpdated(title));
  }

  void onDescriptionChanged(String description) {
    emit(state.descriptionUpdated(description));
  }

  void onStatusChanged(TaskType status) {
    emit(state.statusUpdated(status));
  }

  void onDateChanged(DateTime finishDate) {
    emit(state.finishDateUpdated(finishDate));
  }

  void onUrgentChanged() {
    emit(state.isUrgentUpdated(!state.isUrgent));
  }

  void onSave() {
    _callback.addTask(
      Task(
        taskId: state.finishDate.toString(),
        status: 1,
        syncTime: state.finishDate,
        name: state.title,
        description: state.description,
        type: state.type.index + 1,
        finishDate: state.finishDate,
        urgent: state.isUrgent ? 1 : 0,
      ),
    );
  }
}
