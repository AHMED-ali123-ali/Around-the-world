import '../model/data.dart';

abstract class AppState {}

class AppInitialState extends AppState {}

class AppLoadingState extends AppState {}

class AppSuccessState extends AppState {
  final List<CountryModel> countries;

  AppSuccessState(this.countries);
}

class AppErrorState extends AppState {
  final String message;

  AppErrorState(this.message);
}