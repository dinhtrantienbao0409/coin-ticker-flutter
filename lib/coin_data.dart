import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String apiKey = "D3C224E3-A7C6-4868-BA57-1BA1E68A527F";
  String baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      Uri url = Uri.parse('$baseUrl/$crypto/$selectedCurrency?apikey=$apiKey');
      http.Response response = await http.get(url);
      // print(response.statusCode);
      //
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
        print(cryptoPrices);
      }
    }
    return cryptoPrices;
  }
}
