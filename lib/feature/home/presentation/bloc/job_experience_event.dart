part of 'job_experience_bloc.dart';

abstract class JobExperienceEvent extends Equatable {
  const JobExperienceEvent();

  @override
  List<Object> get props => [];
}

class GetJobExperienceEvent extends JobExperienceEvent {}
