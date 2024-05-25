import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';
import 'package:csspt_app/features/home/domain/usecases/checkbox_selected_usecase.dart';
import 'package:csspt_app/features/home/domain/usecases/form_submitted_usecase.dart';
import 'package:csspt_app/features/home/domain/usecases/initial_home_usecase.dart';
import 'package:csspt_app/features/home/domain/usecases/radio_button_toggled_usecase.dart';
import 'package:csspt_app/features/home/domain/usecases/text_field_focus_change_usecase.dart';
import 'package:csspt_app/features/home/domain/usecases/validation_failed_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final InitialHomeUseCase? _initialHomeUseCase;
  final TextFieldFocusChangeUseCase? _textFieldFocusChangeUseCase;
  final RadioButtonToggledUseCase? _radioButtonToggledUseCase;
  final CheckboxSelectedUseCase? _checkboxSelectedUseCase;
  final ValidationFailedUseCase? _validationFailedUseCase;
  final FormSubmittedUseCase? _formSubmittedUseCase;

  HomeBloc(
    this._initialHomeUseCase,
    this._textFieldFocusChangeUseCase,
    this._radioButtonToggledUseCase,
    this._checkboxSelectedUseCase,
    this._validationFailedUseCase,
    this._formSubmittedUseCase,
  ) : super(HomeLoadingState()) {
    on<LoadedEvent>(loadedEvent);
    on<TextFieldFocusChangeEvent>(textFieldFocusChangeEvent);
    on<RadioButtonToggledEvent>(radioButtonToggledEvent);
    on<CheckboxSelectedEvent>(checkboxSelectedEvent);
    on<ValidationFailedEvent>(validationFailedEvent);
    on<FormSubmittedEvent>(formSubmittedEvent);
  }

  FutureOr<void> loadedEvent(LoadedEvent event, Emitter<HomeState> emit) async {
    emit(HomeDupActionState());
    emit(HomeDataEntryState(stateData: await _initialHomeUseCase!()));
  }

  FutureOr<void> textFieldFocusChangeEvent(
      TextFieldFocusChangeEvent event, Emitter<HomeState> emit) async {
    emit(HomeDupActionState());
    emit(HomeDataEntryState(
        stateData: await _textFieldFocusChangeUseCase!(params: {
      "key": event.key,
      "value": event.value,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> radioButtonToggledEvent(
      RadioButtonToggledEvent event, Emitter<HomeState> emit) async {
    emit(HomeDupActionState());
    emit(HomeDataEntryState(
        stateData: await _radioButtonToggledUseCase!(params: {
      "key": event.key,
      "value": event.value,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> checkboxSelectedEvent(
      CheckboxSelectedEvent event, Emitter<HomeState> emit) async {
    emit(HomeDupActionState());
    emit(HomeDataEntryState(
        stateData: await _checkboxSelectedUseCase!(params: {
      "key": event.key,
      "value": event.value,
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> validationFailedEvent(
      ValidationFailedEvent event, Emitter<HomeState> emit) async {
    emit(HomeDupActionState());
    emit(HomeDataEntryState(
        stateData: await _validationFailedUseCase!(params: {
      "state_data": event.stateData,
    })));
  }

  FutureOr<void> formSubmittedEvent(
      FormSubmittedEvent event, Emitter<HomeState> emit) async {
    emit(HomeDupActionState());
    _formSubmittedUseCase!();
    emit(HomeLoadingState());
  }
}
