import '../../domain/entity/info.dart';

class InfoModel extends Info {
  const InfoModel({
    required super.name,
    required super.lastName,
    required super.phoneNumber,
    required super.email,
    required super.image,
    required super.linkedInUrl,
    required super.portfolioUrl,
  });
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
