import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/feature/home/presentation/bloc/education_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/utils/assets.dart';
import 'feature/home/presentation/page/home_page.dart';
import 'feature/language/domain/entities/app_language.dart';
import 'feature/language/presentation/cubit/language_cubit.dart';
import 'feature/language/presentation/widgets/language_widget.dart';
import 'feature/provider/presentation/widgets/app_provider.dart';
import 'feature/theme/domain/entiries/app_theme.dart';
import 'feature/theme/presentation/cubit/theme_cubit.dart';
import 'feature/theme/presentation/widgets/theme_widget.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  setPathUrlStrategy();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => sl<LanguageCubit>(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => sl<ThemeCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      builder: (language) => ThemeWidget(
        builder: (theme) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: theme.theme == ThemeMode.light
              ? SystemUiOverlayStyle.dark.copyWith(
                  statusBarColor: Colors.transparent,
                )
              : SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Colors.transparent,
                ),
          child: _materialApp(language: language, theme: theme),
        ),
      ),
    );
  }

  Widget _materialApp({
    required AppLanguage language,
    required AppTheme theme,
  }) =>
      MaterialApp(
        title: 'Portfilio',
        debugShowCheckedModeBanner: false,
        themeMode: theme.theme,
        // theme: ThemeData(
        //   primaryColor: MyColors.primaryColor,
        //   scaffoldBackgroundColor: MyColors.backgroundColor,
        //   brightness: Brightness.light,
        //   fontFamily: Fonts.poppins,
        //   textTheme: const TextTheme(
        //     bodyText1: TextStyle(
        //       color: MyColors.textColor,
        //     ),
        //   ),
        // ),
        darkTheme: ThemeData(
          primaryColor: MyColors.primaryColor,
          scaffoldBackgroundColor: MyColors.backgroundColor,
          brightness: Brightness.dark,
          fontFamily: Fonts.poppins,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: MyColors.textColor,
            ),
          ),
        ),
        locale: Locale(language.language),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          Intl.defaultLocale = language.language;
          return Locale(language.language);
        },
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaleFactor: 1.1),
            child: AppProvider(
              child: child!,
            ),
          );
        },
        home: _homePage,
        onGenerateRoute: (RouteSettings settings) {
          final settingsUri = Uri.parse(settings.name!);
          final path = settingsUri.pathSegments;
          final route = path.isNotEmpty ? path[0] : '';
          switch (route) {
            case HomePage.pageRoute:
              return _getRoute(
                page: _homePage,
                settings: settings,
              );
          }
          return _getRoute(
            page: _pageNotFound,
            settings: settings,
          );
        },
      );

  PageRoute _getRoute({
    required Widget page,
    required RouteSettings settings,
  }) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        settings: settings,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = 0.0;
          var end = 1.0;

          var tween = Tween<double>(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            reverseCurve: Curves.easeIn,
            curve: Curves.easeOut,
          );

          return FadeTransition(
            opacity: tween.animate(curvedAnimation),
            child: child,
          );
        },
      );

  Widget get _homePage => MultiBlocProvider(
        providers: [
          BlocProvider<EducationBloc>(
            create: (context) => sl<EducationBloc>(),
          ),
        ],
        child: const HomePage(),
      );

  Widget get _pageNotFound => Scaffold(
        body: Builder(
          builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height,
          ),
        ),
      );
}
