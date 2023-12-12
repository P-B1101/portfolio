import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entity/job_experience.dart';
import '../../domain/use_case/get_job_experiences.dart';

part 'job_experience_event.dart';
part 'job_experience_state.dart';

@injectable
class JobExperienceBloc extends Bloc<JobExperienceEvent, JobExperienceState> {
  final GetJobExperiences _getJobExperiences;
  JobExperienceBloc({
    required GetJobExperiences getJobExperiences,
  })  : _getJobExperiences = getJobExperiences,
        super(JobExperienceInitial()) {
    on<GetJobExperienceEvent>(_onGetJobExperienceEvent);
  }

  Future<void> _onGetJobExperienceEvent(
    GetJobExperienceEvent event,
    Emitter<JobExperienceState> emit,
  ) async {
    emit(JobExperienceLoadingState(items: state.items));
    final result = await _getJobExperiences(const NoParams());
    final newState = await result.fold(
      (failure) async => failure.toState(state.items),
      (response) async => JobExperienceSuccessState(items: response),
    );
    emit(newState);
  }
}

extension FailureToState on Failure {
  JobExperienceState toState(
    List<JobExperience> items,
  ) {
    switch (runtimeType) {
      case ServerFailure:
        return JobExperienceFailureState(
          message: (this as ServerFailure).message,
          items: items,
        );
    }
    return JobExperienceFailureState(items: items);
  }
}
