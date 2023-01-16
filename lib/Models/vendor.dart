import 'package:json_annotation/json_annotation.dart';

part 'vendor.g.dart';

@JsonSerializable()
class Vendor {
  Vendor({
    this.id,
    this.user_id,
    this.name,
    this.email,
    this.phone,
    this.tax,
    this.address1,
    this.address2,
    this.address3,
    this.country,
    this.postcode,
    this.fax,
    this.image,
    this.type,
    this.status,
    this.No,
  });

  int? id;
  String? user_id;
  String? name;
  String? email;
  String? phone;
  String? tax;
  String? address1;
  String? address2;
  String? address3;
  String? country;
  String? postcode;
  String? fax;
  String? image;
  String? type;
  String? status;
  double? No;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
