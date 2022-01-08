part of 'education_bloc.dart';

abstract class EducationEvent extends Equatable {
  const EducationEvent();

  @override
  List<Object> get props => [];
}

class GetEducationsEvent extends EducationEvent {}
