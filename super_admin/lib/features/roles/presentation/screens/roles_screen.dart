import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/di/service_locator.dart' as di;
import 'package:super_admin/features/roles/presentation/bloc/roles_bloc.dart';
import 'package:super_admin/features/roles/presentation/bloc/tab_event.dart';
import 'package:super_admin/features/roles/presentation/screens/list_of_roles.dart';
class MyTabsScreen extends StatefulWidget {
  const MyTabsScreen({super.key});
  @override
  _MyTabsScreenState createState() => _MyTabsScreenState();
}

class _MyTabsScreenState extends State<MyTabsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(
           create: (context) => di.sl<TabBloc>()
       ),
       BlocProvider(
           create: (context) => di.sl<RolesBloc>()
       )
     ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tabs with BLoC'),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'List of Roles'),
              Tab(text: 'Add Roles'),
              Tab(text: 'List of Permissions'),
              Tab(text: 'Add Permissions'),
            ],
            onTap: (index) {
              context.read<TabBloc>().add(UpdateTabEvent(index));
            },
          ),
        ),
        body: BlocBuilder<TabBloc, TabState>(
          builder: (context, state) {
            if (state is TabLoadedState) {
              _tabController.index = state.tabIndex; // Synchronize TabController
            }
            return BlocBuilder<RolesBloc, RolesState>(
              builder: (context, state) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(child: ListOfRoles()),
                    Center(child: Text('Content of Tab 2')),
                    Center(child: Text('Content of Tab 3')),
                    Center(child: Text('Content of Tab 4')),
                  ],
                );
             }
            );
          },
        ),
      ),
    );
  }
}