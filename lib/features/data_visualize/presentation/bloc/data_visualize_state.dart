part of 'data_visualize_bloc.dart';

abstract class DataVisualizeState extends Equatable {
  const DataVisualizeState({this.stateData});

  final DataVisualizeStateDataModel? stateData;

  @override
  List<Object> get props => [Random().nextDouble()];
}

abstract class DataVisualizeActionState extends DataVisualizeState {}

class DataVisualizeLoadingState extends DataVisualizeState {}

class DataVisualizeLoadedState extends DataVisualizeState {
  const DataVisualizeLoadedState({super.stateData});
}

class SwitchToDataEntryState extends DataVisualizeState {}

class DataVisualizeDupActionState extends DataVisualizeActionState {}
