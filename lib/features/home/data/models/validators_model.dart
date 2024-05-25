import 'package:csspt_app/features/home/domain/entities/validators_entity.dart';

class ValidatorsModel extends ValidatorsEntity {
  const ValidatorsModel({
    required super.firstNameValidator,
    required super.lastNameValidator,
    required super.emailValidator,
    required super.mobileNumberValidator,
  });
}
