import 'package:equatable/equatable.dart';

class DataVisualizeDevoteeEntity extends Equatable {
  const DataVisualizeDevoteeEntity({
    this.key,
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
    this.editState,
  });

  final int? key;
  final DateTime? date;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobileNumber;
  final String? inGroup;
  final String? joinGroup;
  final String? picturesForSocialMedia;
  final String? volunteering;
  final List<Map<String, dynamic>>? volunteeringService;
  final bool? editState;

  @override
  List<Object> get props => [];
}
