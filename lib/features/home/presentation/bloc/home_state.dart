part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({this.stateData});

  final StateDataModel? stateData;

  @override
  List<Object> get props => [stateData!];
}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeDataEntryState extends HomeState {
  const HomeDataEntryState({super.stateData});
}

class HomeDataSubmittedState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeDupActionState extends HomeActionState {}
