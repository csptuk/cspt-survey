part of 'data_entry_bloc.dart';

abstract class DataEntryState extends Equatable {
  const DataEntryState({this.stateData});

  final DataEntryStateDataModel? stateData;

  @override
  List<Object> get props => [stateData!];
}

abstract class DataEntryActionState extends DataEntryState {}

class DataEntryLoadingState extends DataEntryState {}

class DataEntryLoadedState extends DataEntryState {
  const DataEntryLoadedState({super.stateData});
}

class DataEntrySubmittedState extends DataEntryState {}

class DataEntryDupActionState extends DataEntryActionState {}
