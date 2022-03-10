import 'dart:convert';

import 'package:http/http.dart';
import 'dart:io';

class ApiManager {
  static final url =
      Uri.parse('https://desafio-mobile.nyc3.digitaloceanspaces.com/movies');

  static Future<String> get data async {
    try {
      final response = await get(url);
      return response.body;
    } on HttpException {
      return 'erro';
    }
  }

  static Future<List> get dataAsList async {
    final data = await ApiManager.data;
    final dataDecoded = json.decode(data);
    return List.from(dataDecoded);
  }
}
