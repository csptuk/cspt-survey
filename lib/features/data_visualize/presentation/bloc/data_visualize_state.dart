part of 'data_visualize_bloc.dart';

abstract class DataVisualizeState extends Equatable {
  const DataVisualizeState({this.stateData, this.msg});

  final DataVisualizeStateDataModel? stateData;
  final String? msg;

  @override
  List<Object> get props => [Random().nextDouble()];
}

abstract class DataVisualizeActionState extends DataVisualizeState {
  const DataVisualizeActionState({super.msg});
}

class DataVisualizeLoadingState extends DataVisualizeState {}

class DataVisualizeLoadedState extends DataVisualizeState {
  const DataVisualizeLoadedState({super.stateData});
}

class SwitchToDataEntryState extends DataVisualizeState {}

class DataVisualizeSuccessfulActionState extends DataVisualizeActionState {
  const DataVisualizeSuccessfulActionState({super.msg});
}

class DataVisualizeDupActionState extends DataVisualizeActionState {}
