import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import 'features/home/presentation/cubit/locale_cubit.dart';
import 'router/app_router.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // register AppRuter in GetIt
    GetIt.instance.registerSingleton<AppRouter>(AppRouter());

    runApp(MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(create: (context) => LocaleCubit()),
      ],
      child: MyApp(),
    ));
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = GetIt.instance<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          title: 'テクトJP',
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          theme: ThemeData(
            fontFamily: 'Poppins',
            colorSchemeSeed: Colors.blue,
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
        );
      },
    );
  }
}
