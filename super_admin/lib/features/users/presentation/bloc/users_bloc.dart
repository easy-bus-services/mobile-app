import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/users.dart';
import '../../domain/usecases/get_users.dart';

sealed class UsersEvent {}
class LoadUsersEvent extends UsersEvent {
  final String id;
  LoadUsersEvent(this.id);
}

sealed class UsersState {}
class UsersInitial extends UsersState {}
class UsersLoading extends UsersState {}
class UsersLoaded extends UsersState {
  final Users data;
  UsersLoaded(this.data);
}
class UsersError extends UsersState {
  final String message;
  UsersError(this.message);
}

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsers getUsers;

  UsersBloc(this.getUsers) : super(UsersInitial()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(UsersLoading());
      try {
        final data = await getUsers(event.id);
        emit(UsersLoaded(data));
      } catch (_) {
        emit(UsersError("Failed to load users"));
      }
    });
  }
}
