import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/feature/home/presentation/bloc/info_bloc.dart';
import 'package:portfolio/feature/home/presentation/bloc/job_experience_bloc.dart';
import 'package:portfolio/feature/home/presentation/bloc/profession_bloc.dart';
import 'package:portfolio/feature/home/presentation/bloc/project_bloc.dart';
import 'package:portfolio/feature/home/presentation/bloc/skill_bloc.dart';
import 'package:portfolio/feature/home/presentation/bloc/software_bloc.dart';

import '../bloc/education_bloc.dart';

class HomePage extends StatefulWidget {
  static const pageRoute = 'home';
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<EducationBloc>().add(GetEducationsEvent());
    context.read<InfoBloc>().add(GetInfoEvent());
    context.read<JobExperienceBloc>().add(GetJobExperienceEvent());
    context.read<ProfessionBloc>().add(GetProfessionEvent());
    context.read<ProjectBloc>().add(GetProjectEvent());
    context.read<SkillBloc>().add(GetSkillEvent());
    context.read<SoftwareBloc>().add(GetSoftwareEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
