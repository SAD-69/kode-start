import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  static Future<List<Character>> getCharacters({String? query}) async {
    String url = '$baseUrl/character';
    if (query != null && query.isNotEmpty) {
      url += '?name=$query';
    }

    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final List results = data['results'];

      return Future.wait(results.map((char) async {
        final firstEpisodeUrl = char['episode'][0];
        final epRes = await http.get(Uri.parse(firstEpisodeUrl));
        final epData = jsonDecode(epRes.body);
        return Character.fromJson(char, epData['name']);
      }));
    } else {
      throw Exception('Erro ao carregar personagens');
    }
  }
}
