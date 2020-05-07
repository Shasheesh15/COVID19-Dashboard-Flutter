import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url, headers: {
      "countries": "covidapi:countries",
    });

    if (response.statusCode == 200) {
      String data = response.body;

      try {
        return jsonDecode(data);
      } catch (e) {
        print(e);
      }
    } else
      print(response.statusCode);
  }
}

class NetworkHelper2 {
  NetworkHelper2();

  Future getData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/all');

    if (response.statusCode == 200) {
      String data = response.body;

      try {
        return jsonDecode(data);
      } catch (e) {
        print(e);
      }
    } else
      print(response.statusCode);
  }
}
