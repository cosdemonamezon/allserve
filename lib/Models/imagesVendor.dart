import 'package:json_annotation/json_annotation.dart';

part 'imagesVendor.g.dart';

@JsonSerializable()
class ImagesVendor {
  ImagesVendor({
    this.id,
    this.vendor_id,
    this.image,
  });

  int? id;
  String? vendor_id;
  String? image;

  factory ImagesVendor.fromJson(Map<String, dynamic> json) => _$ImagesVendorFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesVendorToJson(this);
}
