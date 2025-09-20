import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/roleselection.dart';
import '../../domain/usecases/get_roleselection.dart';

sealed class RoleselectionEvent {}
class LoadRoleselectionEvent extends RoleselectionEvent {
  final String id;
  LoadRoleselectionEvent(this.id);
}

sealed class RoleselectionState {}
class RoleselectionInitial extends RoleselectionState {}
class RoleselectionLoading extends RoleselectionState {}
class RoleselectionLoaded extends RoleselectionState {
  final Roleselection data;
  RoleselectionLoaded(this.data);
}
class RoleselectionError extends RoleselectionState {
  final String message;
  RoleselectionError(this.message);
}

class RoleselectionBloc extends Bloc<RoleselectionEvent, RoleselectionState> {
  final GetRoleselection getRoleselection;

  RoleselectionBloc(this.getRoleselection) : super(RoleselectionInitial()) {
    on<LoadRoleselectionEvent>((event, emit) async {
      emit(RoleselectionLoading());
      try {
        final data = await getRoleselection(event.id);
        emit(RoleselectionLoaded(data));
      } catch (_) {
        emit(RoleselectionError("Failed to load roleselection"));
      }
    });
  }
}
