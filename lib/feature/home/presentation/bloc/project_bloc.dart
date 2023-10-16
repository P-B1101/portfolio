import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/use_case/use_case.dart';
import 'package:portfolio/feature/home/domain/entity/project.dart';
import 'package:portfolio/feature/home/domain/use_case/get_projects.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjects _getProjects;
  ProjectBloc({
    required GetProjects getProjects,
  })  : _getProjects = getProjects,
        super(ProjectInitial()) {
    on<GetProjectEvent>(_onGetProjectEvent);
  }

  Future<void> _onGetProjectEvent(
    GetProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(ProjectLoadingState(items: state.items));
    final result = await _getProjects(const NoParams());
    final newState = await result.fold(
      (failure) async => failure.toState(state.items),
      (response) async => ProjectSuccessState(items: response),
    );
    emit(newState);
  }
}

extension FailureToState on Failure {
  ProjectState toState(
    List<Project> items,
  ) {
    switch (runtimeType) {
      case ServerFailure:
        return ProjectFailureState(
          message: (this as ServerFailure).message,
          items: items,
        );
    }
    return ProjectFailureState(items: items);
  }
}
