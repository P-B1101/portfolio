import 'package:flutter/material.dart';
import '../../domain/entity/software.dart';

class SoftwareModel extends Software {
  const SoftwareModel({
    required String title,
    required String image,
    required Color color,
  }) : super(
          color: color,
          image: image,
          title: title,
        );

  factory SoftwareModel.fromJson(Map<String, dynamic> json) => SoftwareModel(
        title: json['title'],
        image: json['image'],
        color: Color(int.parse('FF${json['color']}', radix: 16)),
      );
}
