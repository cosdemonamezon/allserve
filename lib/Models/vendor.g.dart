// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vendor _$VendorFromJson(Map<String, dynamic> json) => Vendor(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      tax: json['tax'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      address3: json['address3'] as String?,
      country: json['country'] as String?,
      postcode: json['postcode'] as String?,
      fax: json['fax'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      No: (json['No'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'tax': instance.tax,
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'country': instance.country,
      'postcode': instance.postcode,
      'fax': instance.fax,
      'image': instance.image,
      'type': instance.type,
      'status': instance.status,
      'No': instance.No,
    };
