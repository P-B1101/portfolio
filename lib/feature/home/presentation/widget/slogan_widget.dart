import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';
import '../../../provider/presentation/widgets/app_provider.dart';
import '../bloc/profession_bloc.dart';

class SloganWidget extends StatelessWidget {
  final double textSize;
  const SloganWidget({
    Key? key,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionBloc, ProfessionState>(
      builder: (context, state) => AnimatedSize(
        duration: AppProvider.of(context).duration,
        curve: AppProvider.of(context).curve,
        alignment: AlignmentDirectional.centerEnd,
        child: AnimatedSwitcher(
          duration: AppProvider.of(context).duration,
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: Text(
            state.profession?.slogan ?? '',
            key: ValueKey(state.profession == null ? 0 : 1),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: Fonts.light300,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
        ),
      ),
    );
  }
}
