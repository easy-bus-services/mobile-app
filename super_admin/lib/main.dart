import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:super_admin/easy_bus_app.dart';
import 'di/service_locator.dart' as di;
import 'package:path_provider/path_provider.dart';
 Logger? _logger;
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
     final directory = await getApplicationDocumentsDirectory();
     final logFile = File('${directory.path}/app_log.txt');

     _logger = Logger(
       printer: PrettyPrinter(), // Or any other printer
       output: FileOutput(file:logFile),
       level: Level.all, // Set desired log level
     );
  di.initDependencies();
  runApp(const EasyBusApp());
}
