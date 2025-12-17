import 'package:flutter_bloc/flutter_bloc.dart';
import '../network/api_service.dart';
import 'app_state.dart';

class CountryCubit extends Cubit<AppState> {
  final CountryService service;

  CountryCubit(this.service) : super(AppInitialState());

  Future<void> getCountries(String name) async {
    emit(AppLoadingState());

    try {
      final countries = await service.getCountries(name);
      if (countries.isNotEmpty) {
        emit(AppSuccessState(countries));
      } else {
        emit(AppErrorState("No countries found"));
      }
    } catch (e) {
      emit(AppErrorState(e.toString()));
    }
  }
}