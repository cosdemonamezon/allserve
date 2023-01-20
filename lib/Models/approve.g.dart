// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Approve _$ApproveFromJson(Map<String, dynamic> json) => Approve(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      scrap_companie_id: json['scrap_companie_id'] as String?,
      title: json['title'] as String?,
      path: json['path'] as String?,
      remark: json['remark'] as String?,
      status: json['status'] as String?,
      remark_for_approve: json['remark_for_approve'] as String?,
    );

Map<String, dynamic> _$ApproveToJson(Approve instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'scrap_companie_id': instance.scrap_companie_id,
      'title': instance.title,
      'path': instance.path,
      'remark': instance.remark,
      'status': instance.status,
      'remark_for_approve': instance.remark_for_approve,
    };
