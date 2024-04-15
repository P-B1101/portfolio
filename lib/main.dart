import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/utils/assets.dart';
import 'feature/home/presentation/bloc/education_bloc.dart';
import 'feature/home/presentation/bloc/export_bloc.dart';
import 'feature/home/presentation/bloc/info_bloc.dart';
import 'feature/home/presentation/bloc/job_experience_bloc.dart';
import 'feature/home/presentation/bloc/profession_bloc.dart';
import 'feature/home/presentation/bloc/project_bloc.dart';
import 'feature/home/presentation/bloc/skill_bloc.dart';
import 'feature/home/presentation/bloc/software_bloc.dart';
import 'feature/home/presentation/page/home_page.dart';
import 'feature/language/domain/entities/app_language.dart';
import 'feature/language/presentation/cubit/language_cubit.dart';
import 'feature/language/presentation/widgets/language_widget.dart';
import 'feature/language/presentation/widgets/switcher_widget.dart';
import 'feature/language/utils/local_language.dart';
import 'feature/provider/presentation/widgets/app_provider.dart';
import 'feature/theme/domain/entiries/app_theme.dart';
import 'feature/theme/presentation/cubit/theme_cubit.dart';
import 'feature/theme/presentation/widgets/theme_widget.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => getIt<ThemeCubit>(),
        ),
        BlocProvider<EducationBloc>(
          create: (context) => getIt<EducationBloc>(),
        ),
        BlocProvider<InfoBloc>(
          create: (context) => getIt<InfoBloc>(),
        ),
        BlocProvider<JobExperienceBloc>(
          create: (context) => getIt<JobExperienceBloc>(),
        ),
        BlocProvider<ProfessionBloc>(
          create: (context) => getIt<ProfessionBloc>(),
        ),
        BlocProvider<ProjectBloc>(
          create: (context) => getIt<ProjectBloc>(),
        ),
        BlocProvider<SkillBloc>(
          create: (context) => getIt<SkillBloc>(),
        ),
        BlocProvider<SoftwareBloc>(
          create: (context) => getIt<SoftwareBloc>(),
        ),
        BlocProvider<ExportBloc>(
          create: (context) => getIt<ExportBloc>(),
        ),
        BlocProvider<LanguageCubit>(
          create: (context) => getIt<LanguageCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
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
          child: _materialApp(
            language: language,
            theme: theme,
          ),
        ),
      ),
    );
  }

  Widget _materialApp({
    required AppLanguage language,
    required AppTheme theme,
  }) =>
      MaterialApp(
        onGenerateTitle: (context) => Strings.of(context).app_title,
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
          fontFamily: language.isFa ? Fonts.yekan : Fonts.poppins,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: MyColors.textColor),
            titleMedium: TextStyle(color: MyColors.subtitleColor),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: MyColors.primaryColor,
            brightness: Brightness.dark,
          ).copyWith(background: MyColors.secondBackgroundColor),
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
            data: data.copyWith(textScaler: const TextScaler.linear(1.1)),
            child: AppProvider(
              child: LanguageSwitcherWidget(
                language: language.language,
                child: child!,
              ),
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

  Widget get _homePage => const HomePage();

  Widget get _pageNotFound => Scaffold(
        body: Builder(
          builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height,
          ),
        ),
      );
}
