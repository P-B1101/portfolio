part of 'profession_bloc.dart';

abstract class ProfessionState extends Equatable {
  final Profession? profession;
  const ProfessionState({
    this.profession,
  });

  @override
  List<Object?> get props => [profession];
}

class ProfessionInitial extends ProfessionState {}

class ProfessionLoadingState extends ProfessionState {
  const ProfessionLoadingState({
    required Profession? profession,
  }) : super(profession: profession);
}

class ProfessionSuccessState extends ProfessionState {
  const ProfessionSuccessState({
    required Profession profession,
  }) : super(profession: profession);
}

class ProfessionFailureState extends ProfessionState {
  final String? message;
  const ProfessionFailureState({
    required Profession? profession,
    this.message,
  }) : super(profession: profession);

  @override
  List<Object?> get props => [
        message,
        profession,
      ];
}
