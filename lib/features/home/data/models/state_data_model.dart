import 'package:csspt_app/features/home/data/models/devotee_model.dart';
import 'package:csspt_app/features/home/domain/entities/state_data_entity.dart';

class StateDataModel extends StateDataEntity {
  const StateDataModel({
    super.data,
    super.errorFields,
  });

  factory StateDataModel.fromJson(Map<String, dynamic> json) {
    return StateDataModel(
      data: json["data"],
      errorFields: json["error_fields"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data,
      "error_fields": errorFields,
    };
  }

  StateDataModel copyWith({
    DevoteeModel? data,
    List<String>? errorFields,
  }) {
    return StateDataModel(
      data: data ?? this.data,
      errorFields: errorFields ?? this.errorFields,
    );
  }

  @override
  String toString() {
    return "data: $data, errorFields: $errorFields";
  }
}
