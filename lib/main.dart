import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/home/presentation/cubit/locale_cubit.dart';
import 'features/quiz/presentation/cubit/quiz_cubit.dart';
import 'injection.dart';
import 'router/app_router.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await initAppInjection();

    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => appInjection<LocaleCubit>()),
        BlocProvider(create: (_) => appInjection<QuizCubit>()),
      ],
      child: MyApp(),
    ));
  }, (error, stack) {
    log('error runZonedGuarded', error: error, stackTrace: stack);
  });
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
