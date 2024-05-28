import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';
import 'package:csspt_app/features/data_entry/data/models/validators_model.dart';
import 'package:equatable/equatable.dart';

class DataEntryStateDataEntity extends Equatable {
  const DataEntryStateDataEntity({
    this.data,
    this.validators,
    this.validationFailed,
    this.submitted,
  });

  final DataEntryDevoteeModel? data;
  final ValidatorsModel? validators;
  final bool? validationFailed;
  final bool? submitted;

  @override
  List<Object> get props => [];
}
