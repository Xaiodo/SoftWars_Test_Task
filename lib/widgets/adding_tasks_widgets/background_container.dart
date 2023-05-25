import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry padding;
  const BackgroundContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.constraints,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.disabled,
        ),
        constraints: constraints,
        width: MediaQuery.of(context).size.width,
        padding: padding,
        alignment: Alignment.topLeft,
        child: child,
      );
}
