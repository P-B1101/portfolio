import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/app_language.dart';
import '../cubit/language_cubit.dart';

class LanguageWidget extends StatelessWidget {
  final Function(AppLanguage language) builder;

  const LanguageWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) => builder(
        state.language,
      ),
    );
  }
}
