import 'dart:convert';
import 'package:http/http.dart' as http;

class SongService {
  static const String baseUrl = 'https://itunes.apple.com/search';

  // Function to search for songs by query
  Future<List<Map<String, String>>> searchSongs(String query) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl?term=$query&entity=song&limit=10'), // Adjust based on your API
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Casting items to a List<Map<String, String>>
      return (data['results'] as List).map((item) {
        return {
          'title': (item['trackName'] ?? 'Unknown Title').toString(),
          'artist': (item['artistName'] ?? 'Unknown Artist').toString(),
          'image': (item['artworkUrl100'] ?? 'https://via.placeholder.com/150')
              .toString(),
        };
      }).toList();
    } else {
      throw Exception('Failed to fetch songs');
    }
  }
}
