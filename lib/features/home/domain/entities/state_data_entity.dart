import 'package:csspt_app/features/home/data/models/devotee_model.dart';
import 'package:equatable/equatable.dart';

class StateDataEntity extends Equatable {
  const StateDataEntity({
    this.data,
    this.errorFields,
  });

  final DevoteeModel? data;
  final List<String>? errorFields;

  @override
  List<Object> get props => [];
}
