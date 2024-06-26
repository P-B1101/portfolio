import 'package:equatable/equatable.dart';

class Info extends Equatable {
  final String name;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String image;
  final String linkedInUrl;
  final String portfolioUrl;
  final String githubUrl;

  const Info({
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.image,
    required this.linkedInUrl,
    required this.portfolioUrl,
    required this.githubUrl,
  });
  @override
  List<Object?> get props => [
        name,
        lastName,
        phoneNumber,
        email,
        image,
        linkedInUrl,
        portfolioUrl,
        githubUrl,
      ];

  Info copyWith({
    String? imageUrl,
  }) =>
      Info(
        name: name,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        linkedInUrl: linkedInUrl,
        image: imageUrl ?? image,
        portfolioUrl: portfolioUrl,
        githubUrl: githubUrl,
      );

  bool get hasLinkedInUrl => linkedInUrl.isNotEmpty;

  bool get hasPortfolioUrl => portfolioUrl.isNotEmpty;

  bool get hasGithubUrl => githubUrl.isNotEmpty;

  String get getFullName => '$name $lastName';
}
