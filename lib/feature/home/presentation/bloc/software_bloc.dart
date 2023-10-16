import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entity/software.dart';
import '../../domain/use_case/get_softwares.dart';

part 'software_event.dart';
part 'software_state.dart';

class SoftwareBloc extends Bloc<SoftwareEvent, SoftwareState> {
  final GetSoftwares _getSoftwares;
  SoftwareBloc({
    required GetSoftwares getSoftwares,
  })  : _getSoftwares = getSoftwares,
        super(SoftwareInitial()) {
    on<GetSoftwareEvent>(_onGetSoftwareEvent);
  }

  Future<void> _onGetSoftwareEvent(
    GetSoftwareEvent event,
    Emitter<SoftwareState> emit,
  ) async {
    emit(SoftwareLoadingState(items: state.items));
    final result = await _getSoftwares(const NoParams());
    final newState = await result.fold(
      (failure) async => failure.toState(state.items),
      (response) async => SoftwareSuccessState(items: response),
    );
    emit(newState);
  }
}

extension FailureToState on Failure {
  SoftwareState toState(
    List<Software> items,
  ) {
    switch (runtimeType) {
      case ServerFailure:
        return SoftwareFailureState(
          message: (this as ServerFailure).message,
          items: items,
        );
    }
    return SoftwareFailureState(items: items);
  }
}
