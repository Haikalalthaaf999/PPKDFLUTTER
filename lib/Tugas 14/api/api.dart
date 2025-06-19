import 'package:belajar_flutter/Tugas%2014/models/model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.jikan.moe/v4/top/anime';

  static Future<Welcome> fetchTopAnime() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return welcomeFromJson(response.body);
    } else {
      throw Exception('Failed to load anime');
    }
  }
}
