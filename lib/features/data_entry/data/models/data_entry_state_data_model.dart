import 'package:csspt_app/features/data_entry/data/models/validators_model.dart';
import 'package:csspt_app/features/data_entry/domain/entities/data_entry_state_data_entity.dart';

class DataEntryStateDataModel extends DataEntryStateDataEntity {
  const DataEntryStateDataModel({
    super.data,
    super.validators,
    super.consent,
    super.validationFailed,
    super.submitted,
  });

  factory DataEntryStateDataModel.fromJson(Map<String, dynamic> json) {
    return DataEntryStateDataModel(
      data: json["data"],
      consent: json["consent"],
      validationFailed: json["validation_failed"],
      submitted: json["submitted"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data,
      "consent": consent,
      "validation_failed": validationFailed,
      "submitted": submitted,
    };
  }

  DataEntryStateDataModel copyWith({
    bool? visualizeData,
    Map<String, dynamic>? data,
    ValidatorsModel? validators,
    bool? consent,
    bool? validationFailed,
    bool? submitted,
  }) {
    return DataEntryStateDataModel(
      data: data ?? this.data,
      validators: validators ?? this.validators,
      consent: consent ?? this.consent,
      validationFailed: validationFailed ?? this.validationFailed,
      submitted: submitted ?? this.submitted,
    );
  }

  @override
  String toString() {
    return "data: $data, consent: $consent, validationFailed: $validationFailed, submitted: $submitted";
  }
}
