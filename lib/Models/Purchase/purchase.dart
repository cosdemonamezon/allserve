import 'package:allserve/Models/imagesCpmpanie/imagesPurchase.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Quotation/quotation.dart';
import '../ServiceOrder/serviceOrder.dart';

part 'purchase.g.dart';

@JsonSerializable()
class Purchase {
  Purchase({
    this.id,
    this.user_id,
    this.name,
    this.qty,
    this.description,
    this.expire_hour,
    this.status,
    this.No,
    this.images,
    this.qoutations,
    this.services,
  });

  int? id;
  String? user_id;
  String? name;
  String? qty;
  String? description;
  String? expire_hour;
  String? status;
  int? No;
  List<ImagesPurchase>? images;
  List<Quotation>? qoutations;
  List<ServiceOrder>? services;

  factory Purchase.fromJson(Map<String, dynamic> json) => _$PurchaseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}
