import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';
import '../values/app_colors.dart';

class TodoItem extends StatelessWidget {
  final Task task;

  const TodoItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => context.push('/editing', extra: task),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          width: double.infinity,
          decoration: BoxDecoration(
            color: task.urgent == 0 ? AppColors.primary : AppColors.accentRed,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20,
              vertical: 4,
            ),
            child: Row(
              children: [
                Icon(
                  task.type == 1 ? Icons.work_outline : Icons.home_outlined,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          task.name,
                          style: Theme.of(context).textTheme.titleSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        DateFormat('dd.mm.yyyy').format(task.finishDate),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: MediaQuery.of(context).size.width * 0.08,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.secondary,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: task.status == 1
                        ? Colors.transparent
                        : AppColors.disabled,
                  ),
                  child: Icon(
                    task.status == 1 ? null : Icons.check,
                    size: MediaQuery.of(context).size.width * 0.06,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
