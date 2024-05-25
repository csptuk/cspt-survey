import 'package:csspt_app/features/home/data/models/home_devotee_model.dart';
import 'package:csspt_app/features/home/data/models/validators_model.dart';
import 'package:equatable/equatable.dart';

class StateDataEntity extends Equatable {
  const StateDataEntity({
    this.data,
    this.validators,
    this.validationFailed,
  });

  final HomeDevoteeModel? data;
  final ValidatorsModel? validators;
  final bool? validationFailed;

  @override
  List<Object> get props => [];
}
