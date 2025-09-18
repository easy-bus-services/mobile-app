import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth Screen")),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthLoaded) {
            return Center(child: Text("Loaded: ${state.data.id}"));
          } else if (state is AuthError) {
            return Center(child: Text(state.message));
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(LoadAuthEvent("123"));
              },
              child: const Text("Load Data"),
            ),
          );
        },
      ),
    );
  }
}
