part of 'education_bloc.dart';

abstract class EducationState extends Equatable {
  final List<Education> items;
  const EducationState({
    this.items = const [],
  });

  @override
  List<Object?> get props => [items];
}

class EducationInitial extends EducationState {}

class EducationLoadingState extends EducationState {
  const EducationLoadingState({
    required List<Education> items,
  }) : super(items: items);
}

class EducationSuccessState extends EducationState {
  const EducationSuccessState({
    required List<Education> items,
  }) : super(items: items);
}

class EducationFailureState extends EducationState {
  final String? message;
  const EducationFailureState({
    required List<Education> items,
    this.message,
  }) : super(items: items);

  @override
  List<Object?> get props => [message, items];
}
