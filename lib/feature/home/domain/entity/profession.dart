import 'package:equatable/equatable.dart';

class Profession extends Equatable {
  final String profession;
  final String slogan;
  const Profession({
    required this.profession,
    required this.slogan,
  });
  @override
  List<Object?> get props => [
        profession,
        slogan,
      ];
}
