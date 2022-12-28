import 'package:json_annotation/json_annotation.dart';

import 'User/user.dart';
import 'UserJob/userJob.dart';

part 'meetings.g.dart';

@JsonSerializable()
class Meetings {
  Meetings({
    this.id,
    this.user_id,
    this.user_job_id,
    this.recruitment_companie_id,
    this.uuid,
    this.host_id,
    this.start_url,
    this.topic,
    this.type,
    this.start_time,
    this.duration,
    this.agenda,
    this.join_url,
    this.status,
    this.user,
    this.user_job,
  });

  int? id;
  String? user_id;
  String? user_job_id;
  String? recruitment_companie_id;
  String? uuid;
  String? host_id;
  String? start_url;
  String? topic;
  String? type;
  String? start_time;
  String? duration;
  String? agenda;
  String? join_url;
  String? status;
  List<User>? user;
  List<UserJob>? user_job;

  factory Meetings.fromJson(Map<String, dynamic> json) => _$MeetingsFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingsToJson(this);
}
