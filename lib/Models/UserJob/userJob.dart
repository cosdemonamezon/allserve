import 'package:allserve/Models/UserJob/userDetail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userJob.g.dart';

@JsonSerializable()
class UserJob {
  UserJob({
    this.id,
    this.username,
    this.name,
    this.phone,
    this.email,
    this.image,
    this.address,
    this.birthday,
    this.age,
    this.gender,
    this.marital,
    this.status,
    this.user_job_detail,
  });

  int? id;
  String? username;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? address;
  String? birthday;
  String? age;
  String? gender;
  String? marital;
  String? status;
  List<UserDetail>? user_job_detail;

  factory UserJob.fromJson(Map<String, dynamic> json) => _$UserJobFromJson(json);

  Map<String, dynamic> toJson() => _$UserJobToJson(this);
}
