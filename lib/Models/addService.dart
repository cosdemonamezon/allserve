import 'package:json_annotation/json_annotation.dart';

part 'addService.g.dart';

@JsonSerializable()
class AddService {
  AddService({
    required this.service_id,
    required this.service_type,
  });
  final int service_id;
  final String service_type;

  factory AddService.fromJson(Map<String, dynamic> json) => _$AddServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AddServiceToJson(this);
}
