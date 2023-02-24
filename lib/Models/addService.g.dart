// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addService.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddService _$AddServiceFromJson(Map<String, dynamic> json) => AddService(
      service_id: json['service_id'] as int,
      service_type: json['service_type'] as String,
    );

Map<String, dynamic> _$AddServiceToJson(AddService instance) =>
    <String, dynamic>{
      'service_id': instance.service_id,
      'service_type': instance.service_type,
    };
