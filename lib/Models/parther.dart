import 'package:json_annotation/json_annotation.dart';

part 'parther.g.dart';

@JsonSerializable()
class Parther {
  Parther({
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
    this.status,
    this.type,
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
  String? status;
  String? type;

  factory Parther.fromJson(Map<String, dynamic> json) => _$PartherFromJson(json);

  Map<String, dynamic> toJson() => _$PartherToJson(this);
}
