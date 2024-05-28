import 'package:csspt_app/features/data_visualize/data/models/data_visualize_column_model.dart';
import 'package:csspt_app/features/data_visualize/domain/entities/data_visualize_state_data_entity.dart';

class DataVisualizeStateDataModel extends DataVisualizeStateDataEntity {
  const DataVisualizeStateDataModel({
    super.columns,
    super.data,
  });

  factory DataVisualizeStateDataModel.fromJson(Map<String, dynamic> json) {
    return DataVisualizeStateDataModel(
      columns: json["columns"],
      data: json["data"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "columns": columns,
      "data": data,
    };
  }

  DataVisualizeStateDataModel copyWith({
    List<DataVisualizeColumnModel>? columns,
    List<Map<String, dynamic>>? data,
  }) {
    return DataVisualizeStateDataModel(
      columns: columns ?? this.columns,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return "columns: $columns, data: $data";
  }
}
