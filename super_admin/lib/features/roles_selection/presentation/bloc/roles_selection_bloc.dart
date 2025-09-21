import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/roles_selection.dart';
import '../../domain/usecases/get_roles_selection.dart';

sealed class RolesSelectionEvent {}
class LoadRolesSelectionEvent extends RolesSelectionEvent {
  LoadRolesSelectionEvent();
}

sealed class RolesSelectionState {}
class RolesSelectionInitial extends RolesSelectionState {}
class RolesSelectionLoading extends RolesSelectionState {}
class RolesSelectionLoaded extends RolesSelectionState {
  final List<RolesSelection> data;
  RolesSelectionLoaded(this.data);
}
class RolesSelectionError extends RolesSelectionState {
  final String message;
  RolesSelectionError(this.message);
}

class RolesSelectionBloc extends Bloc<RolesSelectionEvent, RolesSelectionState> {
  final GetRolesSelection getRolesSelection;

  RolesSelectionBloc(this.getRolesSelection) : super(RolesSelectionInitial()) {
    on<LoadRolesSelectionEvent>((event, emit) async {
      emit(RolesSelectionLoading());
      try {
        final data = await getRolesSelection();
        emit(RolesSelectionLoaded(data));
      } catch (_) {
        emit(RolesSelectionError("Failed to load roles_selection"));
      }
    });
  }
}
