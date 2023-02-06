
import 'package:client_core/features/domain/entities/auth_response.dart';
import 'package:client_core/features/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthState{
  const AuthState();
}


class AuthInitialState extends AuthState {}

class LogInSuccessfullyState extends AuthState{
  final AuthResponse response;
  const LogInSuccessfullyState({required this.response});
}

class RegisterSuccessfullyState extends AuthState{
  final AuthResponse response;
  const RegisterSuccessfullyState({required this.response});
}


class ChangePasswordState extends AuthState{
  final bool showPass;
  const ChangePasswordState({required this.showPass});
}

class EnableCompleteRegisterState extends AuthState{
  final bool enableCompleteRegister;
  const EnableCompleteRegisterState({required this.enableCompleteRegister});
}

class SetCurrentUserState extends AuthState{
  final UserService user;
  const SetCurrentUserState({required this.user});
}

class LogOutState extends AuthState{}


class ChangeUserKindSuccessfullyState extends AuthState{}