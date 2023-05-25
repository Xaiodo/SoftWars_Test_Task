import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/models/task.dart';

import '../../values/app_colors.dart';
import '../text_input.dart';

class AddingTaskAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Task? task;
  final VoidCallback onEditTaskPressed;
  final bool isUpdate;
  final String initialTitle;
  final Function(String) onChanged;

  const AddingTaskAppBar({
    super.key,
    required this.onEditTaskPressed,
    required this.isUpdate,
    required this.initialTitle,
    required this.onChanged,
    this.task,
  });
  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.primaryVariant,
          onPressed: () => context.pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextInput(
          initialValue: initialTitle,
          hintText: 'Назва завдання...',
          textStyle: Theme.of(context).textTheme.titleLarge!,
          onChanged: onChanged,
        ),
        centerTitle: true,
        actions: [
          if (isUpdate)
            IconButton(
              icon: const Icon(Icons.check),
              color: AppColors.primaryVariant,
              onPressed: onEditTaskPressed,
            ),
        ],
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
