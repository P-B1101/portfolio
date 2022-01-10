part of 'software_bloc.dart';

abstract class SoftwareEvent extends Equatable {
  const SoftwareEvent();

  @override
  List<Object> get props => [];
}

class GetSoftwareEvent extends SoftwareEvent {}
