import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music_app/view/screen/Liked_song_page/liked_songpage.dart';
import 'package:my_music_app/view/screen/Music_SearchPage/music_searchpage.dart';
import 'package:my_music_app/view/screen/Music_player/music_playerpage.dart';
import 'package:my_music_app/view/screen/Singer_Categorypage/singer_categorypage.dart';
import 'package:my_music_app/view/screen/Splash_screen/splash_screen.dart';
import 'package:my_music_app/view/screen/home_page/Siginup_Page/siginup_page.dart';
import 'package:my_music_app/view/screen/home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/sign-in', page: () => MusicSignUpPage()),
        GetPage(name: '/singer-category', page: () => CategoryPage()),
        GetPage(name: '/home-page', page: () => HomePage()),
        GetPage(name: '/liked-songs', page: () => LikedSongsPage()),
        GetPage(name: '/music-player', page: () => MusicPlayerPage()),
        GetPage(name: '/music-search', page: () => SearchPage()),
        GetPage(name: '/music-player', page: () => MusicPlayerPage()),
      ],
    );
  }
}
