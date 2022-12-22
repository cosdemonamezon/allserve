// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userJob.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJob _$UserJobFromJson(Map<String, dynamic> json) => UserJob(
      id: json['id'] as int?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      birthday: json['birthday'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      marital: json['marital'] as String?,
      status: json['status'] as String?,
      user_job_detail: (json['user_job_detail'] as List<dynamic>?)
          ?.map((e) => UserDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserJobToJson(UserJob instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'image': instance.image,
      'address': instance.address,
      'birthday': instance.birthday,
      'age': instance.age,
      'gender': instance.gender,
      'marital': instance.marital,
      'status': instance.status,
      'user_job_detail': instance.user_job_detail,
    };
