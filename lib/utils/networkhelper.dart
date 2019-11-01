import 'package:http/http.dart';
import 'dart:convert';


class NetworkingHelper {
  NetworkingHelper(this.url);
  String url;
  Future getDecodeddata() async {
    try {
      Response data = await get(url);
      return jsonDecode(data.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

