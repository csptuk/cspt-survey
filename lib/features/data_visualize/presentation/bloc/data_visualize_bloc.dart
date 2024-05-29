import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_state_data_model.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/delete_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/edit_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/export_cloud_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/export_local_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/initial_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/save_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/upload_local_data_visualize_usecase.dart';
import 'package:equatable/equatable.dart';

part 'data_visualize_event.dart';
part 'data_visualize_state.dart';

class DataVisualizeBloc extends Bloc<DataVisualizeEvent, DataVisualizeState> {
  final InitialDataVisualizeUseCase? _initialDataVisualizeUseCase;
  final EditDataVisualizeUseCase? _editDataVisualizeUseCase;
  final SaveDataVisualizeUseCase? _saveDataVisualizeUseCase;
  final DeleteDataVisualizeUseCase? _deleteDataVisualizeUseCase;
  final UploadLocalDataVisualizeUseCase? _uploadLocalDataVisualizeUseCase;
  final ExportCloudDataVisualizeUseCase? _exportCloudDataVisualizeUseCase;
  final ExportLocalDataVisualizeUseCase? _exportLocalDataVisualizeUseCase;

  DataVisualizeBloc(
    this._initialDataVisualizeUseCase,
    this._editDataVisualizeUseCase,
    this._saveDataVisualizeUseCase,
    this._deleteDataVisualizeUseCase,
    this._uploadLocalDataVisualizeUseCase,
    this._exportCloudDataVisualizeUseCase,
    this._exportLocalDataVisualizeUseCase,
  ) : super(DataVisualizeLoadingState()) {
    on<LoadedEvent>(loadedEvent);
    on<BackToDataEntryEvent>(backToDataEntryEvent);
    on<EditDataEntryEvent>(editDataEntryEvent);
    on<SaveDataEntryEvent>(saveDataEntryEvent);
    on<DeleteDataEntryEvent>(deleteDataEntryEvent);
    on<UploadToCloudEvent>(uploadToCloudEvent);
    on<ExportCloudDataToExcelEvent>(exportCloudDataToExcelEvent);
    on<ExportLocalDataToExcelEvent>(exportLocalDataToExcelEvent);
  }

  FutureOr<void> loadedEvent(
      LoadedEvent event, Emitter<DataVisualizeState> emit) async {
    emit(DataVisualizeLoadedState(
        stateData: await _initialDataVisualizeUseCase!()));
  }

  FutureOr<void> backToDataEntryEvent(
      BackToDataEntryEvent event, Emitter<DataVisualizeState> emit) {
    emit(SwitchToDataEntryState());
  }

  FutureOr<void> editDataEntryEvent(
      EditDataEntryEvent event, Emitter<DataVisualizeState> emit) async {
    emit(DataVisualizeLoadedState(
        stateData: await _editDataVisualizeUseCase!(params: {
      "key": event.key,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> saveDataEntryEvent(
      SaveDataEntryEvent event, Emitter<DataVisualizeState> emit) async {
    emit(DataVisualizeLoadedState(
        stateData: await _saveDataVisualizeUseCase!(params: {
      "key": event.key,
      "texts": event.texts,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> deleteDataEntryEvent(
      DeleteDataEntryEvent event, Emitter<DataVisualizeState> emit) async {
    emit(DataVisualizeLoadedState(
        stateData: await _deleteDataVisualizeUseCase!(params: {
      "key": event.key,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> uploadToCloudEvent(
      UploadToCloudEvent event, Emitter<DataVisualizeState> emit) async {
    await _uploadLocalDataVisualizeUseCase!(
        params: {"state_data": event.stateData});
  }

  FutureOr<void> exportCloudDataToExcelEvent(ExportCloudDataToExcelEvent event,
      Emitter<DataVisualizeState> emit) async {
    await _exportCloudDataVisualizeUseCase!(
        params: {"state_data": event.stateData});
  }

  FutureOr<void> exportLocalDataToExcelEvent(ExportLocalDataToExcelEvent event,
      Emitter<DataVisualizeState> emit) async {
    await _exportLocalDataVisualizeUseCase!(
        params: {"state_data": event.stateData});
  }
}
