import 'package:flutter/material.dart';
import 'package:super_admin/config/router_config.dart';
import 'package:super_admin/core/presentation/screens/dashboard_screen.dart';
import 'package:super_admin/core/presentation/screens/partner_login_screen.dart';
import 'package:super_admin/core/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:super_admin/core/services/cache_service.dart';
import 'package:super_admin/features/roles/presentation/screens/roles_screen.dart';
import 'package:super_admin/features/roles_selection/presentation/screens/roles_selection_screen.dart';
import 'package:super_admin/features/users/presentation/screens/users_screen.dart';

CacheService cacheService= CacheService();

final GoRouter _appRouter = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      }
    ),
    GoRoute(
      path: AppRoutes.rolesSelectionScreen,
      builder: (BuildContext context, GoRouterState state) {
        return RolesSelectionScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.partnersLoginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return PartnerLoginScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.dashboardScreen,
      builder: (BuildContext context, GoRouterState state) {
        return DashboardScreen();
      },
    ),    
    GoRoute(
      path: AppRoutes.rolesScreen,
      builder: (BuildContext context, GoRouterState state) {
        return MyTabsScreen();
      },
    ),    
    GoRoute(
      path: AppRoutes.usersScreen,
      builder: (BuildContext context, GoRouterState state) {
        return UsersScreen();
      },
    ),
  ],
  //  redirect: (context, state) async {
  //       final String roleName = await CacheService.getStringValue(AppConstants.cacheKeyRole); 
  //       final bool isLoggedIn = await CacheService.getBoolValue(AppConstants.cacheKeyLogin); 
  //       final String currentRoute = state.matchedLocation;
  //        _logger?.i(state.matchedLocation);
  //       if (roleName.isNotEmpty) {
  //         // Role selected
  //         if(
  //             currentRoute==AppRoutes.splashScreen || 
  //             currentRoute==AppRoutes.rolesSelectionScreen || 
  //             currentRoute==AppRoutes.partnersLoginScreen
  //           ){
  //             if(isLoggedIn && currentRoute==AppRoutes.partnersLoginScreen){
  //               return AppRoutes.dashboardScreen;
  //             }
  //             else{
  //               return AppRoutes.partnersLoginScreen; 
  //             }
  //           }
  //       }  

  //       return null; // No redirect needed
  //     },
);


class EasyBusApp extends StatelessWidget {
  const EasyBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          foregroundColor: Colors.black, // Sets default foreground color for all AppBars
          // You can also set iconTheme and textTheme here for global styling
        ),
      ),
      routerConfig: _appRouter,
      title: 'Easy Bus Booking',
      debugShowCheckedModeBanner: false,
      );
  }
}
