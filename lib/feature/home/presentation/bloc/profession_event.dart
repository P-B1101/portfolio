part of 'profession_bloc.dart';

abstract class ProfessionEvent extends Equatable {
  const ProfessionEvent();

  @override
  List<Object> get props => [];
}

class GetProfessionEvent extends ProfessionEvent {}
