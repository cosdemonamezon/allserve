import 'package:json_annotation/json_annotation.dart';

part 'userDetail.g.dart';

@JsonSerializable()
class UserDetail {
  UserDetail({
    this.id,
    this.user_job_id,
    this.location_of_educate,
    this.major,
    this.degree,
    this.grade,
    this.finished,
    this.thai,
    this.english,
    this.china,
    this.japan,
    this.exp,
    this.position,
    this.salary,
    this.remark,
  });

  int? id;
  String? user_job_id;
  String? location_of_educate;
  String? major;
  String? degree;
  String? grade;
  String? finished;
  String? thai;
  String? english;
  String? china;
  String? japan;
  String? exp;
  String? position;
  String? salary;
  String? remark;

  factory UserDetail.fromJson(Map<String, dynamic> json) => _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
