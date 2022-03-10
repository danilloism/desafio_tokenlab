import 'package:http/http.dart';
import 'dart:io';

class ApiService {
  static const url =
      'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';

  static Future<String> get data async {
    try {
      final response = await get(Uri.parse(url));
      return response.body;
    } on HttpException catch (error) {
      return error.message;
    }
  }

  static Future<String> movieData(int id) async {
    try {
      final uri = Uri.parse('$url/${id.toString()}');
      final response = await get(uri);
      return response.body;
    } on HttpException catch (error) {
      return error.message;
    } on Exception catch (error) {
      return error.toString();
    }
  }

  // static Future<List> get dataAsList async {
  //   final data = await ApiManager.data;
  //   final dataDecoded = json.decode(data);
  //   return List.from(dataDecoded);
  // }
}
