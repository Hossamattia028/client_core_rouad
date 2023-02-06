import 'package:client_core/features/domain/entities/auth_response.dart';
import 'package:client_core/features/domain/entities/fetch_states.dart';
import 'package:client_core/features/domain/entities/user_entity.dart';
import 'package:client_core/features/domain/use_cases/user_usecase/get_user_service_usecase.dart';
import 'package:client_core/features/domain/use_cases/user_usecase/login_user_usecase.dart';
import 'package:client_core/features/domain/use_cases/user_usecase/register_user_usecase.dart';
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_event.dart';
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  FetchStates currentState = FetchStates.SUCCESSFULLY;
  LoginUserServiceUseCase loginUserServiceUseCase;
  RegisterUserServiceUseCase registerUserServiceUseCase;
  GetUserServiceUseCase getUserServiceUseCase;

  bool showPassword = false;
  UserService? currentUser;


  static AuthBloc get(BuildContext context) => BlocProvider.of(context);

  AuthBloc({required this.getUserServiceUseCase, required this.registerUserServiceUseCase,
    required this.loginUserServiceUseCase,}) : super(AuthInitialState()) {
    on<RegisterEvent>((event, emit) async{
      await register(event, emit);
    });

    on<LogInEvent>((event, emit) async{
      await logIn(event, emit);
    });

    on<ChangePasswordEvent>((event, emit) {
      changePasswordEvent(emit);
    });

    on<EnableCompleteRegisterEvent>((event, emit) {
      // setEnableCompleteRegister(event, emit);
    });

    on<SetCurrentUserEvent>((event, emit)async {
      await updateUser(event,emit);
    });

    on<LogOutEvent>((event, emit) {
      logOut();
      emit(LogOutState());
    });

    on<SendVerifyEmailEvent>((event, emit) async{
      await sendVerifyEmail(event,emit);
    });

    on<ConfirmChangePasswordEvent>((event, emit) async{
      // await changeFirebasePassword(event,emit);
    });

  }




  sendVerifyEmail(event,emit)async{
    var code = DateTime.now().millisecond.toString().substring(0,2).toString() + DateTime.now().minute.toString().substring(0,1)+DateTime.now().second.toString().substring(0,1)+DateTime.now().millisecondsSinceEpoch.toString().substring(0,2).toString();
    // SharedPref.preferences.setPreferencesString(Constants.lastVerificationCode,code);
    // await SendGmail.sendEmailMessage("Verification Code: $code", event.email.toString(), "");
    emit(RegisterSuccessfullyState(response: AuthResponse(state: FetchStates.SUCCESSFULLY,msg: translate("toast.successfully_send"))));
  }


  updateUser(event,emit)async{
    currentUser = event.userModel;
    if(currentUser!=null)emit(SetCurrentUserState(user: currentUser!));
  }

  // bool enableCompleteRegister = false;
  // setEnableCompleteRegister(event, emit){
  //   enableCompleteRegister = event.enableCompleteRegister;
  //   emit(EnableCompleteRegisterState(enableCompleteRegister: enableCompleteRegister));
  // }

  register(event, emit)async{
    currentState = FetchStates.LOADING;
    emit(RegisterSuccessfullyState(response: AuthResponse(state: currentState)));
    String resMsg = "";
    try{
      var res = await registerUserServiceUseCase(userData: event.data);
      res.fold((l) {
        currentState = FetchStates.FAILED;
        resMsg = l.toString();
      },(data) {
        currentUser = data;
        currentState = FetchStates.SUCCESSFULLY;
      });
    }catch(e){
      debugPrint("registerError: $e");
      currentState = FetchStates.FAILED;
    }
    emit(RegisterSuccessfullyState(response: AuthResponse(state: currentState,msg: resMsg)));
  }


  logIn(event, emit)async{
    emit(LogInSuccessfullyState(response: AuthResponse(state: currentState)));
    String resMsg = "";
    try{
      var res = await loginUserServiceUseCase(email: event.email,password: event.password);
      res.fold((l) {
        currentState = FetchStates.FAILED;
        resMsg = l.toString();
      },(data) {
        currentUser = data;
        currentState = FetchStates.SUCCESSFULLY;
      });
    }catch(e){
      debugPrint("logInError: $e");
      currentState = FetchStates.FAILED;
    }
    emit(LogInSuccessfullyState(response: AuthResponse(state: currentState,msg: resMsg)));
  }


  logOut()async{}

  changePasswordEvent(emit){
    showPassword = !showPassword;
    emit(ChangePasswordState(showPass: showPassword));
  }

}