
import 'package:client_core/features/data/data_sources/user_service_remote_data_source.dart';
import 'package:client_core/features/data/repositories/user_service_model_repository.dart';
import 'package:client_core/features/domain/repositories/user_service_repository.dart';
import 'package:client_core/features/domain/use_cases/user_usecase/get_user_service_usecase.dart';
import 'package:client_core/features/domain/use_cases/user_usecase/login_user_usecase.dart';
import 'package:client_core/features/domain/use_cases/user_usecase/logout_user_usecase.dart';
import 'package:client_core/features/domain/use_cases/user_usecase/register_user_usecase.dart';
import 'package:client_core/features/domain/use_cases/user_usecase/update_user_usecase.dart';
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //controller
  sl.registerFactory(() => AuthBloc(
      getUserServiceUseCase: sl(),
      loginUserServiceUseCase: sl(),
      registerUserServiceUseCase: sl(),));


  sl.registerLazySingleton(() => GetUserServiceUseCase(userServiceRepository: sl()));
  sl.registerLazySingleton(() => RegisterUserServiceUseCase(userServiceRepository: sl()));
  sl.registerLazySingleton(() => LoginUserServiceUseCase(userServiceRepository: sl()));
  sl.registerLazySingleton(() => LogoutUserServiceUseCase(userServiceRepository: sl()));
  sl.registerLazySingleton(() => UpdateUserServiceUseCase(userServiceRepository: sl()));

  sl.registerLazySingleton<UserServiceRepository>(() => UserServiceModelRepository(networkInfo: sl(), userServiceRemoteDataSource: sl()));
  sl.registerLazySingleton<UserServiceRemoteDataSource>(() => UserServiceRemoteDataSource(client: sl()));


  sl.registerLazySingleton(() => http.Client());
}

