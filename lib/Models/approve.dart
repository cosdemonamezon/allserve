import 'package:json_annotation/json_annotation.dart';

part 'approve.g.dart';

@JsonSerializable()
class Approve {
  Approve({
    this.id,
    this.user_id,
    this.scrap_companie_id,
    this.title,
    this.path,
    this.remark,
    this.status,
    this.remark_for_approve,
  });

  int? id;
  String? user_id;
  String? scrap_companie_id;
  String? title;
  String? path;
  String? remark;
  String? status;
  String? remark_for_approve;

  factory Approve.fromJson(Map<String, dynamic> json) => _$ApproveFromJson(json);

  Map<String, dynamic> toJson() => _$ApproveToJson(this);
}
