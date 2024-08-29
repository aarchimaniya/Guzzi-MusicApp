import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_music_app/view/screen/Singer_Categorypage/singer_categorypage.dart';

class MusicSignUpPage extends StatefulWidget {
  @override
  State<MusicSignUpPage> createState() => _MusicSignUpPageState();
}

class _MusicSignUpPageState extends State<MusicSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF222222),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top Circular Images
          const SizedBox(
            height: 300, // Adjust height to match design
            child: Stack(
              clipBehavior: Clip.none, // Allows overflow of images
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/assets/images/img_1.png'),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 20,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/assets/images/img_2.png'),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                        'https://www.shutterstock.com/image-photo/cheerful-exultant-happy-young-bearded-600nw-2131611301.jpg'),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 40,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-photo/passionate-singer-looking-camera-singing-microphone-playing-karaoke-blue-background-copy-space_1258-40712.jpg'),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  right: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-photo/woman-smiling-singing-with-microphone-isolated-pink-background_1026556-51686.jpg'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 150), // Adjust the spacing
          // Discover Your Favorite Music Text
          Text(
            'Discover Your Favorite Music',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Description Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          // Sign Up Button
          ElevatedButton(
            onPressed: () {
              Get.to(() => CategoryPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Or Text
          Text(
            'OR',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green),
                  ),
                  child: IconButton(
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green),
                  ),
                  child: IconButton(
                    icon:
                        FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green),
                  ),
                  child: IconButton(
                    icon: FaIcon(FontAwesomeIcons.apple, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Sign in Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Do you have an account?",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle sign in action
                },
                child: Text(
                  "Sign in",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MusicSignUpPage(),
    debugShowCheckedModeBanner: false,
  ));
}
