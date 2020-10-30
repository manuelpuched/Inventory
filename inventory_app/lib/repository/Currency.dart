class Currency {
  // Converting Map to List of Map Entries....
  List<MapEntry<String, dynamic>> rates;
  String date;
  String base;

  Currency({this.rates, this.date, this.base});

  factory Currency.createJSON(Map<String, dynamic> json) {
    return Currency(
        rates: json['rates'].entries.toList(),
        date: json['date'],
        base: json['base']);
  }
}