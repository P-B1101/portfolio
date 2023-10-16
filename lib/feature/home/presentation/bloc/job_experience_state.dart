part of 'job_experience_bloc.dart';

abstract class JobExperienceState extends Equatable {
  final List<JobExperience> items;
  const JobExperienceState({
    this.items = const [],
  });

  @override
  List<Object?> get props => [items];
}

class JobExperienceInitial extends JobExperienceState {}

class JobExperienceLoadingState extends JobExperienceState {
  const JobExperienceLoadingState({
    required List<JobExperience> items,
  }) : super(items: items);
}

class JobExperienceSuccessState extends JobExperienceState {
  const JobExperienceSuccessState({
    required List<JobExperience> items,
  }) : super(items: items);
}

class JobExperienceFailureState extends JobExperienceState {
  final String? message;
  const JobExperienceFailureState({
    required List<JobExperience> items,
    this.message,
  }) : super(items: items);

  @override
  List<Object?> get props => [message, items];
}
