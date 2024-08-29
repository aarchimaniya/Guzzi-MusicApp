import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/my_music_controller.dart';
import '../Music_player/music_playerpage.dart';

class LikedSongsPage extends StatelessWidget {
  final MusicController musicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Songs'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: musicController.likedSongs.length,
          itemBuilder: (context, index) {
            final song = musicController.likedSongs[index];
            return ListTile(
              leading: Image.asset(song.albumArt),
              title: Text(song.title),
              subtitle: Text(song.artist),
              onTap: () {
                musicController.playSong(song);
                Get.to(() => MusicPlayerPage());
              },
            );
          },
        ),
      ),
    );
  }
}
