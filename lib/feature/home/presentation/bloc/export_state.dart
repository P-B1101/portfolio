part of 'export_bloc.dart';

abstract class ExportState extends Equatable {
  const ExportState();

  @override
  List<Object> get props => [];
}

class ExportInitial extends ExportState {}

class ExportLoadingState extends ExportState {}

class ExportSuccessState extends ExportState {}

class ExportFailureState extends ExportState {}

class ExportCancelState extends ExportState {}
