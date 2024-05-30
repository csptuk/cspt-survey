part of 'data_entry_bloc.dart';

abstract class DataEntryEvent extends Equatable {
  const DataEntryEvent();

  @override
  List<Object> get props => [];
}

class LoadedEvent extends DataEntryEvent {
  const LoadedEvent();
}

class SwitchToDataVisualizeEvent extends DataEntryEvent {}

class TextFieldFocusChangeEvent extends DataEntryEvent {
  const TextFieldFocusChangeEvent({
    required this.key,
    required this.value,
    required this.stateData,
  });

  final String key;
  final String value;
  final DataEntryStateDataModel stateData;
}

class RadioButtonToggledEvent extends DataEntryEvent {
  const RadioButtonToggledEvent({
    required this.key,
    required this.value,
    required this.stateData,
  });

  final String key;
  final String value;
  final DataEntryStateDataModel stateData;
}

class CheckboxSelectedEvent extends DataEntryEvent {
  const CheckboxSelectedEvent({
    required this.key,
    required this.value,
    required this.stateData,
  });

  final String? key;
  final bool? value;
  final DataEntryStateDataModel stateData;
}

class ConsentCheckboxSelectedEvent extends DataEntryEvent {
  const ConsentCheckboxSelectedEvent({
    required this.value,
    required this.stateData,
  });

  final bool? value;
  final DataEntryStateDataModel stateData;
}

class ValidationFailedEvent extends DataEntryEvent {
  const ValidationFailedEvent({
    required this.stateData,
  });

  final DataEntryStateDataModel stateData;
}

class FormSubmittedEvent extends DataEntryEvent {
  const FormSubmittedEvent({
    required this.stateData,
  });

  final DataEntryStateDataModel stateData;
}

class ResetFormEvent extends DataEntryEvent {}
