import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/service_locator.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/auth_screen.dart';

void main() {
  di.initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Enterprise Flutter",
      home: BlocProvider(
        create: (_) => di.sl<AuthBloc>(),
        child: const AuthScreen(),
      ),
    );
  }
}
