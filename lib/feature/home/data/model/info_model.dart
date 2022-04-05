import '../../domain/entity/info.dart';

class InfoModel extends Info {
  const InfoModel({
    required String name,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String image,
    required String linkedInUrl,
    required String portfolioUrl,
  }) : super(
          email: email,
          image: image,
          lastName: lastName,
          name: name,
          phoneNumber: phoneNumber,
          linkedInUrl: linkedInUrl,
          portfolioUrl: portfolioUrl,
        );

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        name: json['name'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        image: json['image'],
        linkedInUrl: json['linkedInUrl'] ?? '',
        portfolioUrl: json['portfolioUrl'] ?? '',
      );
}
