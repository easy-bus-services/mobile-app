import 'package:flutter/material.dart';
import 'package:super_admin/easy_bus_app.dart';
import 'di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.initDependencies();
  runApp(const EasyBusApp());
}
