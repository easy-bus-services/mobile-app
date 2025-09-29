// Example MainScreen (replace with your actual main screen)
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:super_admin/config/router_config.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/enums/cache_enum.dart';
import 'package:super_admin/core/enums/widget_enums.dart';
import 'package:super_admin/core/presentation/widgets/my_button.dart';
import 'package:super_admin/core/presentation/widgets/my_screen.dart';
import 'package:super_admin/core/services/cache_service.dart';
import 'package:super_admin/core/presentation/common_widgets/common_text_widgets.dart';
Logger? _logger;
class PartnerLoginScreen extends StatefulWidget {
  const PartnerLoginScreen({super.key});
  @override
  PartnerLoginScreenState createState() => PartnerLoginScreenState();
}

class PartnerLoginScreenState extends State<PartnerLoginScreen> {
  String role='';
  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }
  Future<void> _loadUserRole() async {
    String? cacheRole = await CacheService.getStringValue(AppConstants.cacheKeyRole);
    setState(() {
      role = cacheRole;
       _logger?.i(role);
    });
  }
  Future<void> setLogin(bool isLoggedIn) async {
    await CacheService.setValue(AppConstants.cacheKeyLogin, isLoggedIn, CacheEnums.bool);
  }

  @override
  Widget build(BuildContext context) {
    return MyScreen(
      showAppBar: false,
        screenPaddingHorizantal: 20,
        screenPaddingVertical: 10,
        screenAlignmentCenter: true,
        body: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CommonTextWidgets(text: role, type: WidgetTextEnum.heading1),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextField(
                obscureText: true, // Hides the entered text for security
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off), // Optional: toggle password visibility
                ),
                keyboardType: TextInputType.text, // Standard text keyboard
              ),
              MyButton(
                  onPressed: () {
                    setLogin(true);
                    GoRouter.of(context).push(AppRoutes.dashboardScreen);
                  },
                  text: 'Login',
                fontSize: 20,
                isFontBold: true,
              )
            ],
          ),
        )
    );

      /*Scaffold(
      
      appBar: AppBar(
         actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                CacheService.clearByKey(AppConstants.cacheKeyRole);
                context.go(AppRoutes.rolesSelectionScreen);
              },
            ),
        ]
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: WidgetConstants.horizantalPadding20,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CommonTextWidgets(type:WidgetTextEnum.heading1, text:role),
              SizedBox(height: 50),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true, // Hides the entered text for security
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off), // Optional: toggle password visibility
                ),
                keyboardType: TextInputType.text, // Standard text keyboard
              ),
              const SizedBox(height: 15),
              MyButton(
                onPressed: () {  
                  setLogin(true);               
                  GoRouter.of(context).push(AppRoutes.dashboardScreen);
                },
                text: 'Login'
              ),                      
              const SizedBox(height: 5),
            ]
            )
          ),
          ),
        )
    );*/
  }
}