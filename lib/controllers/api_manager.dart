import 'package:http/http.dart';

class ApiManager {
  static final url =
      Uri.parse('https://desafio-mobile.nyc3.digitaloceanspaces.com/movies');

  static Future<String> get getData async {
    final response = await get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.statusCode.toString();
    }
  }
}
