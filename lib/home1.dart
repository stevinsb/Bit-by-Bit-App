import 'package:aquaclense/loginpage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(AquaClenseApp());
}

class AquaClenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue, 
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Home1(),
    );
  }
}

class Home1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          // First Page
          IntroPage(
            imagePath: 'assets/logo/abcd5.jpg', 
            title: 'Clean Canals, Healthy Future',
            description:
                'Aqua Clense tackles canal pollution with innovative waste collection.',
          ),

          // Second Page
          IntroPage(
            imagePath: 'assets/logo/abcd6.jpg', // Replace with system image
            title: 'Government-Driven Solution',
            description:
                'Powered by government funding and sustainable technology.',
          ),

          // Third Page
          IntroPage(
            imagePath: 'assets/logo/abcd7.jpg', 
            title: 'Sustainable Impact',
            description:
                'Restore ecosystems and communities with Aqua Clense.',
          ),
        ],
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const IntroPage({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Image.asset(
            imagePath,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                width: 300,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.water_drop,
                  size: 100,
                  color: Colors.blue,
                ),
              );
            },
          ),
          const SizedBox(height: 90),

          
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          
          if (title == 'Sustainable Impact')
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                 onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Loginpage()),
                  );
                 },
                child: const Text(
                  'Get Started Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}