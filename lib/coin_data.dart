import 'package:http/http.dart' as http;
import 'dart:convert';

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
  'ZAR',
  'PHP'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String currency) async {
    const openWeatherMapURL = 'apiv2.bitcoinaverage.com';
    const unencodedPath = '/indices/global/ticker/BTC';
    const apikey = 'NTI3NmU3MmVmMzRmNGUwYTgwNTQyYWFjNzZlZjVhYjc';
    Map<String, dynamic> queryParams = {};

    var url = Uri.https(openWeatherMapURL, unencodedPath+currency, queryParams);

    http.Response response = await http.get(url, headers: {'x-ba-key': apikey});

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['last'];
      return lastPrice;
    } else {
      print(response.body);
      print(response.statusCode);
    }
  }
}
