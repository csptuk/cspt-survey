import 'package:equatable/equatable.dart';

class ValidatorsEntity extends Equatable {
  const ValidatorsEntity({
    required this.firstNameValidator,
    required this.lastNameValidator,
    required this.emailValidator,
    required this.mobileNumberValidator,
  });

  final String? Function(String?) firstNameValidator;
  final String? Function(String?) lastNameValidator;
  final String? Function(String?) emailValidator;
  final String? Function(String?) mobileNumberValidator;

  @override
  List<Object> get props => [];
}
