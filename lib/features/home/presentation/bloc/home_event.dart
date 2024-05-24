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

class InGroupSelectedEvent extends HomeEvent {
  const InGroupSelectedEvent({
    required this.inGroup,
    required this.stateData,
  });

  final String? inGroup;
  final StateDataModel stateData;
}

class JoinGroupSelectedEvent extends HomeEvent {
  const JoinGroupSelectedEvent({
    required this.joinGroup,
    required this.stateData,
  });

  final String? joinGroup;
  final StateDataModel stateData;
}

class PicturesForSocialMediaSelectedEvent extends HomeEvent {
  const PicturesForSocialMediaSelectedEvent({
    required this.picturesForSocialMedia,
    required this.stateData,
  });

  final String? picturesForSocialMedia;
  final StateDataModel stateData;
}

class VolunteeringSelectedEvent extends HomeEvent {
  const VolunteeringSelectedEvent({
    required this.volunteering,
    required this.stateData,
  });

  final String? volunteering;
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

class VolunteeringServiceSelectedEvent extends HomeEvent {
  const VolunteeringServiceSelectedEvent({
    required this.key,
    required this.value,
    required this.stateData,
  });

  final String? key;
  final bool? value;
  final StateDataModel stateData;
}

class FormSubmittedEvent extends HomeEvent {
  const FormSubmittedEvent({
    required this.stateData,
  });

  final StateDataModel stateData;
}
