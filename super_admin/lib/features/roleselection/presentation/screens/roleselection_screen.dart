import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/enums/cache_enum.dart';
import 'package:super_admin/core/presentation/screens/partner_login_screen.dart';
import 'package:super_admin/core/presentation/widgets/my_elevated_button.dart';
import 'package:super_admin/core/presentation/widgets/my_text.dart';
import 'package:super_admin/core/services/cache_service.dart';
import 'package:super_admin/features/roleselection/presentation/bloc/bloc/get_all_roles_bloc.dart';
import '../bloc/roleselection_bloc.dart';
import '../../../../di/service_locator.dart' as di;


class MyObject {
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;

  MyObject({required this.title, required this.onPressed, this.backgroundColor, this.foregroundColor});
}

class RoleselectionScreen extends StatefulWidget {
  const RoleselectionScreen({super.key});

  @override
  RoleselectionScreenState createState () =>  RoleselectionScreenState();
}
class RoleselectionScreenState extends State<RoleselectionScreen>{
  final CacheService _cacheService=CacheService();
  
  @override
  void initState() {
   context.read<GetAllRolesBloc>().add(LoadAllRolesEvent());
    super.initState();
  }

  Future<void> setRole(String role) async {
    await _cacheService.setValue(AppConstants.cacheKeyRole, role, CacheEnums.string);
  }

  @override
  Widget build(BuildContext context) {
     
     final List<MyObject> myObjects = [
      MyObject(title: 'Super Admin', backgroundColor: Colors.deepPurple[300] ,onPressed: () {
        setRole('Super Admin');
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PartnerLoginScreen()), // Replace MainScreen with your actual main screen
          );
      }),
      MyObject(title: 'Admin',  backgroundColor: Colors.amber[300] ,onPressed: () {
        setRole('Admin');
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PartnerLoginScreen()), // Replace MainScreen with your actual main screen
          );
      }),
      MyObject(title: 'Employee',  backgroundColor: Colors.red[300] ,onPressed: () {
         setRole('Employee');
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PartnerLoginScreen()), // Replace MainScreen with your actual main screen
          );
      }),
      MyObject(title: 'Driver',  backgroundColor: Colors.green[300] ,onPressed: () {
        setRole('Driver');
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PartnerLoginScreen()), // Replace MainScreen with your actual main screen
          );
      }),
      MyObject(title: 'Bus Owner',  backgroundColor: Colors.blue[300] ,onPressed: () {
        setRole('Bus Owner');
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PartnerLoginScreen()), // Replace MainScreen with your actual main screen
          );
      }),
    ];
   
    return  Scaffold(
              body:SafeArea(
                child: BlocConsumer<GetAllRolesBloc,GetAllRolesState>(
      listener: (context,state) {

      }, 
      builder: (context,state) {
            if (state is GetAllRolesLoading) {
              
              print("GetAllRolesLoading");
              return const Center(child: CircularProgressIndicator());
            } 
            else if (state is GetAllRolesError) {
              print("GetAllRolesError");
              return Center(child: Text(state.message));
            }
            else if (state is GetAllRolesLoaded) {
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
                        color: const Color.fromARGB(255, 129, 126, 126),
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
                                      print(object.roleId);
                                      print(object.roleName);
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
          }
        )
      )
    );
  }
}
