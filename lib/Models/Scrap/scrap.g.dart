// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scrap _$ScrapFromJson(Map<String, dynamic> json) => Scrap(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      name: json['name'] as String?,
      qty: json['qty'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      expire_hour: json['expire_hour'] as String?,
      No: json['No'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesScrap.fromJson(e as Map<String, dynamic>))
          .toList(),
      quotations: (json['quotations'] as List<dynamic>?)
          ?.map((e) => Quotation.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScrapToJson(Scrap instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'qty': instance.qty,
      'description': instance.description,
      'status': instance.status,
      'expire_hour': instance.expire_hour,
      'No': instance.No,
      'images': instance.images,
      'quotations': instance.quotations,
      'services': instance.services,
    };
