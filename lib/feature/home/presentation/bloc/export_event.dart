part of 'export_bloc.dart';

abstract class ExportEvent extends Equatable {
  const ExportEvent();

  @override
  List<Object?> get props => [];
}

class RequestExportEvent extends ExportEvent {
  final ScreenshotController controller;
  const RequestExportEvent({
    required this.controller,
  });

  @override
  List<Object?> get props => [controller];
}
