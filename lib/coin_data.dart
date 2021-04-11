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
  Future getCoinData(String selectedCurrency) async {
    const openWeatherMapURL = 'rest.coinapi.io';
    const unencodedPath = '/v1/exchangerate/';
    const apikey = 'B188F3C2-A2D5-46B2-8C92-D7212F12F1DB';
    Map<String, dynamic> queryParams = {};

    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {

      var url = Uri.https(openWeatherMapURL, unencodedPath+crypto+'/'+selectedCurrency, queryParams);
      http.Response response = await http.get(url, headers: {'X-CoinAPI-Key': apikey});

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        print(response.body);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
