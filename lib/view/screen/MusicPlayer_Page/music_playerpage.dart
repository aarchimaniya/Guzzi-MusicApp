import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/audio_controller.dart';

class MusicPlayPage extends StatelessWidget {
  final Map<String, String>
      song; // Replace 'dynamic' with your song model type if available
  final AudioController _audioController = Get.put(AudioController());

  MusicPlayPage({required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202024),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              song['image']!,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.7),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          // Back Icon
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded,
                  color: Colors.white, size: 28),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          // Song Details and Controls
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Section: Song Title and Artist
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Text(
                      song['title']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      song['artist']!,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Middle Section: Music Image
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(song['image']!),
                ),
              ),
              // Bottom Section: Controls and Lyrics
              Column(
                children: [
                  // Music Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.skip_previous,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          // Implement skip previous functionality
                        },
                      ),
                      Obx(() => IconButton(
                            icon: Icon(
                              _audioController.isPlaying.value
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () {
                              _audioController.playPause();
                            },
                          )),
                      IconButton(
                        icon: Icon(Icons.skip_next,
                            color: Colors.white, size: 40),
                        onPressed: () {
                          // Implement skip next functionality
                        },
                      ),
                    ],
                  ),
                  // Lyrics Section
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        _audioController.currentLyrics.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
