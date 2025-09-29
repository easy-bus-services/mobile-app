   import 'dart:io';
   import 'package:logger/logger.dart';

   class FileOutput extends LogOutput {
     final File logFile;

     FileOutput(this.logFile);

     @override
     void output(OutputEvent event) {
       for (var line in event.lines) {
         logFile.writeAsStringSync('$line\n', mode: FileMode.append);
       }
     }
   }