import 'package:csspt_app/features/data_entry/domain/entities/data_entry_devotee_entity.dart';

class DataEntryDevoteeModel extends DataEntryDevoteeEntity {
  const DataEntryDevoteeModel({
    super.firstName,
    super.lastName,
    super.email,
    super.mobileNumber,
    super.inGroup,
    super.joinGroup,
    super.picturesForSocialMedia,
    super.volunteering,
    super.volunteeringService,
  });

  factory DataEntryDevoteeModel.fromJson(Map<String, dynamic> json) {
    return DataEntryDevoteeModel(
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      mobileNumber: json["mobile_number"],
      inGroup: json["in_group"],
      joinGroup: json["join_group"],
      picturesForSocialMedia: json["pictures_for_social_media"],
      volunteering: json["volunteering"],
      volunteeringService: json["volunteering_service"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "mobile_number": mobileNumber,
      "in_group": inGroup,
      "join_group": joinGroup,
      "pictures_for_social_media": picturesForSocialMedia,
      "volunteering": volunteering,
      "volunteering_service": volunteeringService,
    };
  }

  DataEntryDevoteeModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    String? inGroup,
    String? joinGroup,
    String? picturesForSocialMedia,
    String? volunteering,
    List<Map<String, dynamic>>? volunteeringService,
  }) {
    return DataEntryDevoteeModel(
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
    );
  }

  @override
  String toString() {
    return "firstName: $firstName, lastName: $lastName, email: $email, mobileNumber: $mobileNumber, inGroup: $inGroup, joinGroup: $joinGroup, picturesForSocialMedia: $picturesForSocialMedia, volunteering: $volunteering, volunteeringService: $volunteeringService";
  }
}
