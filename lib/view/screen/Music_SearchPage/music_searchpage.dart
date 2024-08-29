import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/song_controller.dart';
import '../MusicPlayer_Page/music_playerpage.dart';

class SearchPage extends StatelessWidget {
  final SongController _controller = Get.put(SongController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Color(0xFF202024),
      ),
      backgroundColor: Color(0xFF202024),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white12,
                hintText: 'Search songs...',
                prefixIcon: Icon(Icons.search, color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (query) {
                _controller.searchSongs(query);
              },
            ),
            SizedBox(height: 20),
            Obx(() {
              if (_controller.isLoading.value) {
                return CircularProgressIndicator();
              } else if (_controller.searchResults.isEmpty) {
                return Text(
                  'No results found',
                  style: TextStyle(color: Colors.white),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: _controller.searchResults.length,
                    itemBuilder: (context, index) {
                      final song = _controller.searchResults[index];
                      return ListTile(
                        leading: Image.network(song['image']!,
                            width: 50, fit: BoxFit.cover),
                        title: Text(song['title']!,
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(song['artist']!,
                            style: TextStyle(color: Colors.white54)),
                        onTap: () {
                          Get.to(() => MusicPlayPage(song: song));
                        },
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
