import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/utils/enum.dart';
import '../../../../injection_container.dart';
import '../../../language/utils/local_language.dart';
import '../../../toast/presentation/manager/toast_manager.dart';
import '../bloc/education_bloc.dart';
import '../bloc/export_bloc.dart';
import '../bloc/info_bloc.dart';
import '../bloc/job_experience_bloc.dart';
import '../bloc/profession_bloc.dart';
import '../bloc/project_bloc.dart';
import '../bloc/skill_bloc.dart';
import '../bloc/software_bloc.dart';
import 'home_page_main.dart';

class HomePage extends StatefulWidget {
  static const pageRoute = 'home';
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<EducationBloc>().add(GetEducationsEvent());
      context.read<InfoBloc>().add(GetInfoEvent());
      context.read<JobExperienceBloc>().add(GetJobExperienceEvent());
      context.read<ProfessionBloc>().add(GetProfessionEvent());
      context.read<ProjectBloc>().add(GetProjectEvent());
      context.read<SkillBloc>().add(GetSkillEvent());
      context.read<SoftwareBloc>().add(GetSoftwareEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EducationBloc, EducationState>(
          listener: (context, state) {
            if (state is EducationFailureState) {
              _showError(
                message: state.message,
                number: 1001,
              );
            }
          },
        ),
        BlocListener<InfoBloc, InfoState>(
          listener: (context, state) {
            if (state is InfoFailureState) {
              _showError(
                message: state.message,
                number: 1002,
              );
            }
          },
        ),
        BlocListener<JobExperienceBloc, JobExperienceState>(
          listener: (context, state) {
            if (state is JobExperienceFailureState) {
              _showError(
                message: state.message,
                number: 1003,
              );
            }
          },
        ),
        BlocListener<ProfessionBloc, ProfessionState>(
          listener: (context, state) {
            if (state is ProfessionFailureState) {
              _showError(
                message: state.message,
                number: 1004,
              );
            }
          },
        ),
        BlocListener<ProjectBloc, ProjectState>(
          listener: (context, state) {
            if (state is ProjectFailureState) {
              _showError(
                message: state.message,
                number: 1005,
              );
            }
          },
        ),
        BlocListener<SkillBloc, SkillState>(
          listener: (context, state) {
            if (state is SkillFailureState) {
              _showError(
                message: state.message,
                number: 1006,
              );
            }
          },
        ),
        BlocListener<SoftwareBloc, SoftwareState>(
          listener: (context, state) {
            if (state is SoftwareFailureState) {
              _showError(
                message: state.message,
                number: 1007,
              );
            }
          },
        ),
        BlocListener<ExportBloc, ExportState>(
          listener: (context, state) {
            if (state is SoftwareFailureState) {
              _showError(number: 1008);
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: HomePageMain(
          onExportClick: _onExportClick,
          screenshotController: screenshotController,
        ),
      ),
    );
  }

  void _onExportClick() async {
    context
        .read<ExportBloc>()
        .add(RequestExportEvent(controller: screenshotController));
  }

  void _showError({
    String? message,
    required int? number,
  }) {
    sl<ToastManager>().showToast(
      context: context,
      message: message ?? Strings.of(context).general_error,
      number: number,
      state: ToastState.error,
    );
  }
}
