
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Dashboard Content')),
    Center(child: Text('Users Content')),
    Center(child: Text('Settings Content')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        // No leading icon on large screens if the sidebar is always visible
        leading: isLargeScreen ? null : Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: isLargeScreen ? null : Drawer(
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
              title: const Text('Users'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: <Widget>[
          if (isLargeScreen)
            Container(
              width: 200,
              color: Colors.grey[200],
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 20),
                  ListTile(
                    title: const Text('Dashboard'),
                    selected: _selectedIndex == 0,
                    onTap: () => _onItemTapped(0),
                  ),
                  ListTile(
                    title: const Text('Users'),
                    selected: _selectedIndex == 1,
                    onTap: () => _onItemTapped(1),
                  ),
                  ListTile(
                    title: const Text('Settings'),
                    selected: _selectedIndex == 2,
                    onTap: () => _onItemTapped(2),
                  ),
                ],
              ),
            ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}