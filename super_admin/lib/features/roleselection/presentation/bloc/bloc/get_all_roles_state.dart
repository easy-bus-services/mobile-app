part of 'get_all_roles_bloc.dart';

sealed class GetAllRolesState {}

final class GetAllRolesInitial extends GetAllRolesState {}
class GetAllRolesLoading extends GetAllRolesState {}
class GetAllRolesLoaded extends GetAllRolesState {
  final List<Roleselection> data;
  GetAllRolesLoaded(this.data);
}