import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/auth.dart';
import '../../domain/usecases/get_auth.dart';

sealed class AuthEvent {}
class LoadAuthEvent extends AuthEvent {
  final String id;
  LoadAuthEvent(this.id);
}

sealed class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthLoaded extends AuthState {
  final Auth data;
  AuthLoaded(this.data);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetAuth getAuth;

  AuthBloc(this.getAuth) : super(AuthInitial()) {
    on<LoadAuthEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final data = await getAuth(event.id);
        emit(AuthLoaded(data));
      } catch (_) {
        emit(AuthError("Failed to load auth"));
      }
    });
  }
}
