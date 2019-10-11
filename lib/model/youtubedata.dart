import 'package:http/http.dart' as http;

class NetworkingHelper {
  final String url;
  NetworkingHelper(this.url);

  Future getData() async {
    var data;
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      data = response.body;
    } else {
      data = response.statusCode;
    }
    return data;
  }

}
