import 'package:csspt_app/features/home/data/models/home_devotee_model.dart';
import 'package:csspt_app/features/home/data/models/validators_model.dart';
import 'package:csspt_app/features/home/domain/entities/state_data_entity.dart';

class StateDataModel extends StateDataEntity {
  const StateDataModel({
    super.data,
    super.validators,
    super.validationFailed,
  });

  factory StateDataModel.fromJson(Map<String, dynamic> json) {
    return StateDataModel(
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

  StateDataModel copyWith({
    HomeDevoteeModel? data,
    ValidatorsModel? validators,
    bool? validationFailed,
  }) {
    return StateDataModel(
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
