import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/feature/home/presentation/widget/export_widget.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../grid/presentation/widget/grid_widget.dart';
import '../../../../language/utils/local_language.dart';
import '../../bloc/education_bloc.dart';
import '../../bloc/info_bloc.dart';
import '../../bloc/job_experience_bloc.dart';
import '../../bloc/project_bloc.dart';
import '../../bloc/skill_bloc.dart';
import '../../bloc/software_bloc.dart';
import '../../widget/contact_me_widget.dart';
import '../../widget/education_widget.dart';
import '../../widget/info_widget.dart';
import '../../widget/job_experience_widget.dart';
import '../../widget/project_widget.dart';
import '../../widget/qr_widget.dart';
import '../../widget/skill_widget.dart';
import '../../widget/slogan_widget.dart';
import '../../widget/software_widget.dart';
import '../../widget/title_widget.dart';
import '../../widget/user_image_widget.dart';

class HomePageWindow extends StatelessWidget {
  final Function() onExportClick;
  final ScreenshotController screenshotController;
  const HomePageWindow({
    Key? key,
    required this.onExportClick,
    required this.screenshotController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final margin = MediaQuery.of(context).size.width - 1024;
        return SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Screenshot(
              controller: screenshotController,
              child: Container(
                alignment: Alignment.topCenter,
                color: Theme.of(context).scaffoldBackgroundColor,
                margin: EdgeInsets.only(
                  left: margin.abs() * .5,
                  right: margin.abs() * .5,
                ),
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const UserImageWidget(size: 250),
                        const SizedBox(width: 24),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InfoWidget(mainTextSize: 26),
                              SizedBox(height: 32),
                              SloganWidget(textSize: 18),
                            ],
                          ),
                        ),
                        ExportWidget(onExportClick: onExportClick),
                      ],
                    ),
                    BlocBuilder<EducationBloc, EducationState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 36,
                          start: 32,
                        ),
                        child: TitleWidget(
                          textSize: 24,
                          title: state.items.isEmpty
                              ? null
                              : Strings.of(context).educational_title,
                        ),
                      ),
                    ),
                    BlocBuilder<EducationBloc, EducationState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 32,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.items.length,
                          itemBuilder: (context, index) => EducationWidget(
                            lineWidth: 120,
                            education: state.items[index],
                            textSize: 22,
                            index: index + 1,
                            isLast: index == state.items.length - 1,
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<JobExperienceBloc, JobExperienceState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 24,
                          start: 32,
                        ),
                        child: TitleWidget(
                          textSize: 24,
                          title: state.items.isEmpty
                              ? null
                              : Strings.of(context).job_experiences_title,
                        ),
                      ),
                    ),
                    BlocBuilder<JobExperienceBloc, JobExperienceState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 32,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.items.length,
                          itemBuilder: (context, index) => JobExperienceWidget(
                            lineWidth: 120,
                            experience: state.items[index],
                            textSize: 22,
                            index: index + 1,
                            isLast: index == state.items.length - 1,
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<ProjectBloc, ProjectState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 24,
                          start: 32,
                        ),
                        child: TitleWidget(
                          textSize: 24,
                          title: state.items.isEmpty
                              ? null
                              : Strings.of(context).projects_title,
                        ),
                      ),
                    ),
                    BlocBuilder<ProjectBloc, ProjectState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 32,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.items.length,
                          itemBuilder: (context, index) => ProjectWidget(
                            lineWidth: 120,
                            project: state.items[index],
                            textSize: 22,
                            index: index + 1,
                            isLast: index == state.items.length - 1,
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<SkillBloc, SkillState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 24,
                          start: 32,
                        ),
                        child: TitleWidget(
                          textSize: 24,
                          title: state.items.isEmpty
                              ? null
                              : Strings.of(context).skills_title,
                        ),
                      ),
                    ),
                    BlocBuilder<SkillBloc, SkillState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 32,
                        ),
                        child: GridWidget(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          children: List.generate(
                            state.items.length,
                            (index) => Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: SkillWidget(
                                skill: state.items[index],
                                textSize: 22,
                                index: index + 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    BlocBuilder<SoftwareBloc, SoftwareState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 24,
                          start: 32,
                        ),
                        child: TitleWidget(
                          textSize: 24,
                          title: state.items.isEmpty
                              ? null
                              : Strings.of(context).software_title,
                        ),
                      ),
                    ),
                    BlocBuilder<SoftwareBloc, SoftwareState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 32,
                        ),
                        child: SoftwareWidget(
                          items: state.items,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const SizedBox(height: 32),
                    BlocBuilder<InfoBloc, InfoState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 24,
                          start: 32,
                          bottom: 24,
                        ),
                        child: TitleWidget(
                          textSize: 24,
                          title: state.info == null
                              ? null
                              : Strings.of(context).liked_my_work_title,
                        ),
                      ),
                    ),
                    BlocBuilder<InfoBloc, InfoState>(
                      builder: (context, state) => Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 32,
                        ),
                        child: ContactMeWidget(info: state.info),
                      ),
                    ),
                    Row(
                      children: [
                        BlocBuilder<InfoBloc, InfoState>(
                          builder: (context, state) => Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 24,
                              start: 32,
                            ),
                            child: state.info == null ||
                                    !state.info!.hasLinkedInUrl
                                ? null
                                : QRWidget(
                                    title: Strings.of(context)
                                        .linked_in_link_label,
                                    url: state.info!.linkedInUrl,
                                  ),
                          ),
                        ),
                        BlocBuilder<InfoBloc, InfoState>(
                          builder: (context, state) => Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 24,
                              start: 32,
                            ),
                            child: state.info == null ||
                                    !state.info!.hasPortfolioUrl
                                ? null
                                : QRWidget(
                                    title: Strings.of(context)
                                        .portfolio_link_label,
                                    url: state.info!.portfolioUrl,
                                  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
