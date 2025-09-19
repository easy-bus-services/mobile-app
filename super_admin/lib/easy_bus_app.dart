import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:super_admin/features/auth/presentation/screens/auth_screen.dart';
import 'di/service_locator.dart' as di;


class EasyBusApp extends StatelessWidget {
  const EasyBusApp({super.key});

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
