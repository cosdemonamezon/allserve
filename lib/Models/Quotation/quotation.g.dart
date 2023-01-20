// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quotation _$QuotationFromJson(Map<String, dynamic> json) => Quotation(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      logistic_companie_id: json['logistic_companie_id'] as String?,
      title: json['title'] as String?,
      path: json['path'] as String?,
      remark: json['remark'] as String?,
      status: json['status'] as String?,
      remark_for_approve: json['remark_for_approve'] as String?,
      parther: json['parther'] == null
          ? null
          : Parther.fromJson(json['parther'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuotationToJson(Quotation instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'logistic_companie_id': instance.logistic_companie_id,
      'title': instance.title,
      'path': instance.path,
      'remark': instance.remark,
      'status': instance.status,
      'remark_for_approve': instance.remark_for_approve,
      'parther': instance.parther,
    };
