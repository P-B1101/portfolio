import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entity/skill.dart';
import '../../domain/use_case/get_skils.dart';

part 'skill_event.dart';
part 'skill_state.dart';

@injectable
class SkillBloc extends Bloc<SkillEvent, SkillState> {
  final GetSkills _getSkills;
  SkillBloc({
    required GetSkills getSkills,
  })  : _getSkills = getSkills,
        super(SkillInitial()) {
    on<GetSkillEvent>(_onGetSkillEvent);
  }

  Future<void> _onGetSkillEvent(
    GetSkillEvent event,
    Emitter<SkillState> emit,
  ) async {
    emit(SkillLoadingState(items: state.items));
    final result = await _getSkills(const NoParams());
    final newState = await result.fold(
      (failure) async => failure.toState(state.items),
      (response) async => SkillSuccessState(items: response),
    );
    emit(newState);
  }
}

extension FailureToState on Failure {
  SkillState toState(
    List<Skill> items,
  ) {
    switch (runtimeType) {
      case ServerFailure:
        return SkillFailureState(
          message: (this as ServerFailure).message,
          items: items,
        );
    }
    return SkillFailureState(items: items);
  }
}
