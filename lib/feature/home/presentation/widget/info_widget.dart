import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';
import '../../../provider/presentation/widgets/app_provider.dart';
import '../bloc/info_bloc.dart';
import '../bloc/profession_bloc.dart';

class InfoWidget extends StatelessWidget {
  final double mainTextSize;
  const InfoWidget({
    Key? key,
    required this.mainTextSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _nameWidget,
        // const SizedBox(height: 8),
        _professionWidget,
      ],
    );
  }

  Widget get _nameWidget => BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) => AnimatedSize(
          duration: AppProvider.of(context).duration,
          curve: AppProvider.of(context).curve,
          alignment: AlignmentDirectional.centerEnd,
          child: AnimatedSwitcher(
            duration: AppProvider.of(context).duration,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: Text(
              state.info?.getFullName ?? '',
              key: ValueKey(state.info == null ? 0 : 1),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: mainTextSize,
                fontWeight: Fonts.medium500,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      );

  Widget get _professionWidget => BlocBuilder<ProfessionBloc, ProfessionState>(
        builder: (context, state) => AnimatedSize(
          duration: AppProvider.of(context).duration,
          curve: AppProvider.of(context).curve,
          alignment: AlignmentDirectional.centerEnd,
          child: AnimatedSwitcher(
            duration: AppProvider.of(context).duration,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: Text(
              state.profession?.profession ?? '',
              key: ValueKey(state.profession == null ? 0 : 1),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: mainTextSize - 2,
                fontWeight: Fonts.regular400,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ),
      );
}
