import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Explore.dart';

void main() {
  runApp(const PodcastApp());
}

class PodcastApp extends StatelessWidget {
  const PodcastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Podkes',
      home: GettingStartedScreen(),
    );
  }
}

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: Stack(
        children: [
          Positioned(
            top: 98,
            left: 67,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                width: 240.0, // Genişlik
                height: 317.0, // Yükseklik
                decoration: const BoxDecoration(
                  color: Color(0xFFC4C4C4), // Arka plan rengi
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                    topRight: Radius.circular(100.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100.0),
                    topRight: Radius.circular(100.0),
                  ),
                  child: Image.asset(
                    'assets/images/img_good_faces_ahoh.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 457,
            left: 67,
            child: SizedBox(
              width: 240.0,
              child: Text(
                "Podkes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 510,
            left: 19,
            child: SizedBox(
              width: 332.0,
              child: Text(
                "A podcast is an episodic series of spoken word digital "
                    "audio files that a user can download to a personal "
                    "device for easy listening.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 175,
            child: SvgPicture.asset(
              'assets/images/Group 1089.svg',
              width: 53,
              height: 8,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 160,
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                maximumSize: const Size(70,70),
                  minimumSize: const Size(70,70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Explore()),
                );
              },
              child: const Icon(
                Icons.arrow_right_alt,
                size: 32,
                color: Color(0xFF525298),
              ),
            ),
          ),
        ],
      ),
    );
  }
}