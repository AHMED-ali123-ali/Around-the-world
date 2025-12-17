import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/data.dart';

class CountryService {
  Future<List<CountryModel>> getCountries(String name) async {
    final url = Uri.parse(
        "https://restcountries.com/v3.1/name/$name?fields=name,capital,population,flags,languages,currencies"
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data as List).map((e) => CountryModel.fromJson(e)).toList();
    }

    return [];
  }
}