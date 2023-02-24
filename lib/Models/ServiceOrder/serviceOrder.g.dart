// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrder _$ServiceOrderFromJson(Map<String, dynamic> json) => ServiceOrder(
      id: json['id'] as int?,
      order_id: json['order_id'] as String?,
      order_type: json['order_type'] as String?,
      service_id: json['service_id'] as String?,
      service_type: json['service_type'] as String?,
      service: json['service'] == null
          ? null
          : DetailServicerOrder.fromJson(
              json['service'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceOrderToJson(ServiceOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.order_id,
      'order_type': instance.order_type,
      'service_id': instance.service_id,
      'service_type': instance.service_type,
      'service': instance.service,
    };
