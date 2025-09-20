import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/enums/cache_enum.dart';
import 'package:super_admin/core/presentation/screens/partner_login_screen.dart';
import 'package:super_admin/core/presentation/widgets/my_elevated_button.dart';
import 'package:super_admin/core/presentation/widgets/my_text.dart';
import 'package:super_admin/core/services/cache_service.dart';
import '../bloc/roleselection_bloc.dart';
import '../../../../di/service_locator.dart' as di;


class MyObject {
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;

  MyObject({required this.title, required this.onPressed, this.backgroundColor, this.foregroundColor});
}


class RoleselectionScreen extends StatelessWidget {
  RoleselectionScreen({super.key});
  final CacheService _cacheService=CacheService();
  Future<void> setRole(String role) async {
    await _cacheService.setValue(cacheKeyRole, role, CacheEnums.string);
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
   
    return  BlocProvider(
      create: (_) => di.sl<RoleselectionBloc>(), 
      child: Scaffold(
        body: BlocBuilder<RoleselectionBloc, RoleselectionState>(
          builder: (context, state) {
            if (state is RoleselectionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RoleselectionLoaded) {
              return Center(child: Text("Loaded: ${state.data.id}"));
            } else if (state is RoleselectionError) {
              return Center(child: Text(state.message));
            }
            return SafeArea(
              child: Center(
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
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: myObjects.map((object) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column( 
                              children:<Widget>[
                                  MyElevatedButton(
                                    onPressed: object.onPressed,
                                    text: object.title,
                                    size:Size((MediaQuery.of(context).size.width - 60), 50),
                                    fontSize: 10,
                                    backgroundColor: object.backgroundColor,
                                  ),                      
                                  const SizedBox(height: 5),
                              ]
                            )
                            );
                          }).toList(),
                      ),
                    ),
                  ]
                  )
                )
            );
          },
        ),
      )
    );
  }
}
