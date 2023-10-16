part of 'skill_bloc.dart';

abstract class SkillEvent extends Equatable {
  const SkillEvent();

  @override
  List<Object> get props => [];
}

class GetSkillEvent extends SkillEvent {}
