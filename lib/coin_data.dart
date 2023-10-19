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
  Future getCoinData(String selectedCurrency) async {
    Uri url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$apiKey');
    http.Response response = await http.get(url);
    // print(response.statusCode);
    //
    // if (response.statusCode == 200) {
    //   String data = response.body;
    //   print(data);
    // }
  }
}
