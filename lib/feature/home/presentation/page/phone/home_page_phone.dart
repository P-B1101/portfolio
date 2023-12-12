import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../widget/info_widget.dart';
import '../../widget/job_experience_widget.dart';
import '../../widget/project_widget.dart';
import '../../widget/qr_widget.dart';
import '../../widget/skill_widget.dart';
import '../../widget/slogan_widget.dart';
import '../../widget/software_widget.dart';
import '../../widget/title_widget.dart';

class HomePagePhone extends StatelessWidget {
  const HomePagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // UserImageWidget(
                      //   size: MediaQuery.sizeOf(context).width * .4,
                      // ),
                      SizedBox(height: 24),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InfoWidget(mainTextSize: 24),
                            SizedBox(height: 4),
                            SloganWidget(textSize: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 1,
                    margin: const EdgeInsetsDirectional.only(top: 4, start: 24),
                    color: Theme.of(context).primaryColor,
                  ),
                  BlocBuilder<EducationBloc, EducationState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 24,
                        start: 24,
                      ),
                      child: TitleWidget(
                        textSize: 20,
                        title: state.items.isEmpty
                            ? null
                            : Strings.of(context).educational_title,
                      ),
                    ),
                  ),
                  BlocBuilder<EducationBloc, EducationState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 24,
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 6),
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
                            lineWidth: 80,
                            education: state.items[index],
                            textSize: 16,
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
                        top: 16,
                        start: 24,
                      ),
                      child: TitleWidget(
                        textSize: 20,
                        title: state.items.isEmpty
                            ? null
                            : Strings.of(context).job_experiences_title,
                      ),
                    ),
                  ),
                  BlocBuilder<JobExperienceBloc, JobExperienceState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 24,
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 6),
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
                            lineWidth: 80,
                            experience: state.items[index],
                            textSize: 16,
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
                        top: 16,
                        start: 24,
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
                        start: 24,
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 6),
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
                            isSmallScreen: true,
                            lineWidth: 80,
                            project: state.items[index],
                            textSize: 18,
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
                        top: 16,
                        start: 24,
                      ),
                      child: TitleWidget(
                        textSize: 20,
                        title: state.items.isEmpty
                            ? null
                            : Strings.of(context).skills_title,
                      ),
                    ),
                  ),
                  BlocBuilder<SkillBloc, SkillState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 24,
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 6),
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
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: SkillWidget(
                              skill: state.items[index],
                              textSize: 18,
                              index: index + 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<SoftwareBloc, SoftwareState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 16,
                        start: 24,
                      ),
                      child: TitleWidget(
                        textSize: 20,
                        title: state.items.isEmpty
                            ? null
                            : Strings.of(context).software_title,
                      ),
                    ),
                  ),
                  BlocBuilder<SoftwareBloc, SoftwareState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 24,
                      ),
                      child: SoftwareWidget(
                        items: state.items,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SizedBox(height: 24),
                  BlocBuilder<InfoBloc, InfoState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 16,
                        start: 24,
                        bottom: 16,
                      ),
                      child: TitleWidget(
                        textSize: 20,
                        title: state.info == null
                            ? null
                            : Strings.of(context).liked_my_work_title,
                      ),
                    ),
                  ),
                  BlocBuilder<InfoBloc, InfoState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 24,
                      ),
                      child: ContactMeWidget(info: state.info),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        BlocBuilder<InfoBloc, InfoState>(
                          builder: (context, state) => Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 16,
                              start: 24,
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
                              top: 16,
                              start: 24,
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
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
