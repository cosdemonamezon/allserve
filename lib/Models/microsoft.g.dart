// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'microsoft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Microsoft _$MicrosoftFromJson(Map<String, dynamic> json) => Microsoft(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      No: json['No'] as int?,
    );

Map<String, dynamic> _$MicrosoftToJson(Microsoft instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'status': instance.status,
      'type': instance.type,
      'No': instance.No,
    };
