import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum.dart';

class _State extends Equatable {
  final SwitchState state;
  const _State({
    required this.state,
  });
  @override
  List<Object?> get props => [state];
}

class _Cubit extends Cubit<_State> {
  _Cubit() : super(const _State(state: SwitchState.done));

  void switching() async {
    emit(const _State(state: SwitchState.switching));
    await Future.delayed(const Duration(milliseconds: 1000));
    done();
  }

  void done() => emit(const _State(state: SwitchState.done));
}

class LanguageSwitcherWidget extends StatelessWidget {
  final String language;
  final Widget child;
  const LanguageSwitcherWidget({
    super.key,
    required this.language,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _Cubit(),
      child: _LanguageSwitcherWidget(language: language, child: child),
    );
  }
}

class _LanguageSwitcherWidget extends StatefulWidget {
  final String language;
  final Widget child;
  const _LanguageSwitcherWidget({
    required this.language,
    required this.child,
  });

  @override
  State<_LanguageSwitcherWidget> createState() =>
      _LanguageSwitcherWidgetState();
}

class _LanguageSwitcherWidgetState extends State<_LanguageSwitcherWidget> {
  @override
  void didUpdateWidget(covariant _LanguageSwitcherWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.language != widget.language) {
      context.read<_Cubit>().switching();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_Cubit, _State>(
      builder: (context, state) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: switch (state.state) {
          SwitchState.switching => Center(
              child: Image.asset(
                'assets/images/png/logo.png',
                width: 200,
                height: 200,
              ),
            ),
          SwitchState.done => widget.child,
        },
      ),
    );
  }
}
