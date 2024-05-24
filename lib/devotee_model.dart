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

  @override
  String toString() {
    return "date: $date, id: $id, firstName: $firstName, lastName: $lastName, email: $email, mobileNumber: $mobileNumber, inGroup: $inGroup, joinGroup: $joinGroup, picturesForSocialMedia: $picturesForSocialMedia, volunteering: $volunteering, volunteeringService: $volunteeringService";
  }
}
