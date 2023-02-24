// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailServicerOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailServicerOrder _$DetailServicerOrderFromJson(Map<String, dynamic> json) =>
    DetailServicerOrder(
      id: json['id'] as int,
      name: json['name'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DetailServicerOrderToJson(
        DetailServicerOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };
