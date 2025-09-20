import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/easy_bus_app.dart';
import 'package:super_admin/features/roleselection/presentation/bloc/bloc/get_all_roles_bloc.dart';
import 'di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.initDependencies();
  runApp(
    MultiBlocProvider(
          providers: [
            BlocProvider<GetAllRolesBloc>(
              create: (context) => di.sl<GetAllRolesBloc>()),
          ],
          child: const EasyBusApp()
      ));
}
