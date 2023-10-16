part of 'project_bloc.dart';

abstract class ProjectState extends Equatable {
  final List<Project> items;
  const ProjectState({
    this.items = const [],
  });

  @override
  List<Object?> get props => [items];
}

class ProjectInitial extends ProjectState {}

class ProjectLoadingState extends ProjectState {
  const ProjectLoadingState({
    required List<Project> items,
  }) : super(items: items);
}

class ProjectSuccessState extends ProjectState {
  const ProjectSuccessState({
    required List<Project> items,
  }) : super(items: items);
}

class ProjectFailureState extends ProjectState {
  final String? message;
  const ProjectFailureState({
    required List<Project> items,
    this.message,
  }) : super(items: items);

  @override
  List<Object?> get props => [message, items];
}
