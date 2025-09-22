import 'package:flutter/material.dart';
import 'package:super_admin/config/router_config.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/presentation/screens/dashboard_screen.dart';
import 'package:super_admin/core/presentation/screens/partner_login_screen.dart';
import 'package:super_admin/core/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:super_admin/core/services/cache_service.dart';
import 'package:super_admin/features/roles_selection/presentation/screens/roles_selection_screen.dart';

CacheService cacheService= CacheService();

final GoRouter _appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      }
    ),
    GoRoute(
      path: '/select-role',
      builder: (BuildContext context, GoRouterState state) {
        return RolesSelectionScreen();
      },
    ),
    GoRoute(
      path: '/partner-login',
      builder: (BuildContext context, GoRouterState state) {
        return PartnerLoginScreen();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return DashboardScreen();
      },
    ),
  ],
   redirect: (context, state) async {
        final String roleName = await CacheService.getStringValue(AppConstants.cacheKeyRole); 
        final bool isLoggedIn = await CacheService.getBoolValue(AppConstants.cacheKeyLogin); 
        final String currentRoute = state.matchedLocation;
        print(state.matchedLocation);
        if (roleName.isNotEmpty) {
          // Role selected
          if(
              currentRoute==AppRoutes.splashScreen || 
              currentRoute==AppRoutes.rolesSelectionScreen || 
              currentRoute==AppRoutes.partnersLoginScreen
            ){
              if(isLoggedIn && currentRoute==AppRoutes.partnersLoginScreen){
                return AppRoutes.dashboardScreen;
              }
              else{
                return AppRoutes.partnersLoginScreen; 
              }
            }
        }  

        return null; // No redirect needed
      },
);


class EasyBusApp extends StatelessWidget {
  const EasyBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter,
      title: 'Easy Bus Booking',
      debugShowCheckedModeBanner: false,
      );
  }
}
