import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../values/app_colors.dart';
import '../widgets/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.width / 3.77),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
          child: MyElevatedButton(
            title: "Вхід",
            backgroundColor: AppColors.primaryVariant,
            foregroundColor: Colors.black,
            onPressed: () => context.go('/home'),
            padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 10),
          ),
        ),
      );
}
