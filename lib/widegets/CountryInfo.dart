import 'package:flutter/material.dart';

class CountryInfoWidget extends StatelessWidget {
  final String capital;
  final int population;
  final List<String> languages;
  final List<String> currencies;

  const CountryInfoWidget({
    super.key,
    required this.capital,
    required this.population,
    required this.languages,
    required this.currencies,
  });

  @override
  Widget build(BuildContext context) {
    final style = const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text("Capital: $capital", style: style),
        Text("Population: $population", style: style),
        Text("Languages: ${languages.join(", ")}", style: style),
        Text("Currencies: ${currencies.join(", ")}", style: style),
      ],
    );
  }
}