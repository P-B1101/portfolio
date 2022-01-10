import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../domain/entity/info.dart';
import '../../domain/use_case/get_info.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final GetInfo _getInfo;
  InfoBloc({
    required GetInfo getInfo,
  })  : _getInfo = getInfo,
        super(InfoInitial()) {
    on<GetInfoEvent>(_onGetInfoEvent);
  }

  Future<void> _onGetInfoEvent(
    GetInfoEvent event,
    Emitter<InfoState> emit,
  ) async {
    emit(InfoLoadingState(info: state.info));
    final result = await _getInfo(const NoParams());
    final newState = await result.fold(
      (failure) async => failure.toState(state.info),
      (response) async => InfoSuccessState(info: response),
    );
    emit(newState);
  }
}

extension FailureToState on Failure {
  InfoState toState(Info? info) {
    switch (runtimeType) {
      case ServerFailure:
        return InfoFailureState(
          message: (this as ServerFailure).message,
          info: info,
        );
    }
    return InfoFailureState(info: info);
  }
}
