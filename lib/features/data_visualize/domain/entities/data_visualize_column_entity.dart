import 'package:equatable/equatable.dart';

class DataVisualizeColumnEntity extends Equatable {
  const DataVisualizeColumnEntity({
    this.title,
    this.value,
  });

  final String? title;
  final String? value;

  @override
  List<Object> get props => [];
}
