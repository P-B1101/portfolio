import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../../core/components/grid_widget.dart';
import '../../../../language/presentation/widgets/language_label_widget.dart';
import '../../../../language/utils/local_language.dart';
import '../../../../provider/presentation/widgets/app_provider.dart';
import '../../bloc/education_bloc.dart';
import '../../bloc/info_bloc.dart';
import '../../bloc/job_experience_bloc.dart';
import '../../bloc/project_bloc.dart';
import '../../bloc/skill_bloc.dart';
import '../../bloc/software_bloc.dart';
import '../../widget/contact_me_widget.dart';
import '../../widget/education_widget.dart';
import '../../widget/export_widget.dart';
import '../../widget/info_widget.dart';
import '../../widget/job_experience_widget.dart';
import '../../widget/project_widget.dart';
import '../../widget/qr_widget.dart';
import '../../widget/skill_widget.dart';
import '../../widget/slogan_widget.dart';
import '../../widget/software_widget.dart';
import '../../widget/title_widget.dart';

class HomePageWindow extends StatelessWidget {
  final Function() onExportClick;
  final Function(String language) onChangeLanguageClick;
  final ScreenshotController screenshotController;
  const HomePageWindow({
    Key? key,
    required this.onExportClick,
    required this.screenshotController,
    required this.onChangeLanguageClick,
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
                        // const UserImageWidget(size: 200),
                        const SizedBox(width: 24),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InfoWidget(mainTextSize: 26),
                              SizedBox(height: 12),
                              SloganWidget(textSize: 18),
                            ],
                          ),
                        ),
                        ExportWidget(onExportClick: onExportClick),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: LanguageLabelWidget(
                            onChangeLanguageClick: onChangeLanguageClick,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 120,
                      height: 1,
                      margin:
                          const EdgeInsetsDirectional.only(top: 4, start: 24),
                      color: Theme.of(context).primaryColor,
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
                          itemBuilder: (context, index) => FadedSlideAnimation(
                            fadeCurve: AppProvider.of(context).curve,
                            fadeDuration: AppProvider.of(context).duration,
                            slideCurve: AppProvider.of(context).curve,
                            slideDuration: AppProvider.of(context).duration,
                            beginOffset: const Offset(0, -.5),
                            endOffset: const Offset(0, 0),
                            child: EducationWidget(
                              lineWidth: 120,
                              education: state.items[index],
                              textSize: 22,
                              index: index + 1,
                              isLast: index == state.items.length - 1,
                            ),
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
                          itemBuilder: (context, index) => FadedSlideAnimation(
                            fadeCurve: AppProvider.of(context).curve,
                            fadeDuration: AppProvider.of(context).duration,
                            slideCurve: AppProvider.of(context).curve,
                            slideDuration: AppProvider.of(context).duration,
                            beginOffset: const Offset(0, -.5),
                            endOffset: const Offset(0, 0),
                            child: JobExperienceWidget(
                              lineWidth: 120,
                              experience: state.items[index],
                              textSize: 22,
                              index: index + 1,
                              isLast: index == state.items.length - 1,
                            ),
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
                          itemBuilder: (context, index) => FadedSlideAnimation(
                            fadeCurve: AppProvider.of(context).curve,
                            fadeDuration: AppProvider.of(context).duration,
                            slideCurve: AppProvider.of(context).curve,
                            slideDuration: AppProvider.of(context).duration,
                            beginOffset: const Offset(0, -.5),
                            endOffset: const Offset(0, 0),
                            child: ProjectWidget(
                              lineWidth: 120,
                              project: state.items[index],
                              textSize: 22,
                              index: index + 1,
                              isLast: index == state.items.length - 1,
                            ),
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
                        BlocBuilder<InfoBloc, InfoState>(
                          builder: (context, state) => Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 24,
                              start: 32,
                            ),
                            child: state.info == null ||
                                    !state.info!.hasGithubUrl
                                ? null
                                : QRWidget(
                                    title:
                                        Strings.of(context).github_link_label,
                                    url: state.info!.githubUrl,
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
