import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  var isPlaying = false.obs;
  var currentLyrics = ''.obs;

  // Example song with its lyrics, replace it with your data
  final Map<String, dynamic> song = {
    'title': 'Song Title',
    'artist': 'Artist Name',
    'image': 'https://example.com/image.jpg',
    'url': 'https://example.com/song.mp3', // Link to the song audio
    'lyrics': [
      {'time': 0, 'text': 'Line 1 of the lyrics'},
      {'time': 10, 'text': 'Line 2 of the lyrics'},
      {'time': 20, 'text': 'Line 3 of the lyrics'},
    ],
  };

  @override
  void onInit() {
    super.onInit();
    loadAudio();
    setupLyricsSync();
  }

  Future<void> loadAudio() async {
    try {
      await audioPlayer.setUrl(song['url']);
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  void playPause() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
      isPlaying.value = false;
    } else {
      audioPlayer.play();
      isPlaying.value = true;
    }
  }

  void setupLyricsSync() {
    audioPlayer.positionStream.listen((position) {
      final lyrics = song['lyrics'];
      for (var i = 0; i < lyrics.length; i++) {
        if (i < lyrics.length - 1) {
          if (position.inSeconds >= lyrics[i]['time'] &&
              position.inSeconds < lyrics[i + 1]['time']) {
            currentLyrics.value = lyrics[i]['text'];
          }
        } else if (i == lyrics.length - 1) {
          if (position.inSeconds >= lyrics[i]['time']) {
            currentLyrics.value = lyrics[i]['text'];
          }
        }
      }
    });
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
