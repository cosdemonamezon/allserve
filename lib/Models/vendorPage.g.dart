// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendorPage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorPage _$VendorPageFromJson(Map<String, dynamic> json) => VendorPage(
      current_page: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Vendor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorPageToJson(VendorPage instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
    };
