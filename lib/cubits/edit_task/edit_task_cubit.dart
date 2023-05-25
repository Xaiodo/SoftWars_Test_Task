import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/cubits/edit_task/update_task_callback.dart';

import '../../models/task.dart';
import '../creating_task/creating_task_cubit.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  final UpdateTaskCallback _callback;

  EditTaskCubit({
    required UpdateTaskCallback callback,
    required Task task,
  })  : _callback = callback,
        super(
          EditTaskInitial(
            description: task.description,
            finishDate: task.finishDate,
            isUrgent: task.urgent == 1,
            title: task.name,
            type: TaskType.values[task.type - 1],
            status: task.status,
          ),
        );

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

  void onUpdate() {
    _callback.updateTask(
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

  void onDelete() {
    _callback.onDeleted(
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
