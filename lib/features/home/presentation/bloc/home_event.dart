part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadedEvent extends HomeEvent {
  const LoadedEvent();
}

class TextFieldFocusChangeEvent extends HomeEvent {
  const TextFieldFocusChangeEvent({
    required this.key,
    required this.value,
    required this.stateData,
  });

  final String key;
  final String value;
  final StateDataModel stateData;
}

class RadioButtonToggledEvent extends HomeEvent {
  const RadioButtonToggledEvent({
    required this.key,
    required this.value,
    required this.stateData,
  });

  final String key;
  final String value;
  final StateDataModel stateData;
}

class CheckboxSelectedEvent extends HomeEvent {
  const CheckboxSelectedEvent({
    required this.key,
    required this.value,
    required this.stateData,
  });

  final String? key;
  final bool? value;
  final StateDataModel stateData;
}

class ValidationFailedEvent extends HomeEvent {
  const ValidationFailedEvent({
    required this.stateData,
  });

  final StateDataModel stateData;
}

class FormSubmittedEvent extends HomeEvent {
  const FormSubmittedEvent({
    required this.stateData,
  });

  final StateDataModel stateData;
}
