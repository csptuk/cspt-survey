part of 'data_visualize_bloc.dart';

abstract class DataVisualizeEvent extends Equatable {
  const DataVisualizeEvent();

  @override
  List<Object> get props => [];
}

class LoadedEvent extends DataVisualizeEvent {
  const LoadedEvent();
}

class BackToDataEntryEvent extends DataVisualizeEvent {
  const BackToDataEntryEvent();
}

class EditDataEntryEvent extends DataVisualizeEvent {
  const EditDataEntryEvent({
    required this.key,
    required this.stateData,
  });

  final int key;
  final DataVisualizeStateDataModel stateData;
}

class SaveDataEntryEvent extends DataVisualizeEvent {
  const SaveDataEntryEvent({
    required this.key,
    required this.texts,
    required this.stateData,
  });

  final int key;
  final List<String> texts;
  final DataVisualizeStateDataModel stateData;
}

class DeleteDataEntryEvent extends DataVisualizeEvent {
  const DeleteDataEntryEvent({
    required this.key,
    required this.stateData,
  });

  final int key;
  final DataVisualizeStateDataModel stateData;
}

class UploadToCloudEvent extends DataVisualizeEvent {}

class ExportCloudDataToExcelEvent extends DataVisualizeEvent {}

class ExportLocalDataToExcelEvent extends DataVisualizeEvent {}
