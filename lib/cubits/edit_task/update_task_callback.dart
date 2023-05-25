import '../../models/task.dart';

abstract class UpdateTaskCallback {
  void updateTask(Task task);
  void onDeleted(Task task);
}
