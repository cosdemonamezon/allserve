import 'package:allserve/Models/ServiceOrder/detailServicerOrder.dart';
import 'package:json_annotation/json_annotation.dart';

part 'serviceOrder.g.dart';

@JsonSerializable()
class ServiceOrder {
  ServiceOrder({
    this.id,
    this.order_id,
    this.order_type,
    this.service_id,
    this.service_type,
    this.service,
  });
  int? id;
  String? order_id;
  String? order_type;
  String? service_id;
  String? service_type;
  DetailServicerOrder? service;

  factory ServiceOrder.fromJson(Map<String, dynamic> json) => _$ServiceOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceOrderToJson(this);
}
