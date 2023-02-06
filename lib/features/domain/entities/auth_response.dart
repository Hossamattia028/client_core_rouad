import 'package:client_core/features/domain/entities/fetch_states.dart';
import 'package:client_core/features/domain/entities/user_entity.dart';



class AuthResponse{
  FetchStates? state;
  String? msg;
  UserService? user;

  AuthResponse({this.state,this.msg, this.user});
}
