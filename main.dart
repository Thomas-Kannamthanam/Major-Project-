import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const ParkItApp());
}

class ParkItApp extends StatelessWidget {
  const ParkItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
  ];

  // This would be your user count, for demo purposes it's set to 150
  final int userCount = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ParkIt'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle menu option selection
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'new_user',
                child: Text('New User'),
              ),
              const PopupMenuItem<String>(
                value: 'active_users',
                child: Text('Active Users'),
              ),
              const PopupMenuItem<String>(
                value: 'alerts',
                child: Text('Alerts'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Handle home icon press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Full-Screen Background Slideshow using carousel_slider
          Positioned.fill(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 9 / 16, // Aspect ratio for portrait mode
                enlargeCenterPage: false,
                viewportFraction: 1.0,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: imgList.map((item) => Image.asset(
                item,
                fit: BoxFit.cover, // Ensures the image covers the entire screen
                width: double.infinity,
                height: double.infinity,
              )).toList(),
            ),
          ),
          // Centered User Count
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Total Users',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$userCount',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
