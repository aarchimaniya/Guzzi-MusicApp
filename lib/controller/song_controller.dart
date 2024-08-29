import 'package:get/get.dart';
import '../helper/api.dart';

class SongController extends GetxController {
  var isLoading = false.obs;
  var searchResults = <Map<String, String>>[].obs;

  final SongService _songService = SongService();

  // Function to search songs using the service
  void searchSongs(String query) async {
    try {
      isLoading.value = true;
      var results = await _songService.searchSongs(query);
      searchResults.value = results;
    } catch (e) {
      Get.snackbar('Error', 'Failed to search songs: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
