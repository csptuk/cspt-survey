import 'package:csspt_app/features/data_visualize/domain/entities/data_visualize_column_entity.dart';

class DataVisualizeColumnModel extends DataVisualizeColumnEntity {
  const DataVisualizeColumnModel({
    super.title,
    super.value,
  });

  factory DataVisualizeColumnModel.fromJson(Map<String, dynamic> json) {
    return DataVisualizeColumnModel(
      title: json["title"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "value": value,
    };
  }

  DataVisualizeColumnModel copyWith({
    String? title,
    String? value,
  }) {
    return DataVisualizeColumnModel(
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  @override
  String toString() {
    return "title: $title, value: $value";
  }
}
