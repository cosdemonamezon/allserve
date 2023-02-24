import 'package:json_annotation/json_annotation.dart';

part 'detailServicerOrder.g.dart';

@JsonSerializable()
class DetailServicerOrder {
  DetailServicerOrder({
    required this.id,
    this.name,
    this.description,
    this.status,
  });
  final int id;
  String? name;
  String? description;
  String? status;

  factory DetailServicerOrder.fromJson(Map<String, dynamic> json) => _$DetailServicerOrderFromJson(json);

  Map<String, dynamic> toJson() => _$DetailServicerOrderToJson(this);
}
