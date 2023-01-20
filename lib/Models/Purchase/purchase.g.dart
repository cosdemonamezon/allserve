// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      name: json['name'] as String?,
      qty: json['qty'] as String?,
      description: json['description'] as String?,
      expire_hour: json['expire_hour'] as String?,
      status: json['status'] as String?,
      No: json['No'] as int?,
      quotations: (json['quotations'] as List<dynamic>?)
          ?.map((e) => Quotation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'qty': instance.qty,
      'description': instance.description,
      'expire_hour': instance.expire_hour,
      'status': instance.status,
      'No': instance.No,
      'quotations': instance.quotations,
    };