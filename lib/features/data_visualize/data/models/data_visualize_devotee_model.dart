import 'package:csspt_app/features/data_visualize/domain/entities/data_visualize_devotee_entity.dart';

class DataVisualizeDevoteeModel extends DataVisualizeDevoteeEntity {
  const DataVisualizeDevoteeModel({
    super.key,
    super.date,
    super.id,
    super.firstName,
    super.lastName,
    super.email,
    super.mobileNumber,
    super.inGroup,
    super.joinGroup,
    super.picturesForSocialMedia,
    super.volunteering,
    super.volunteeringService,
    super.editState,
    super.sendToCloud,
  });

  factory DataVisualizeDevoteeModel.fromJson(Map<String, dynamic> json) {
    return DataVisualizeDevoteeModel(
      key: json["key"],
      date: json["date"],
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      mobileNumber: json["mobile_number"],
      inGroup: json["in_group"],
      joinGroup: json["join_group"],
      picturesForSocialMedia: json["pictures_for_social_media"],
      volunteering: json["volunteering"],
      volunteeringService: json["volunteering_service"],
      editState: json["edit_state"],
      sendToCloud: json["send_to_cloud"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "key": key,
      "date": date,
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "mobile_number": mobileNumber,
      "in_group": inGroup,
      "join_group": joinGroup,
      "pictures_for_social_media": picturesForSocialMedia,
      "volunteering": volunteering,
      "volunteering_service": volunteeringService,
      "edit_state": editState,
      "send_to_cloud": sendToCloud,
    };
  }

  DataVisualizeDevoteeModel copyWith({
    int? key,
    DateTime? date,
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    String? inGroup,
    String? joinGroup,
    String? picturesForSocialMedia,
    String? volunteering,
    List<Map<String, dynamic>>? volunteeringService,
    bool? editState,
    bool? sendToCloud,
  }) {
    return DataVisualizeDevoteeModel(
      key: key ?? this.key,
      date: date ?? this.date,
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      inGroup: inGroup ?? this.inGroup,
      joinGroup: joinGroup ?? this.joinGroup,
      picturesForSocialMedia:
          picturesForSocialMedia ?? this.picturesForSocialMedia,
      volunteering: volunteering ?? this.volunteering,
      volunteeringService: volunteeringService ?? this.volunteeringService,
      editState: editState ?? this.editState,
      sendToCloud: sendToCloud ?? this.sendToCloud,
    );
  }

  @override
  String toString() {
    return "key: $key, date: $date, id: $id, firstName: $firstName, lastName: $lastName, email: $email, mobileNumber: $mobileNumber, inGroup: $inGroup, joinGroup: $joinGroup, picturesForSocialMedia: $picturesForSocialMedia, volunteering: $volunteering, volunteeringService: $volunteeringService, editState: $editState, sendToCloud: $sendToCloud";
  }
}
