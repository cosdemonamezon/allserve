// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitmentcompanies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recruitmentcompanies _$RecruitmentcompaniesFromJson(
        Map<String, dynamic> json) =>
    Recruitmentcompanies(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      position: json['position'] as String?,
      salary: json['salary'] as String?,
      exp: json['exp'] as String?,
      major: json['major'] as String?,
      degree: json['degree'] as String?,
      qty: json['qty'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$RecruitmentcompaniesToJson(
        Recruitmentcompanies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'position': instance.position,
      'salary': instance.salary,
      'exp': instance.exp,
      'major': instance.major,
      'degree': instance.degree,
      'qty': instance.qty,
      'description': instance.description,
      'status': instance.status,
    };
