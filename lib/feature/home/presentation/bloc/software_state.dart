part of 'software_bloc.dart';

abstract class SoftwareState extends Equatable {
  final List<Software> items;
  const SoftwareState({
    this.items = const [],
  });

  @override
  List<Object?> get props => [items];
}

class SoftwareInitial extends SoftwareState {}

class SoftwareLoadingState extends SoftwareState {
  const SoftwareLoadingState({
    required List<Software> items,
  }) : super(items: items);
}

class SoftwareSuccessState extends SoftwareState {
  const SoftwareSuccessState({
    required List<Software> items,
  }) : super(items: items);
}

class SoftwareFailureState extends SoftwareState {
  final String? message;
  const SoftwareFailureState({
    required List<Software> items,
    this.message,
  }) : super(items: items);

  @override
  List<Object?> get props => [message, items];
}
