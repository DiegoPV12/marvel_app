import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';
import '../models/comic.dart';
import 'config.dart';

  const String baseUrl = 'https://gateway.marvel.com:443/v1/public/';
  final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
  final hash = generateMd5(timeStamp + PRIVATE_KEY + PUBLIC_KEY);


class MarvelService {


  Future<List<Character>> fetchCharacters() async {
    final url = '$baseUrl' 'characters?events=234&ts=$timeStamp&apikey=$PUBLIC_KEY&hash=$hash';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> characterJson = data['data']['results'];
      return characterJson.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<List<Comic>> fetchComics() async {
    final url = '$baseUrl' 'comics?events=234&ts=$timeStamp&apikey=$PUBLIC_KEY&hash=$hash';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> comicJson = data['data']['results'];
      return comicJson.map((json) => Comic.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comics');
    }
  }


 Future<List<Character>> searchCharacters(String query) async {
    var url = Uri.parse('$baseUrl/characters?nameStartsWith=$query&ts=$timeStamp&apikey=$PUBLIC_KEY&hash=$hash');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Character> characters = (data['data']['results'] as List).map((item) => Character.fromJson(item)).toList();
      return characters;
    } else {
      throw Exception("Error fetching data");
    }
  }

  Future<List<Comic>> searchComics(String query) async {
    var url = Uri.parse('$baseUrl/comics?titleStartsWith=$query&ts=$timeStamp&apikey=$PUBLIC_KEY&hash=$hash');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Comic> comics = (data['data']['results'] as List).map((item) => Comic.fromJson(item)).toList();
      return comics;
    } else {
      throw Exception("Error fetching data");
    }
  }
}

  
