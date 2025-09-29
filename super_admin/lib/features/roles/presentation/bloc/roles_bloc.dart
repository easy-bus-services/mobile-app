import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/roles.dart';
import '../../domain/usecases/get_roles.dart';

sealed class RolesEvent {}
class LoadRolesEvent extends RolesEvent {
  final String id;
  LoadRolesEvent(this.id);
}

sealed class RolesState {}
class RolesInitial extends RolesState {}
class RolesLoading extends RolesState {}
class RolesLoaded extends RolesState {
  final Roles data;
  RolesLoaded(this.data);
}
class RolesError extends RolesState {
  final String message;
  RolesError(this.message);
}

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  final GetRoles getRoles;

  RolesBloc(this.getRoles) : super(RolesInitial()) {
    on<LoadRolesEvent>((event, emit) async {
      emit(RolesLoading());
      try {
        final data = await getRoles(event.id);
        emit(RolesLoaded(data));
      } catch (_) {
        emit(RolesError("Failed to load roles"));
      }
    });
  }
}
