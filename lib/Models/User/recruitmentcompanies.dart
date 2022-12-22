import 'package:json_annotation/json_annotation.dart';

part 'recruitmentcompanies.g.dart';

@JsonSerializable()
class Recruitmentcompanies {
  Recruitmentcompanies({
    this.id,
    this.user_id,
    this.position,
    this.salary,
    this.exp,
    this.major,
    this.degree,
    this.qty,
    this.description,
    this.status,
  });

  int? id;
  String? user_id;
  String? position;
  String? salary;
  String? exp;
  String? major;
  String? degree;
  String? qty;
  String? description;
  String? status;

  factory Recruitmentcompanies.fromJson(Map<String, dynamic> json) => _$RecruitmentcompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$RecruitmentcompaniesToJson(this);
}
