import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/features/roles_selection/domain/repositories/roles_selection_repository.dart';
import '../bloc/roles_selection_bloc.dart';
import '../../../../di/service_locator.dart' as di;
class RolesSelectionProvider extends StatelessWidget {
 const RolesSelectionProvider({Key? key}) : super(key: key);


 @override
 Widget build(BuildContext context) => BlocProvider(
       create: (context) => di.sl<RolesSelectionBloc>(),
       child: RolesSelectionScreen(),
     );
}

class RolesSelectionScreen extends StatelessWidget {
  const RolesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {    
    return  BlocProvider(
      create: (context) => di.sl<RolesSelectionBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text("RolesSelection Screen")),
        body: BlocBuilder<RolesSelectionBloc, RolesSelectionState>(
          builder: (context, state) {
            if(state is RolesSelectionInitial){
              context.read<RolesSelectionBloc>().add(LoadRolesSelectionEvent("123"));
               print("RolesSelectionInitial");
            }
            if (state is RolesSelectionLoading) {
               print("RolesSelectionLoading");
              return const Center(child: CircularProgressIndicator());
            } else if (state is RolesSelectionLoaded) {
              return Center(child: Text("Loaded: ${state.data.id}"));
            } else if (state is RolesSelectionError) {
              return Center(child: Text(state.message));
            }
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<RolesSelectionBloc>().add(LoadRolesSelectionEvent("123"));
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
