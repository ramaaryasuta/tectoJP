import 'package:get_it/get_it.dart';
import 'package:tectojp/core/injections/quiz_injection.dart';

import 'features/home/presentation/cubit/locale_cubit.dart';
import 'router/app_router.dart';

var appInjection = GetIt.instance;

Future<void> initAppInjection() async {
  // AppLevel
  appInjection.registerSingleton<AppRouter>(AppRouter());
  appInjection.registerFactory<LocaleCubit>(() => LocaleCubit());

  // Feature Injection
  quizInjection(appInjection);
}
