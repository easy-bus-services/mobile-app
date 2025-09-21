import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/enums/cache_enum.dart';
import 'package:super_admin/core/presentation/screens/partner_login_screen.dart';
import 'package:super_admin/core/presentation/widgets/my_elevated_button.dart';
import 'package:super_admin/core/presentation/widgets/my_text.dart';
import 'package:super_admin/core/services/cache_service.dart';
import 'package:super_admin/features/roles_selection/domain/repositories/roles_selection_repository.dart';
import '../bloc/roles_selection_bloc.dart';
import '../../../../di/service_locator.dart' as di;

class RolesSelectionScreen extends StatelessWidget {
  RolesSelectionScreen({super.key});
  final CacheService _cacheService=CacheService();
  
  Future<void> setRole(String role) async {
    await _cacheService.setValue(AppConstants.cacheKeyRole, role, CacheEnums.string);
  }
  
  @override
  Widget build(BuildContext context) {    
    return  BlocProvider(
      create: (context) => di.sl<RolesSelectionBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text("RolesSelection Screen")),
        body: BlocBuilder<RolesSelectionBloc, RolesSelectionState>(
          builder: (context, state) {
            if(state is RolesSelectionInitial){
              context.read<RolesSelectionBloc>().add(LoadRolesSelectionEvent());
               print("RolesSelectionInitial");   
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is RolesSelectionLoading){
               print("RolesSelectionLoading");   
              return const Center(child: CircularProgressIndicator());
            } 
            // else if (state is RolesSelectionError) {
            //   print("GetAllRolesError");
            //   return Center(child: Text(state.message));
            // }
            else if (state is RolesSelectionLoaded) {
              print("GetAllRolesLoaded---");
              print(state.data);
              print("GetAllRolesLoaded----");
              //return Center(child: Text("Loaded:"));
              return Center(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const MyText(
                      'Login As',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 129, 126, 126),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: state.data.map((object) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column( 
                              children:<Widget>[
                                  MyElevatedButton(
                                    onPressed: () {
                                      setRole(object.roleName);
                                      print(object.roleId);
                                      print(object.roleName);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => PartnerLoginScreen()), // Replace MainScreen with your actual main screen
                                      );
                                    },
                                    text: object.roleName,
                                    size:Size((MediaQuery.of(context).size.width - 60), 50),
                                    fontSize: 15,
                                    backgroundColor: Colors.deepPurple[300],
                                  ),                      
                                  const SizedBox(height: 5),
                              ]
                            )
                            );
                          }).toList(),
                      )
                    ),
                  ]
                  )
              );
            }
            else {
              return Center(child: Text("Something Went wrong. Please try again."));
            }
          },
        ),
      ),
    );
    
  }
}
