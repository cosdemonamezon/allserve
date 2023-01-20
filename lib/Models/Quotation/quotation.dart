import 'package:json_annotation/json_annotation.dart';

import '../parther.dart';

part 'quotation.g.dart';

@JsonSerializable()
class Quotation {
  Quotation({
    this.id,
    this.user_id,
    this.logistic_companie_id,
    this.title,
    this.path,
    this.remark,
    this.status,
    this.remark_for_approve,
    this.parther,
  });

  int? id;
  String? user_id;
  String? logistic_companie_id;
  String? title;
  String? path;
  String? remark;
  String? status;
  String? remark_for_approve;
  Parther? parther;

  factory Quotation.fromJson(Map<String, dynamic> json) => _$QuotationFromJson(json);

  Map<String, dynamic> toJson() => _$QuotationToJson(this);
}
