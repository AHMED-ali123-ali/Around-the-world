class CountryModel {
  final String name;
  final String capital;
  final int population;
  final List<String> languages;
  final List<String> currencies;
  final String flagUrl;

  CountryModel({
    required this.name,
    required this.capital,
    required this.population,
    required this.languages,
    required this.currencies,
    required this.flagUrl,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    // اللغات
    List<String> langs = [];
    if (json['languages'] != null) {
      langs = (json['languages'] as Map<String, dynamic>).values.map((e) => e.toString()).toList();
    }

    // العملات
    List<String> currs = [];
    if (json['currencies'] != null) {
      currs = (json['currencies'] as Map<String, dynamic>).values
          .map((e) => e['name'].toString())
          .toList();
    }

    return CountryModel(
      name: json['name']['common'] ?? '',
      capital: (json['capital'] != null && (json['capital'] as List).isNotEmpty)
          ? json['capital'][0]
          : 'No Capital',
      population: json['population'] ?? 0,
      languages: langs,
      currencies: currs,
      flagUrl: json['flags']['png'] ?? '',
    );
  }
}