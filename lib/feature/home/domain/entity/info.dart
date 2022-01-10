import 'package:equatable/equatable.dart';

class Info extends Equatable {
  final String name;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String image;

  const Info({
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.image,
  });
  @override
  List<Object?> get props => [
        name,
        lastName,
        phoneNumber,
        email,
        image,
      ];
}
