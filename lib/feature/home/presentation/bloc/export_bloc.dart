import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/error/failures.dart';
import '../../domain/use_case/request_for_export.dart';

part 'export_event.dart';
part 'export_state.dart';

@injectable
class ExportBloc extends Bloc<ExportEvent, ExportState> {
  final RequestForExport _requestForExport;
  ExportBloc({
    required RequestForExport requestForExport,
  })  : _requestForExport = requestForExport,
        super(ExportInitial()) {
    on<RequestExportEvent>(_onRequestExportEvent);
  }
  Future<void> _onRequestExportEvent(
    RequestExportEvent event,
    Emitter<ExportState> emit,
  ) async {
    emit(ExportLoadingState());
    const ratio = 5.0;
    final image = await event.controller.capture(pixelRatio: ratio);
    if (image == null) {
      emit(ExportInitial());
      return;
    }
    final result = await _requestForExport(Params(image: image));
    final newState = await result.fold(
      (failure) async => failure.toState,
      (response) async => ExportSuccessState(),
    );
    emit(newState);
  }
}

extension FailureToState on Failure {
  ExportState get toState {
    switch (runtimeType) {
      case ServerFailure:
        return ExportFailureState();
    }
    return ExportFailureState();
  }
}
