import 'package:allserve/Models/ServiceOrder/serviceOrder.dart';
import 'package:allserve/Models/imagesCpmpanie/imagesScrap.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Quotation/quotation.dart';

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
    this.expire_hour,
    this.No,
    this.images,
    this.quotations,
    this.services,
  });

  int? id;
  String? user_id;
  String? name;
  String? qty;
  String? description;
  String? status;
  String? expire_hour;
  int? No;
  List<ImagesScrap>? images;
  List<Quotation>? quotations;
  List<ServiceOrder>? services;

  factory Scrap.fromJson(Map<String, dynamic> json) => _$ScrapFromJson(json);

  Map<String, dynamic> toJson() => _$ScrapToJson(this);
}
