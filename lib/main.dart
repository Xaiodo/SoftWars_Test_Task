import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:softwars_test_task/models/task.dart';
import './cubits/tasks/tasks_cubit.dart';
import '../repositories/tasks_repository.dart';
import '../services/tasks_service.dart';
import 'screens/adding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        pageBuilder: (context, state) => MaterialPage(
          key: const ValueKey('editing'),
          child: EditingScreen(task: state.extra as Task),
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
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TasksCubit(
              repository: TasksRepository(
                tasksService: TasksService(
                  dio: Dio(),
                ),
              ),
            ),
          ),
        ],
        child: MaterialApp.router(
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        ),
      );
}
