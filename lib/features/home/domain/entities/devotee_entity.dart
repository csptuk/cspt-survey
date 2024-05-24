import 'package:equatable/equatable.dart';

class DevoteeEntity extends Equatable {
  const DevoteeEntity({
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

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobileNumber;
  final String? inGroup;
  final String? joinGroup;
  final String? picturesForSocialMedia;
  final String? volunteering;
  final List<Map<String, dynamic>>? volunteeringService;

  @override
  List<Object> get props => [];
}
