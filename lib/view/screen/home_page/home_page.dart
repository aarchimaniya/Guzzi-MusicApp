import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:my_music_app/view/screen/Music_SearchPage/music_searchpage.dart'; // For navigation and state management

import '../MusicPlayer_Page/music_playerpage.dart';
import '../Music_player/music_playerpage.dart'; // Import MusicPlayPage

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> sliderImages = [
    'https://i1.sndcdn.com/artworks-000194838470-s8c5uk-t500x500.jpg',
    'https://c.saavncdn.com/136/Assi-Sajna-Hindi-2024-20240528214902-500x500.jpg',
    'https://i.ytimg.com/vi/t7wSjy9Lv-o/maxresdefault.jpg',
  ];

  final List<Map<String, String>> popularArtists = [
    {
      'name': 'Justin Bieber',
      'image':
          'https://i.pinimg.com/564x/f7/e1/fc/f7e1fc6d73d9544bfc8f5dfaca67a309.jpg',
    },
    {
      'name': 'Taylor Swift',
      'image':
          'https://i.pinimg.com/564x/4f/53/1e/4f531e49e7b13c576ab4e30b8e4ba702.jpg',
    },
    {
      'name': 'Enrique Iglesias',
      'image':
          'https://i.pinimg.com/736x/27/ea/9e/27ea9e35cad3ebe78937f48ff637e2dc.jpg',
    },
    {
      'name': 'Arijit Singh',
      'image':
          'https://i.pinimg.com/564x/0a/2d/b8/0a2db8a1bf3a0e8681f406546cb12517.jpg',
    },
    {
      'name': 'Darshan Raval',
      'image':
          'https://i.pinimg.com/564x/9c/14/52/9c145215ffcf7825629a592978693017.jpg',
    },
    {
      'name': 'Lata Mangeshkar',
      'image':
          'https://i.pinimg.com/564x/fe/aa/9d/feaa9dca532126433b4939aecaa596a1.jpg',
    },
  ];

  final List<Map<String, String>> recentlyPlayed = [
    {
      'title': 'A Sky Full Of Stars',
      'artist': 'Coldplay',
      'image':
          'https://i.scdn.co/image/ab67616d0000b273e5a95573f1b91234630fd2cf'
    },
    {
      'title': 'Main Nikla Gaddi Leke',
      'artist': 'Udit Narayan',
      'image':
          'https://c.saavncdn.com/386/Main-Nikla-Gaddi-Leke-Road-Trip-Hits-Hindi-2023-20240415184825-500x500.jpg'
    },
    {
      'title': 'Ranchhod Rangila',
      'artist': 'Rajesh Ahir',
      'image': 'https://i.ytimg.com/vi/-6oAZwTGD2c/maxresdefault.jpg'
    },
    {
      'title': 'Love Me Like U Do',
      'artist': 'Ellie Goulding',
      'image':
          'https://i.scdn.co/image/ab67616d00001e02e9cbe14ad3ce1507e449adb6'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF202024),
      appBar: AppBar(
        backgroundColor: Color(0xFF202024),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: TextStyle(color: Colors.white70, fontSize: 17),
            ),
            Text(
              'Aarchi Maniya',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/128701780?v=4'), // Profile image URL
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              onTap: () {
                Get.to(() => SearchPage()); // Navigates to the SearchPage
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.headphones,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text('New Release',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            CarouselSlider(
              items: sliderImages.map((imageUrl) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Artist',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text('View All', style: TextStyle(color: Colors.greenAccent)),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: popularArtists.map((artist) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(artist['image']!),
                        ),
                        SizedBox(height: 5),
                        Text(artist['name']!,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text('Recently Played',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: recentlyPlayed.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(recentlyPlayed[index]['image']!,
                        width: 50, fit: BoxFit.cover),
                    title: Text(recentlyPlayed[index]['title']!,
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(recentlyPlayed[index]['artist']!,
                        style: TextStyle(color: Colors.white54)),
                    onTap: () {
                      // Navigate to the MusicPlayPage with the song details
                      Get.to(() => MusicPlayPage(song: recentlyPlayed[index]));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF202024),
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white54,
        currentIndex: 0, // Set the initial index for the selected tab
        onTap: (index) {
          if (index == 1) {
            // Navigate to MusicPlayPage with sample data
            Get.to(() => MusicPlayPage(song: recentlyPlayed[0]));
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              label: 'Music'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music,
                color: Colors.white,
              ),
              label: 'Library'),
        ],
      ),
    );
  }
}
