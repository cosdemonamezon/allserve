import 'package:json_annotation/json_annotation.dart';

part 'scrap.g.dart';

@JsonSerializable()
class Scrap {
  Scrap({
    this.id,
    this.user_id,
    this.name,
    this.qty,
    this.description,
    this.status,
    this.No,
  });

  int? id;
  String? user_id;
  String? name;
  String? qty;
  String? description;
  String? status;
  int? No;

  factory Scrap.fromJson(Map<String, dynamic> json) => _$ScrapFromJson(json);

  Map<String, dynamic> toJson() => _$ScrapToJson(this);
}
