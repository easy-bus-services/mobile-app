
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_admin/config/router_config.dart';
import 'package:super_admin/core/presentation/widgets/my_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // final List<Widget> _pages = [
  //   Center(child: Text('Dashboard Content')),
  //   Padding(padding: WidgetConstants.horizantalPadding20, child: UsersScreen()),
  //   Center(child: Text('Settings Content')),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return MyScreen(
      showAppBar: true,
      title: Text('Dashboard'),
      leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      sideMenu: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Navigation', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                title: const Text('Dashboard'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: const Text('Roles'),
                selected: _selectedIndex == 1,
                onTap: () {
                  //_onItemTapped(1);
                  Navigator.pop(context);
                  context.push(AppRoutes.rolesScreen);
                },
              ),
              ListTile(
                title: const Text('Users'),
                selected: _selectedIndex == 2,
                onTap: () {
                  Navigator.pop(context);
                  context.push(AppRoutes.usersScreen);
                },
              ),
            ],
          ),
        ),
      screenAlignmentCenter: true,
      screenPaddingHorizantal: 10,
      body: Text('Dashboard Content')
    );

    //   Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Dashboard'),
    //     // No leading icon on large screens if the sidebar is always visible
    //     leading: isLargeScreen ? null : Builder(
    //       builder: (context) => IconButton(
    //         icon: const Icon(Icons.menu),
    //         onPressed: () => Scaffold.of(context).openDrawer(),
    //       ),
    //     ),
    //     actions: [
    //         IconButton(
    //           icon: const Icon(Icons.arrow_back),
    //           onPressed: () {
    //             CacheService.clearByKey(AppConstants.cacheKeyLogin);
    //             context.go(AppRoutes.partnersLoginScreen);
    //           },
    //         ),
    //     ]
    //   ),

    //   body: Center(child: Text('Dashboard Content')),
    // );
  }
}