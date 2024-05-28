import 'package:csspt_app/features/data_visualize/data/models/data_visualize_column_model.dart';
import 'package:equatable/equatable.dart';

class DataVisualizeStateDataEntity extends Equatable {
  const DataVisualizeStateDataEntity({
    this.columns,
    this.data,
  });

  final List<DataVisualizeColumnModel>? columns;
  final List<Map<String, dynamic>>? data;

  @override
  List<Object> get props => [];
}
