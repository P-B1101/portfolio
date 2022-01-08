import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entiries/app_theme.dart';
import '../cubit/theme_cubit.dart';

class ThemeWidget extends StatelessWidget {
  final Function(AppTheme theme) builder;

  const ThemeWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => builder(state.theme),
    );
  }
}
