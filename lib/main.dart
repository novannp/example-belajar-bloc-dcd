import 'package:belajar_bloc2/features/user/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/user/presentation/bloc/user_bloc.dart';
import 'injection.dart' as di;
import 'injection.dart';

void main() {
  di.init();
  runApp(BlocProvider<UserBloc>(
    create: (context) => locator<UserBloc>(),
    child: const MyApp(),
  ));
}

// ROUTER / NAVIGATOR
// BLOC
// DIO / HTTP
// EQUATABLE

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserScreen(),
    );
  }
}
