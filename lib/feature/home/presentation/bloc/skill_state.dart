part of 'skill_bloc.dart';

abstract class SkillState extends Equatable {
  final List<Skill> items;
  const SkillState({
    this.items = const [],
  });

  @override
  List<Object?> get props => [items];
}

class SkillInitial extends SkillState {}

class SkillLoadingState extends SkillState {
  const SkillLoadingState({
    required List<Skill> items,
  }) : super(items: items);
}

class SkillSuccessState extends SkillState {
  const SkillSuccessState({
    required List<Skill> items,
  }) : super(items: items);
}

class SkillFailureState extends SkillState {
  final String? message;
  const SkillFailureState({
    required List<Skill> items,
    this.message,
  }) : super(items: items);

  @override
  List<Object?> get props => [message, items];
}
