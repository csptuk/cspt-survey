import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/checkbox_selected_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/form_submitted_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/initial_data_entry_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/radio_button_toggled_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/text_field_focus_change_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/validation_failed_usecase.dart';
import 'package:equatable/equatable.dart';

part 'data_entry_event.dart';
part 'data_entry_state.dart';

class DataEntryBloc extends Bloc<DataEntryEvent, DataEntryState> {
  final InitialDataEntryUseCase? _initialDataEntryUseCase;
  final TextFieldFocusChangeUseCase? _textFieldFocusChangeUseCase;
  final RadioButtonToggledUseCase? _radioButtonToggledUseCase;
  final CheckboxSelectedUseCase? _checkboxSelectedUseCase;
  final ValidationFailedUseCase? _validationFailedUseCase;
  final FormSubmittedUseCase? _formSubmittedUseCase;

  DataEntryBloc(
    this._initialDataEntryUseCase,
    this._textFieldFocusChangeUseCase,
    this._radioButtonToggledUseCase,
    this._checkboxSelectedUseCase,
    this._validationFailedUseCase,
    this._formSubmittedUseCase,
  ) : super(DataEntryLoadingState()) {
    on<LoadedEvent>(loadedEvent);
    on<SwitchToDataVisualizeEvent>(switchToDataVisualizeEvent);
    on<TextFieldFocusChangeEvent>(textFieldFocusChangeEvent);
    on<RadioButtonToggledEvent>(radioButtonToggledEvent);
    on<CheckboxSelectedEvent>(checkboxSelectedEvent);
    on<ValidationFailedEvent>(validationFailedEvent);
    on<FormSubmittedEvent>(formSubmittedEvent);
    on<ResetFormEvent>(resetFormEvent);
  }

  FutureOr<void> loadedEvent(
      LoadedEvent event, Emitter<DataEntryState> emit) async {
    // emit(DataEntryDupActionState());
    emit(DataEntryLoadedState(stateData: await _initialDataEntryUseCase!()));
  }

  FutureOr<void> switchToDataVisualizeEvent(
      SwitchToDataVisualizeEvent event, Emitter<DataEntryState> emit) {
    emit(SwitchToDataVisualizeState());
  }

  FutureOr<void> textFieldFocusChangeEvent(
      TextFieldFocusChangeEvent event, Emitter<DataEntryState> emit) async {
    // emit(DataEntryDupActionState());
    emit(DataEntryLoadedState(
        stateData: await _textFieldFocusChangeUseCase!(params: {
      "key": event.key,
      "value": event.value,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> radioButtonToggledEvent(
      RadioButtonToggledEvent event, Emitter<DataEntryState> emit) async {
    // emit(DataEntryDupActionState());
    emit(DataEntryLoadedState(
        stateData: await _radioButtonToggledUseCase!(params: {
      "key": event.key,
      "value": event.value,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> checkboxSelectedEvent(
      CheckboxSelectedEvent event, Emitter<DataEntryState> emit) async {
    // emit(DataEntryDupActionState());
    emit(DataEntryLoadedState(
        stateData: await _checkboxSelectedUseCase!(params: {
      "key": event.key,
      "value": event.value,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> validationFailedEvent(
      ValidationFailedEvent event, Emitter<DataEntryState> emit) async {
    // emit(DataEntryDupActionState());
    emit(DataEntryLoadedState(
        stateData: await _validationFailedUseCase!(params: {
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> formSubmittedEvent(
      FormSubmittedEvent event, Emitter<DataEntryState> emit) async {
    // emit(DataEntryDupActionState());
    emit(DataEntryLoadedState(
        stateData: await _formSubmittedUseCase!(params: {
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> resetFormEvent(
      ResetFormEvent event, Emitter<DataEntryState> emit) async {
    // emit(DataEntryDupActionState());
    emit(DataEntryLoadedState(stateData: await _initialDataEntryUseCase!()));
  }
}
