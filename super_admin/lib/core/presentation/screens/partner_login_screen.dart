// Example MainScreen (replace with your actual main screen)
import 'package:flutter/material.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/presentation/screens/dashboard_screen.dart';
import 'package:super_admin/core/presentation/widgets/my_elevated_button.dart';
import 'package:super_admin/core/presentation/widgets/my_text.dart';
import 'package:super_admin/core/services/cache_service.dart';

class PartnerLoginScreen extends StatefulWidget {
  const PartnerLoginScreen({super.key});
  @override
  PartnerLoginScreenState createState() => PartnerLoginScreenState();
}

class PartnerLoginScreenState extends State<PartnerLoginScreen> {
  String role='';
  final CacheService _cacheService = CacheService();

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }
  Future<void> _loadUserRole() async {
    String? cacheRole = await _cacheService.getStringValue(AppConstants.cacheKeyRole);
    setState(() {
      role = cacheRole;
      print(role);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MyText(
                role,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 129, 126, 126),
                ),
              ),
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
              MyElevatedButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()), // Replace MainScreen with your actual main screen
                    );
                },
                text: 'Login',
                size:Size((MediaQuery.of(context).size.width - 50), 50),
                backgroundColor: Colors.blue,
              ),                      
              const SizedBox(height: 5),
            ]
            )
          ),
          ),
        )
    );
  }
}