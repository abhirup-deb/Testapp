import 'dart:convert';
import 'package:http/http.dart' as Http;

class getNetwork {
  getNetwork(this.url);
  final String url;

  dynamic getData() async {
    Http.Response response = await Http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var DecodedData = jsonDecode(data);
      return DecodedData;
    } else {
      print(response.statusCode);
    }
  }
}