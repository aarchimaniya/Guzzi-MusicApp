import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_music_app/view/screen/home_page/home_page.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories = [
    'Hip Hop',
    'Romantic',
    'Rock Music',
    'Soul Music',
    'Folk Music',
    'Acoustic Blues',
    'Blues Music',
    'Classical',
    'Travelling',
    'Hollywood',
  ];

  // Paths for the category images in the same order as the categories list
  final List<String> categoryImages = [
    'lib/assets/images/hiphop.png',
    'lib/assets/images/romantic.png',
    'lib/assets/images/rock.png',
    'lib/assets/images/soul.png',
    'lib/assets/images/folk.png',
    'lib/assets/images/acoustic_blues.png',
    'lib/assets/images/blue_music.png',
    'lib/assets/images/classical.png',
    'lib/assets/images/travelling.png',
    'lib/assets/images/oursoul.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202024),
      appBar: AppBar(
        backgroundColor: Color(0xFF202024),
        title: Center(
          child: Text(
            'Category',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => HomePage());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio:
                0.9, // Adjusts the aspect ratio for better circular shape
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle category tap
              },
              child: Column(
                children: [
                  Container(
                    height: 150, // Adjusted size for circles
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color(0xFF29372d),
                          width: 5), // Defined border size
                      image: DecorationImage(
                        image: AssetImage(categoryImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8), // Space between image and text
                  Text(
                    categories[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
