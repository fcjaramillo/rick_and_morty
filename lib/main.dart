import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/cubit/ram_cubit.dart';
import 'package:rick_and_morty/core/dependencies/database_provider.dart';
import 'package:rick_and_morty/core/dependencies/ram_providers.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/ui/screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(databaseProvider).initDB();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RamCubit(
            ramRepository: ref.watch(
              ramRepositoryProvider,
            ),
          ),
        ),
      ],
      child: MaterialApp(
        home: const WelcomeScreen(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          I18n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: I18n.delegate.supportedLocales,
      ),
    );
  }
}
