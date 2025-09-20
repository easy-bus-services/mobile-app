part of 'get_all_roles_bloc.dart';

sealed class GetAllRolesEvent {}

class LoadAllRolesEvent extends GetAllRolesEvent { 
  LoadAllRolesEvent();
}