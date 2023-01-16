import 'package:allserve/Models/vendor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vendorPage.g.dart';

@JsonSerializable()
class VendorPage {
  VendorPage({
    this.current_page,
    this.data,
  });

  int? current_page;
  List<Vendor>? data;

  factory VendorPage.fromJson(Map<String, dynamic> json) => _$VendorPageFromJson(json);

  Map<String, dynamic> toJson() => _$VendorPageToJson(this);
}
