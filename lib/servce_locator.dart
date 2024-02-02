import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ui_task_assignments/core/network/network_info.dart';
import 'package:ui_task_assignments/core/sevices/shared_prefs.dart';
import 'package:ui_task_assignments/core/utils/themes/bloc/theme_bloc.dart';

GetIt locator = GetIt.instance;

setUpLocator() async {
  //BLoC

  locator.registerFactory(() => ThemeBloc());

  //Usecase

  //Repository

  //DataSource

  //Network Info
  locator
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  //InternetConnectionChecker
  locator.registerLazySingleton(() => InternetConnectionChecker());

  //SharedPreference
  locator.registerLazySingleton<PreferenceHelper>(() => PreferenceHelper());
}
