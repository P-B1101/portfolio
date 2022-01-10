import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/feature/provider/presentation/widgets/app_provider.dart';

import '../bloc/info_bloc.dart';

class UserImageWidget extends StatelessWidget {
  final double size;
  const UserImageWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: AspectRatio(
        aspectRatio: 1,
        child: BlocBuilder<InfoBloc, InfoState>(
          builder: (context, state) => AnimatedSwitcher(
            duration: AppProvider.of(context).duration,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: state.info?.image != null
                ? ClipOval(
                    child: SizedBox.expand(
                      child: Image.asset(
                        state.info?.image ?? '',
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
