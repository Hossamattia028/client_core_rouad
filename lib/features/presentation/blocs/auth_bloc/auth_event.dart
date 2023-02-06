
import 'package:client_core/features/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent{
  const AuthEvent();
}


class LogInEvent extends AuthEvent{
  final String email;
  final String password;
  const LogInEvent({required this.email,required this.password});
}

class RegisterEvent extends AuthEvent{
  final String email;
  final String password;
  const RegisterEvent({required this.email,required this.password});
}

class ChangePasswordEvent extends AuthEvent{
  const ChangePasswordEvent();
}

class EnableCompleteRegisterEvent extends AuthEvent{
  final bool enableCompleteRegister;
  const EnableCompleteRegisterEvent({required this.enableCompleteRegister});
}

class SetCurrentUserEvent extends AuthEvent{
  final UserService? user;
  const SetCurrentUserEvent({required this.user});
}

class LogOutEvent extends AuthEvent{}


class SendVerifyEmailEvent extends AuthEvent{
  final String email;
  const SendVerifyEmailEvent({required this.email});
}

class ConfirmChangePasswordEvent extends AuthEvent{
  final String email;
  final String newPass;
  final String oldPass;
  const ConfirmChangePasswordEvent({required this.email,required this.newPass,required this.oldPass});
}