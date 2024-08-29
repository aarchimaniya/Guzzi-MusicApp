import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchController extends GetxController {
  var isLoading = false.obs; // Observable variable for loading state
  var searchResults =
      <Map<String, String>>[].obs; // Observable list for search results

  // Function to search songs using an API
  Future<void> searchSongs(String query) async {
    isLoading.value = true; // Show loading indicator

    try {
      final response = await http.get(
        Uri.parse('https://api.example.com/search?query=$query'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Cast API results to List<Map<String, String>>
        searchResults.value = (data['results'] as List)
            .map((item) => {
                  'title': item['title']?.toString() ?? 'Unknown Title',
                  'artist': item['artist']?.toString() ?? 'Unknown Artist',
                  'image': item['image']?.toString() ??
                      'https://via.placeholder.com/150', // Fallback image
                })
            .toList();
      } else {
        // Handle non-200 status codes
        Get.snackbar('Error', 'Failed to fetch songs');
      }
    } catch (error) {
      // Handle network or parsing errors
      Get.snackbar('Error', 'An error occurred: $error');
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }
}
