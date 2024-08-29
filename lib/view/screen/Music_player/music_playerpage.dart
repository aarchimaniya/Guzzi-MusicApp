import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../controller/my_music_controller.dart';

class MusicPlayerPage extends StatelessWidget {
  final MusicController musicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
      ),
      body: Obx(() {
        final song = musicController.currentSong.value;
        if (song == null) return Center(child: Text('No song playing'));

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://pic-bstarstatic.akamaized.net/ugc/0276fb6a742d72c18708de172e379df8.jpg',
                width: 200,
                height: 200),
            SizedBox(height: 20),
            Text(song.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(song.artist, style: TextStyle(fontSize: 18)),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  iconSize: 48,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(musicController.isPlaying.value
                      ? Icons.pause
                      : Icons.play_arrow),
                  iconSize: 48,
                  onPressed: () {
                    if (musicController.isPlaying.value) {
                      musicController.pauseSong();
                    } else {
                      musicController.resumeSong();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  iconSize: 48,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Slider(
              value: musicController.currentPosition.value,
              onChanged: (value) {
                musicController.seekSong(value);
              },
            ),
            IconButton(
              icon: Icon(
                musicController.isLiked(song)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              onPressed: () {
                if (musicController.isLiked(song)) {
                  musicController.unlikeSong(song);
                } else {
                  musicController.likeSong(song);
                }
              },
            ),
          ],
        );
      }),
    );
  }
}
