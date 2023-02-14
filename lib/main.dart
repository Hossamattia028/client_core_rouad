import 'dart:io';
import 'package:background_locator/background_locator.dart';
import 'package:client_core/core/config/bloc_classes.dart';
import 'package:client_core/core/config/init_hive_boxes_configuration.dart';
import 'package:client_core/core/util/hive_boxes.dart';
import 'package:client_core/core/util/set_notification.dart';
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:client_core/features/presentation/screens/account/account_screen.dart';
import 'package:client_core/features/presentation/screens/account/edit_profile_screen.dart';
import 'package:client_core/features/presentation/screens/account/profile_screen.dart';
import 'package:client_core/features/presentation/screens/auth/login.dart';
import 'package:client_core/features/presentation/screens/auth/register.dart';
import 'package:client_core/features/presentation/screens/auth/verification_code.dart';
import 'package:client_core/features/presentation/screens/check_out/check_out_screen.dart';
import 'package:client_core/features/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:client_core/features/presentation/screens/deals/deals_screen.dart';
import 'package:client_core/features/presentation/screens/favourite/favourite_screen.dart';
import 'package:client_core/features/presentation/screens/home/home_screen.dart';
import 'package:client_core/features/presentation/screens/invoice/invoice_screen.dart';
import 'package:client_core/features/presentation/screens/locations/my_locations.dart';
import 'package:client_core/features/presentation/screens/maps/add_location.dart';
import 'package:client_core/features/presentation/screens/maps/set_and_get_coordinates.dart';
import 'package:client_core/features/presentation/screens/notifications/allow_notification.dart';
import 'package:client_core/features/presentation/screens/notifications/notifications_screen.dart';
import 'package:client_core/features/presentation/screens/order/order_screen.dart';
import 'package:client_core/features/presentation/screens/order/order_tracking.dart';
import 'package:client_core/features/presentation/screens/rating/rating_screen.dart';
import 'package:client_core/features/presentation/screens/service/service_details.dart';
import 'package:client_core/features/presentation/screens/wallet/wallet_screen.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/error_widget.dart';
import 'package:client_core/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'injection_container.dart' as di;


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await SetNotification.setupFlutterNotifications();
  SetNotification.showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  debugPrint('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await SetNotification.setupFlutterNotifications();
  // if (Platform.isIOS) FirebaseMessaging.instance.requestPermission(alert: true);
  // // Set the background messaging handler early on, as a named top-level function
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await di.init();
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await InitHiveBoxesConfiguration.initHiveBoxes();
  BackgroundLocator.initialize();
  var delegate = await LocalizationDelegate.create(fallbackLocale: 'ar', supportedLocales: ['ar','en_US']);
  runApp(LocalizedApp(delegate, const MyApp()));
}

class MyApp extends StatelessWidget {
  final bool isRoot;
  const MyApp({super.key,this.isRoot=true});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context,widget)  => MultiBlocProvider(
          providers: [
            // BlocProvider(create: (context) => RootBloc()),
            BlocProvider(create: (_) => di.sl<AuthBloc>()),
            // BlocProvider(create: (context) => CategoriesBloc()..add(const FetchAllCategoriesEvent())),
            // BlocProvider(create: (context) => OrderBloc()..add(const FetchAllOrderEvent())),
            // BlocProvider(create: (context) => AccountBloc()),
          ],
          child: LocalizationProvider(
            state: LocalizationProvider.of(context).state,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                localizationDelegate
              ],
              supportedLocales: localizationDelegate.supportedLocales,
              locale: HiveBoxes.getUserLng()=="ar"?localizationDelegate.supportedLocales.last:localizationDelegate.supportedLocales.first,
              builder: (BuildContext? context, Widget? widget) {
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  return CustomError(errorDetails: errorDetails);
                };
                return widget!;
              },
              title: 'Client Core',
              home: const AddLocationScreen()
              // home: isRoot==false ? const RootScreen() : const SplashScreen(),
            ),
          ),
        )
    );
  }
}

