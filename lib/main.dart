import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/adding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

import 'screens/editing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/editing',
        pageBuilder: (context, state) => const MaterialPage(
          child: EditingScreen(),
        ),
      ),
      GoRoute(
        path: '/adding',
        pageBuilder: (context, state) => const MaterialPage(
          child: AddingScreen(),
        ),
      ),
    ],
    initialLocation: '/login',
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      );
}
