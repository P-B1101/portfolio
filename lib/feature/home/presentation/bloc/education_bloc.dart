import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entity/education.dart';
import '../../domain/use_case/get_educations.dart';

part 'education_event.dart';
part 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  final GetEducations _getEducations;
  EducationBloc({
    required GetEducations getEducations,
  })  : _getEducations = getEducations,
        super(EducationInitial()) {
    on<GetEducationsEvent>(_onGetEducationsEvent);
  }

  Future<void> _onGetEducationsEvent(
    GetEducationsEvent event,
    Emitter<EducationState> emit,
  ) async {
    emit(EducationLoadingState(items: state.items));
    final result = await _getEducations(const NoParams());
    final newState = await result.fold(
      (failure) async => failure.toState(state.items),
      (response) async => EducationSuccessState(items: response),
    );
    emit(newState);
  }
}

extension FailureToState on Failure {
  EducationState toState(
    List<Education> items,
  ) {
    switch (runtimeType) {
      case ServerFailure:
        return EducationFailureState(
          message: (this as ServerFailure).message,
          items: items,
        );
    }
    return EducationFailureState(items: items);
  }
}
