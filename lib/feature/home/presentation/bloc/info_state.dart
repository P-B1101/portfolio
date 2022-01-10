part of 'info_bloc.dart';

abstract class InfoState extends Equatable {
  final Info? info;
  const InfoState({
    this.info,
  });

  @override
  List<Object?> get props => [info];
}

class InfoInitial extends InfoState {}

class InfoLoadingState extends InfoState {
  const InfoLoadingState({
    required Info? info,
  }) : super(info: info);
}

class InfoSuccessState extends InfoState {
  const InfoSuccessState({
    required Info info,
  }) : super(info: info);
}

class InfoFailureState extends InfoState {
  final String? message;
  const InfoFailureState({
    required Info? info,
    this.message,
  }) : super(info: info);

  @override
  List<Object?> get props => [
        message,
        info,
      ];
}
