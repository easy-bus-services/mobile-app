import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/core/domain/repositories/roles_selection_repository.dart';
import '../../domain/entities/roles_selection.dart';
import '../../domain/usecases/get_roles_selection.dart';

sealed class RolesSelectionEvent {}
class LoadRolesSelectionEvent extends RolesSelectionEvent {
  LoadRolesSelectionEvent();
}
class DeleteRolesSelectionEvent extends RolesSelectionEvent {
  final int id;
  DeleteRolesSelectionEvent(this.id);
}

sealed class RolesSelectionState {}
class RolesSelectionInitial extends RolesSelectionState {}
class RolesSelectionLoading extends RolesSelectionState {}
class RolesSelectionLoaded extends RolesSelectionState {
  final List<RolesSelection> data;
  RolesSelectionLoaded(this.data);
}

sealed class RolesDeleteState {}
class RolesDeleteInitial extends RolesDeleteState {}
class RolesDeleteLoading extends RolesDeleteState {}
class RolesDeleteLoaded extends RolesDeleteState {
  final RolesSelection data;
  RolesDeleteLoaded(this.data);
}

class RolesSelectionError extends RolesSelectionState {
  final String message;
  RolesSelectionError(this.message);
}

class RolesDeleteError extends RolesDeleteState {
  final String message;
  RolesDeleteError(this.message);
}

class RolesSelectionBloc extends Bloc<RolesSelectionEvent, RolesSelectionState> {
  final RolesSelectionRepository repository;
  RolesSelectionBloc(this.repository) : super(RolesSelectionInitial()) {
    on<LoadRolesSelectionEvent>((event, emit) async {
      emit(RolesSelectionLoading());
      try {
        final data = await repository.fetchRoles();
        emit(RolesSelectionLoaded(data));
      } catch (e) {
        emit(RolesSelectionError("Failed to load roles_selection"+e.toString()));
      }
    });
    on<DeleteRolesSelectionEvent>((event, emit) async {
      emit(RolesSelectionLoading());
      try {
        await repository.deleteRole(event.id);
        final data = await repository.fetchRoles();
        emit(RolesSelectionLoaded(data));
      } catch (_) {
        emit(RolesSelectionError("Failed to delete role"));
      }
    });
  }
}

/*class RolesDeleteBloc extends Bloc<RolesSelectionEvent, RolesDeleteState> {
  final DeleteRoles deleteRoles;

  RolesDeleteBloc(this.deleteRoles) : super(RolesDeleteInitial()) {
    on<DeleteRolesSelectionEvent>((event, emit) async {
      emit(RolesDeleteLoading());
      try {
        final data = await deleteRoles(event.id);
        emit(RolesDeleteLoaded(data));
      } catch (_) {
        emit(RolesDeleteError("Failed to delete role"));
      }
    });
  }
}*/