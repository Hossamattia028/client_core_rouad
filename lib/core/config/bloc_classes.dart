
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BlocProvidersList {
  static  List<BlocProvider> getProviders(GetIt sl){
    return [
      // BlocProvider(create: (context) => RootBloc()),
      BlocProvider(create: (context) => sl<AuthBloc>()),
      // BlocProvider(create: (context) => CategoriesBloc()..add(const FetchAllCategoriesEvent())),
      // BlocProvider(create: (context) => OrderBloc()..add(const FetchAllOrderEvent())),
      // BlocProvider(create: (context) => AccountBloc()),
    ];
  }

}
