import 'package:get/get.dart';
import '../helper/liked_song_database/liked_song.dart';
import '../modal/music_modal.dart';

class MusicController extends GetxController {
  var songs = <Song>[].obs;
  var likedSongs = <Song>[].obs;
  var currentSong = Rx<Song?>(null);
  var isPlaying = false.obs;
  var currentPosition = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadSongs();
    loadLikedSongs();
  }

  void loadSongs() {
    songs.addAll([
      Song(
        id: 1,
        title: 'Song 1',
        artist: 'Artist 1',
        albumArt: 'lib/assets/audio/Maan_Meri_Jaan.mp3',
        url: 'lib/assets/audio/Maan_Meri_Jaan.mp3',
      ),
      // Song(
      //   id: 2,
      //   title: 'Song 2',
      //   artist: 'Artist 2',
      //   albumArt: 'assets/album2.jpg',
      //   url: 'url/to/song2.mp3',
      // ),
      // Add more songs here
    ]);
  }

  Future<void> loadLikedSongs() async {
    likedSongs.addAll(await DatabaseHelper.instance.getLikedSongs());
  }

  void playSong(Song song) {
    currentSong.value = song;
    isPlaying.value = true;
  }

  void pauseSong() {
    isPlaying.value = false;
  }

  void resumeSong() {
    isPlaying.value = true;
  }

  void seekSong(double position) {
    currentPosition.value = position;
  }

  Future<void> likeSong(Song song) async {
    await DatabaseHelper.instance.insertLikedSong(song);
    likedSongs.add(song);
  }

  Future<void> unlikeSong(Song song) async {
    await DatabaseHelper.instance.deleteLikedSong(song.id);
    likedSongs.removeWhere((s) => s.id == song.id);
  }

  bool isLiked(Song song) {
    return likedSongs.any((s) => s.id == song.id);
  }
}
