import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';
import 'package:csspt_app/features/data_entry/data/models/validators_model.dart';
import 'package:csspt_app/features/data_entry/domain/entities/data_entry_state_data_entity.dart';

class DataEntryStateDataModel extends DataEntryStateDataEntity {
  const DataEntryStateDataModel({
    super.data,
    super.validators,
    super.validationFailed,
  });

  factory DataEntryStateDataModel.fromJson(Map<String, dynamic> json) {
    return DataEntryStateDataModel(
      data: json["data"],
      validationFailed: json["validation_failed"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data,
      "validation_failed": validationFailed,
    };
  }

  DataEntryStateDataModel copyWith({
    DataEntryDevoteeModel? data,
    ValidatorsModel? validators,
    bool? validationFailed,
  }) {
    return DataEntryStateDataModel(
      data: data ?? this.data,
      validators: validators ?? this.validators,
      validationFailed: validationFailed ?? this.validationFailed,
    );
  }

  @override
  String toString() {
    return "data: $data, validationFailed: $validationFailed";
  }
}
