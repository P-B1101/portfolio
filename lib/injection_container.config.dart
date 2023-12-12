// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:file_picker/file_picker.dart' as _i6;
import 'package:file_saver/file_saver.dart' as _i7;
import 'package:fluttertoast/fluttertoast.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:portfolio/feature/api/manager/api_caller.dart' as _i3;
import 'package:portfolio/feature/api/manager/my_client.dart' as _i9;
import 'package:portfolio/feature/home/data/data_source/home_data_source.dart'
    as _i8;
import 'package:portfolio/feature/home/data/repository/home_repository_impl.dart'
    as _i25;
import 'package:portfolio/feature/home/domain/repository/home_repository.dart'
    as _i24;
import 'package:portfolio/feature/home/domain/use_case/get_educations.dart'
    as _i29;
import 'package:portfolio/feature/home/domain/use_case/get_info.dart' as _i30;
import 'package:portfolio/feature/home/domain/use_case/get_job_experiences.dart'
    as _i31;
import 'package:portfolio/feature/home/domain/use_case/get_profession.dart'
    as _i32;
import 'package:portfolio/feature/home/domain/use_case/get_projects.dart'
    as _i33;
import 'package:portfolio/feature/home/domain/use_case/get_skils.dart' as _i34;
import 'package:portfolio/feature/home/domain/use_case/get_softwares.dart'
    as _i35;
import 'package:portfolio/feature/home/domain/use_case/request_for_export.dart'
    as _i27;
import 'package:portfolio/feature/home/presentation/bloc/education_bloc.dart'
    as _i42;
import 'package:portfolio/feature/home/presentation/bloc/export_bloc.dart'
    as _i28;
import 'package:portfolio/feature/home/presentation/bloc/info_bloc.dart'
    as _i36;
import 'package:portfolio/feature/home/presentation/bloc/job_experience_bloc.dart'
    as _i37;
import 'package:portfolio/feature/home/presentation/bloc/profession_bloc.dart'
    as _i38;
import 'package:portfolio/feature/home/presentation/bloc/project_bloc.dart'
    as _i39;
import 'package:portfolio/feature/home/presentation/bloc/skill_bloc.dart'
    as _i40;
import 'package:portfolio/feature/home/presentation/bloc/software_bloc.dart'
    as _i41;
import 'package:portfolio/feature/language/data/data_sources/language_data_source.dart'
    as _i17;
import 'package:portfolio/feature/language/data/repository/language_repository_impl.dart'
    as _i19;
import 'package:portfolio/feature/language/domain/repository/language_repository.dart'
    as _i18;
import 'package:portfolio/feature/language/domain/use_cases/get_app_language.dart'
    as _i23;
import 'package:portfolio/feature/language/domain/use_cases/set_app_language.dart'
    as _i20;
import 'package:portfolio/feature/language/presentation/cubit/language_cubit.dart'
    as _i26;
import 'package:portfolio/feature/repository_manager/repository_manager.dart'
    as _i10;
import 'package:portfolio/feature/theme/data/data_sources/theme_data_source.dart'
    as _i12;
import 'package:portfolio/feature/theme/data/repository/theme_repository_impl.dart'
    as _i14;
import 'package:portfolio/feature/theme/domain/repository/theme_repository.dart'
    as _i13;
import 'package:portfolio/feature/theme/domain/use_cases/get_app_theme.dart'
    as _i16;
import 'package:portfolio/feature/theme/domain/use_cases/set_app_theme.dart'
    as _i21;
import 'package:portfolio/feature/theme/presentation/cubit/theme_cubit.dart'
    as _i22;
import 'package:portfolio/feature/toast/presentation/manager/toast_manager.dart'
    as _i15;
