import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:template/album.dart';

class ApiService {
  final String baseUrl ='https://jsonplaceholder.typicode.com'; // Replace with your API endpoint.

  Future<List<Album>> getAlbums() async {
        var url = Uri.parse('$baseUrl/albums');
    final response =
        await http.get(url, headers: {"Content-type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Album.fromJson(e)).toList();
  }

  Future<Album> getAlbum(int itemId) async {
    // final response = await http.get(Uri.parse('$baseUrl/albums/$itemId'));
    final response = await http.get(Uri.parse('$baseUrl/albums/$itemId'));
    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
