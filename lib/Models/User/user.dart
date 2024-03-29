import 'package:allserve/Models/Scrap/scrap.dart';
import 'package:allserve/Models/User/permission.dart';
import 'package:allserve/Models/User/recruitmentcompanies.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Logistic/logistic.dart';
import '../Purchase/purchase.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    this.id,
    this.permission_id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.line_token,
    this.image,
    this.status,
    this.type,
    this.permission,
    this.recruitment_companies,
    this.scraps,
    this.logistics,
  });

  int? id;
  String? permission_id;
  String? username;
  String? name;
  String? email;
  String? phone;
  String? line_token;
  String? image;
  String? status;
  String? type;
  Permission? permission;
  List<Recruitmentcompanies>? recruitment_companies;
  List<Scrap>? scraps;
  List<Logistic>? logistics;
  List<Purchase>? puchases;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
