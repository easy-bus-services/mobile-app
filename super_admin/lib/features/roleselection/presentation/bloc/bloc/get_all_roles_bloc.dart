import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/features/roleselection/domain/entities/roleselection.dart';
import 'package:super_admin/features/roleselection/domain/usecases/get_roleselection.dart';

part 'get_all_roles_event.dart';
part 'get_all_roles_state.dart';

class GetAllRolesBloc extends Bloc<GetAllRolesEvent, GetAllRolesState> {
  final GetAllRoles getAllRoles;
  GetAllRolesBloc(this.getAllRoles) : super(GetAllRolesInitial()) {
    on<LoadAllRolesEvent>((event, emit) async {
        emit(GetAllRolesLoading());
        try{
            final data = await getAllRoles();
            emit(GetAllRolesLoaded(data));
        } catch(e){
          emit(GetAllRolesError("No Roles available ${e.toString()}"));
        }
    });
  }
}

class GetAllRolesError extends GetAllRolesState {
  final String message;
  GetAllRolesError(this.message);
}

