// Example MainScreen (replace with your actual main screen)
import 'package:flutter/material.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/enums/cache_enum.dart';
import 'package:super_admin/core/enums/widget_enums.dart';
import 'package:super_admin/core/presentation/screens/partner_login_screen.dart';
import 'package:super_admin/core/presentation/widgets/my_button.dart';
import 'package:super_admin/core/services/cache_service.dart';
import 'package:super_admin/core/presentation/common_widgets/common_text_widgets.dart';

class MyObject {
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;

  MyObject({required this.title, required this.onPressed, this.backgroundColor, this.foregroundColor});
}

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});
  Future<void> setRole(String role) async {
    await CacheService.setValue(AppConstants.cacheKeyRole, role, CacheEnums.string);
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CommonTextWidgets(type:WidgetTextEnum.heading1, text:'Login As'),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: myObjects.map((object) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column( 
                        children:<Widget>[
                            MyButton(
                              onPressed: object.onPressed,
                              text: object.title
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
        )
    );
  }
}