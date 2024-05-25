import 'package:hive/hive.dart';

part 'devotee_model.g.dart';

@HiveType(typeId: 1)
class DevoteeModel {
  DevoteeModel({
    this.date,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.inGroup,
    this.joinGroup,
    this.picturesForSocialMedia,
    this.volunteering,
    this.volunteeringService,
  });

  @HiveField(0)
  DateTime? date;

  @HiveField(1)
  String? id;

  @HiveField(2)
  String? firstName;

  @HiveField(3)
  String? lastName;

  @HiveField(4)
  String? email;

  @HiveField(5)
  String? mobileNumber;

  @HiveField(6)
  String? inGroup;

  @HiveField(7)
  String? joinGroup;

  @HiveField(8)
  String? picturesForSocialMedia;

  @HiveField(9)
  String? volunteering;

  @HiveField(10)
  List<Map<String, dynamic>>? volunteeringService;

  factory DevoteeModel.fromJson(Map<String, dynamic> json) {
    return DevoteeModel(
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
    };
  }

  @override
  String toString() {
    return "date: $date, id: $id, firstName: $firstName, lastName: $lastName, email: $email, mobileNumber: $mobileNumber, inGroup: $inGroup, joinGroup: $joinGroup, picturesForSocialMedia: $picturesForSocialMedia, volunteering: $volunteering, volunteeringService: $volunteeringService";
  }
}
