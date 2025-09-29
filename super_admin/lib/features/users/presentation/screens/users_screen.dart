import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/users_bloc.dart';
import '../../../../di/service_locator.dart' as di;

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<UsersBloc>(),
      child: Scaffold(
      appBar: AppBar(title: const Text("Users Screen")),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersLoaded) {
            return Center(child: Text("Loaded: ${state.data.id}"));
          } else if (state is UsersError) {
            return Center(child: Text(state.message));
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<UsersBloc>().add(LoadUsersEvent("123"));
              },
              child: const Text("Load Data"),
            ),
          );
        },
      ),
      ),
    );
  }
}
