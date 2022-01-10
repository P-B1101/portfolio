import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entity/profession.dart';
import '../../domain/use_case/get_profession.dart';

part 'profession_event.dart';
part 'profession_state.dart';

class ProfessionBloc extends Bloc<ProfessionEvent, ProfessionState> {
  final GetProfession _getProfession;
  ProfessionBloc({
    required GetProfession getProfession,
  })  : _getProfession = getProfession,
        super(ProfessionInitial()) {
    on<GetProfessionEvent>(_onGetProfessionEvent);
  }

  Future<void> _onGetProfessionEvent(
    GetProfessionEvent event,
    Emitter<ProfessionState> emit,
  ) async {
    emit(ProfessionLoadingState(profession: state.profession));
    final result = await _getProfession(const NoParams());
    final newState = await result.fold(
      (failure) async => failure.toState(state.profession),
      (response) async => ProfessionSuccessState(profession: response),
    );
    emit(newState);
  }
}

extension FailureToState on Failure {
  ProfessionState toState(Profession? profession) {
    switch (runtimeType) {
      case ServerFailure:
        return ProfessionFailureState(
          message: (this as ServerFailure).message,
          profession: profession,
        );
    }
    return ProfessionFailureState(profession: profession);
  }
}