import 'package:portfolio/injection_container.dart' as _i43;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerHttpClient = _$RegisterHttpClient();
    final registerFToast = _$RegisterFToast();
    final registerFilePicker = _$RegisterFilePicker();
    final registerFileSaver = _$RegisterFileSaver();
    final registerSharedPref = _$RegisterSharedPref();
    gh.lazySingleton<_i3.ApiCaller>(() => _i3.ApiCallerImpl());
    gh.lazySingleton<_i4.Client>(() => registerHttpClient.client);
    gh.lazySingleton<_i5.FToast>(() => registerFToast.tosat);
    gh.lazySingleton<_i6.FilePicker>(() => registerFilePicker.tosat);
    gh.factory<_i7.FileSaver>(() => registerFileSaver.tosat);
    gh.lazySingleton<_i8.HomeDataSource>(() => _i8.HomeDataSourceImpl(
          picker: gh<_i6.FilePicker>(),
          fileSaver: gh<_i7.FileSaver>(),
          apiCaller: gh<_i3.ApiCaller>(),
        ));
    gh.lazySingleton<_i9.MyClient>(() => _i9.MyClient(gh<_i4.Client>()));
    gh.lazySingleton<_i10.RepositoryHelper>(
        () => const _i10.RepositoryHelperImpl());
    await gh.lazySingletonAsync<_i11.SharedPreferences>(
      () => registerSharedPref.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i12.ThemeDataSource>(() =>
        _i12.ThemeDataSourceImpl(localStorage: gh<_i11.SharedPreferences>()));
    gh.lazySingleton<_i13.ThemeRepository>(
        () => _i14.ThemeRepositoryImpl(dataSource: gh<_i12.ThemeDataSource>()));
    gh.lazySingleton<_i15.ToastManager>(
        () => _i15.ToastManagerImpl(fToast: gh<_i5.FToast>()));
    gh.lazySingleton<_i16.GetAppTheme>(
        () => _i16.GetAppTheme(repository: gh<_i13.ThemeRepository>()));
    gh.lazySingleton<_i17.LanguageDataSource>(() => _i17.LanguageDataSourceImpl(
        localStorage: gh<_i11.SharedPreferences>()));
    gh.lazySingleton<_i18.LanguageRepository>(() =>
        _i19.LanguageRepositoryImpl(dataSource: gh<_i17.LanguageDataSource>()));
    gh.lazySingleton<_i20.SetAppLanguage>(
        () => _i20.SetAppLanguage(repository: gh<_i18.LanguageRepository>()));
    gh.lazySingleton<_i21.SetAppTheme>(
        () => _i21.SetAppTheme(repository: gh<_i13.ThemeRepository>()));
    gh.factory<_i22.ThemeCubit>(() => _i22.ThemeCubit(
          getAppTheme: gh<_i16.GetAppTheme>(),
          setAppTheme: gh<_i21.SetAppTheme>(),
        ));
    gh.lazySingleton<_i23.GetAppLanguage>(
        () => _i23.GetAppLanguage(repository: gh<_i18.LanguageRepository>()));
    gh.lazySingleton<_i24.HomeRepository>(() => _i25.HomeRepositoryImpl(
          dataSource: gh<_i8.HomeDataSource>(),
          languageDataSource: gh<_i17.LanguageDataSource>(),
          repositoryHelper: gh<_i10.RepositoryHelper>(),
        ));
    gh.factory<_i26.LanguageCubit>(() => _i26.LanguageCubit(
          getAppLanguage: gh<_i23.GetAppLanguage>(),
          setAppLanguage: gh<_i20.SetAppLanguage>(),
        ));
    gh.lazySingleton<_i27.RequestForExport>(
        () => _i27.RequestForExport(repository: gh<_i24.HomeRepository>()));
    gh.factory<_i28.ExportBloc>(
        () => _i28.ExportBloc(requestForExport: gh<_i27.RequestForExport>()));
    gh.lazySingleton<_i29.GetEducations>(
        () => _i29.GetEducations(repository: gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i30.GetInfo>(
        () => _i30.GetInfo(repository: gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i31.GetJobExperiences>(
        () => _i31.GetJobExperiences(repository: gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i32.GetProfession>(
        () => _i32.GetProfession(repository: gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i33.GetProjects>(
        () => _i33.GetProjects(repository: gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i34.GetSkills>(
        () => _i34.GetSkills(repository: gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i35.GetSoftwares>(
        () => _i35.GetSoftwares(repository: gh<_i24.HomeRepository>()));
    gh.factory<_i36.InfoBloc>(() => _i36.InfoBloc(getInfo: gh<_i30.GetInfo>()));
    gh.factory<_i37.JobExperienceBloc>(() => _i37.JobExperienceBloc(
        getJobExperiences: gh<_i31.GetJobExperiences>()));
    gh.factory<_i38.ProfessionBloc>(
        () => _i38.ProfessionBloc(getProfession: gh<_i32.GetProfession>()));
    gh.factory<_i39.ProjectBloc>(
        () => _i39.ProjectBloc(getProjects: gh<_i33.GetProjects>()));
    gh.factory<_i40.SkillBloc>(
        () => _i40.SkillBloc(getSkills: gh<_i34.GetSkills>()));
    gh.factory<_i41.SoftwareBloc>(
        () => _i41.SoftwareBloc(getSoftwares: gh<_i35.GetSoftwares>()));
    gh.factory<_i42.EducationBloc>(
        () => _i42.EducationBloc(getEducations: gh<_i29.GetEducations>()));
    return this;
  }
}

class _$RegisterHttpClient extends _i43.RegisterHttpClient {}

class _$RegisterFToast extends _i43.RegisterFToast {}

class _$RegisterFilePicker extends _i43.RegisterFilePicker {}

class _$RegisterFileSaver extends _i43.RegisterFileSaver {}

class _$RegisterSharedPref extends _i43.RegisterSharedPref {}
