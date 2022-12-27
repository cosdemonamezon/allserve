import 'package:json_annotation/json_annotation.dart';

part 'microsoft.g.dart';

@JsonSerializable()
class Microsoft {
  Microsoft({
    this.id,
    this.name,
    this.description,
    this.image,
    this.status,
    this.type,
    this.No,
  });

  int? id;
  String? name;
  String? description;
  String? image;
  String? status;
  String? type;
  int? No;

  factory Microsoft.fromJson(Map<String, dynamic> json) => _$MicrosoftFromJson(json);

  Map<String, dynamic> toJson() => _$MicrosoftToJson(this);
}
