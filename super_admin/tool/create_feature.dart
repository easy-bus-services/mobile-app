import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print("❌ Usage: dart run tool/create_feature.dart <feature_name>");
    exit(1);
  }

  final featureName = args[0].toLowerCase();
  final className =
      featureName[0].toUpperCase() + featureName.substring(1); // e.g. Auth
  final featurePath = "lib/features/$featureName";

  final dirs = [
    "$featurePath/data/models",
    "$featurePath/data/repositories",
    "$featurePath/domain/entities",
    "$featurePath/domain/repositories",
    "$featurePath/domain/usecases",
    "$featurePath/presentation/bloc",
    "$featurePath/presentation/screens",
    "$featurePath/presentation/widgets",
  ];

  for (final dir in dirs) {
    Directory(dir).createSync(recursive: true);
  }

  // --- Domain Layer ---
  File("$featurePath/domain/entities/${featureName}.dart").writeAsStringSync('''
class $className {
  final String id;

  $className({required this.id});
}
''');

  File("$featurePath/domain/repositories/${featureName}_repository.dart")
      .writeAsStringSync('''
import '../entities/${featureName}.dart';

abstract class ${className}Repository {
  Future<$className> fetch$className(String id);
}
''');

  File("$featurePath/domain/usecases/get_${featureName}.dart")
      .writeAsStringSync('''
import '../entities/${featureName}.dart';
import '../repositories/${featureName}_repository.dart';

class Get$className {
  final ${className}Repository repository;

  Get$className(this.repository);

  Future<$className> call(String id) {
    return repository.fetch$className(id);
  }
}
''');

  // --- Data Layer ---
  File("$featurePath/data/models/${featureName}_dto.dart")
      .writeAsStringSync('''
import '../../domain/entities/${featureName}.dart';

class ${className}Dto {
  final String id;

  ${className}Dto({required this.id});

  factory ${className}Dto.fromJson(Map<String, dynamic> json) {
    return ${className}Dto(id: json['id']);
  }

  $className toEntity() => $className(id: id);
}
''');

  File("$featurePath/data/repositories/${featureName}_repository_impl.dart")
      .writeAsStringSync('''
import '../../domain/entities/${featureName}.dart';
import '../../domain/repositories/${featureName}_repository.dart';
import '../models/${featureName}_dto.dart';

class ${className}RepositoryImpl implements ${className}Repository {
  @override
  Future<$className> fetch$className(String id) async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    return ${className}Dto(id: id).toEntity();
  }
}
''');

  // --- Presentation Layer ---
  File("$featurePath/presentation/bloc/${featureName}_bloc.dart")
      .writeAsStringSync('''
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/${featureName}.dart';
import '../../domain/usecases/get_${featureName}.dart';

sealed class ${className}Event {}
class Load${className}Event extends ${className}Event {
  final String id;
  Load${className}Event(this.id);
}

sealed class ${className}State {}
class ${className}Initial extends ${className}State {}
class ${className}Loading extends ${className}State {}
class ${className}Loaded extends ${className}State {
  final $className data;
  ${className}Loaded(this.data);
}
class ${className}Error extends ${className}State {
  final String message;
  ${className}Error(this.message);
}

class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
  final Get$className get$className;

  ${className}Bloc(this.get$className) : super(${className}Initial()) {
    on<Load${className}Event>((event, emit) async {
      emit(${className}Loading());
      try {
        final data = await get$className(event.id);
        emit(${className}Loaded(data));
      } catch (_) {
        emit(${className}Error("Failed to load $featureName"));
      }
    });
  }
}
''');

  File("$featurePath/presentation/screens/${featureName}_screen.dart")
      .writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/${featureName}_bloc.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("$className Screen")),
      body: BlocBuilder<${className}Bloc, ${className}State>(
        builder: (context, state) {
          if (state is ${className}Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ${className}Loaded) {
            return Center(child: Text("Loaded: \${state.data.id}"));
          } else if (state is ${className}Error) {
            return Center(child: Text(state.message));
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<${className}Bloc>().add(Load${className}Event("123"));
              },
              child: const Text("Load Data"),
            ),
          );
        },
      ),
    );
  }
}
''');

  // --- Module Barrel File ---
  File("$featurePath/${featureName}_module.dart").writeAsStringSync('''
library ${featureName}_module;

// Exports for DI setup
export 'data/repositories/${featureName}_repository_impl.dart';
export 'domain/usecases/get_${featureName}.dart';
export 'presentation/bloc/${featureName}_bloc.dart';
export 'presentation/screens/${featureName}_screen.dart';
''');

  // --- Auto Update DI (service_locator.dart) ---
  final diFile = File("lib/di/service_locator.dart");

  if (diFile.existsSync()) {
    final diContent = diFile.readAsStringSync();
    if (!diContent.contains("${className}RepositoryImpl")) {
      final newContent = diContent.replaceFirst(
        "void initDependencies() {",
        '''
void initDependencies() {
  // $featureName feature
  sl.registerLazySingleton<${className}Repository>(() => ${className}RepositoryImpl());
  sl.registerFactory(() => Get$className(sl()));
  sl.registerFactory(() => ${className}Bloc(sl()));
''',
      );
      diFile.writeAsStringSync(newContent);
      print("🔗 Updated service_locator.dart with $featureName dependencies.");
    }
  } else {
    print("⚠️ service_locator.dart not found. Skipping DI update.");
  }

  print("✅ Feature '$featureName' created with boilerplate + DI registration!");
}
