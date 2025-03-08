import 'package:aquaclense/analysis.dart';
import 'package:aquaclense/buy.dart';
import 'package:aquaclense/product1.dart';
import 'package:aquaclense/product2.dart';
import 'package:aquaclense/product3.dart';
import 'package:aquaclense/product4.dart';
import 'package:aquaclense/sell.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Mainhome extends StatefulWidget {
  @override
  _MainhomeState createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _logoController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _setupVideoPlayer();
  }

  void _setupAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _controller.forward();
    _logoController.forward();
  }

  void _setupVideoPlayer() {
    _videoController = VideoPlayerController.asset('assets/logo/aquaclense.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
        _videoController.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _logoController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          "Aquaclense",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[800],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo/logo1.png',
                    height: 80,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.water_drop,
                        size: 50,
                        color: Colors.white,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Aquaclense",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.home,
              title: "Home Page",
              onTap: () {
                Navigator.pop(context); // Stay on Mainhome
              },
            ),
            _buildDrawerItem(
              icon: Icons.analytics,
              title: "Analysis",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Analysis()));
              },
            ),
            ListTile(
        leading: Icon(Icons.production_quantity_limits, color: Colors.blue[800]),
        title: const Text(
          "Product",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: PopupMenuButton<String>(
          icon: Icon(Icons.arrow_drop_down, color: Colors.blue[800]),
          onSelected: (String value) {
            Navigator.pop(context); // Close the drawer
            switch (value) {
              case 'Product 1':
                Navigator.push(context, MaterialPageRoute(builder: (context) => Product1()));
                break;
              case 'Product 2':
                Navigator.push(context, MaterialPageRoute(builder: (context) => Product2()));
                break;
              case 'Product 3':
                Navigator.push(context, MaterialPageRoute(builder: (context) => Product3()));
                break;
              case 'Product 4':
                Navigator.push(context, MaterialPageRoute(builder: (context) => Product4()));
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Product 1',
              child: Text('Product 1'),
            ),
            const PopupMenuItem<String>(
              value: 'Product 2',
              child: Text('Product 2'),
            ),
            const PopupMenuItem<String>(
              value: 'Product 3',
              child: Text('Product 3'),
            ),
            const PopupMenuItem<String>(
              value: 'Product 4',
              child: Text('Product 4'),
            ),
          ],
        ),
      ),
            _buildDrawerItem(
              icon: Icons.shopping_cart,
              title: "Buy",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Buy()));
              },
            ),
            _buildDrawerItem(
              icon: Icons.sell,
              title: "Sell",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Sell()));
              },
            ),
            _buildDrawerItem(
              icon: Icons.contact_mail,
              title: "Contact",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[800]!,
              Colors.blue[600]!.withOpacity(0.8),
              Colors.white,
            ],
            stops: [0.0, 0.3, 0.6],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _slideAnimation.value),
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logo
                          Center(
                            child: ScaleTransition(
                              scale: _scaleAnimation,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/logo/logo1.jpg',
                                  height: 120,
                                  width: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 120,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.water_drop,
                                        size: 70,
                                        color: Colors.blue[800],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Welcome Section
                          const Text(
                            "Welcome to Aquaclense",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Revolutionizing water purification with innovative solutions for a cleaner, sustainable future.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text("Learn More"),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Video Section
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: _videoController.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio: _videoController.value.aspectRatio,
                                      child: VideoPlayer(_videoController),
                                    )
                                  : Container(
                                      height: 200,
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 32),

                          // What’s Aquaclense Section
                          const Text(
                            "What’s Aquaclense",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Aquaclense is an innovative water purification solution designed to provide clean, safe drinking water for households and communities.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Advanced Filtration Section
                          _buildSectionCard(
                            icon: Icons.filter_alt,
                            title: "Advanced Filtration",
                            description:
                                "Using cutting-edge technology to remove impurities and contaminants, ensuring every drop is pure and refreshing.",
                          ),
                          const SizedBox(height: 16),

                          // Eco-Friendly Section
                          _buildSectionCard(
                            icon: Icons.eco,
                            title: "Eco-Friendly",
                            description:
                                "Sustainable solutions that protect our environment while providing clean water for generations to come.",
                          ),
                          const SizedBox(height: 16),

                          // Global Impact Section
                          _buildSectionCard(
                            icon: Icons.public,
                            title: "Global Impact",
                            description:
                                "Join our mission to make clean water accessible to communities around the world.",
                          ),
                          const SizedBox(height: 32),

                          // Vision and Mission Section
                          const Text(
                            "Our Vision and Mission",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildSectionCard(
                            icon: Icons.visibility,
                            title: "Vision",
                            description:
                                "To create a world where everyone has access to clean, sustainable water resources, fostering health and well-being for generations to come.",
                          ),
                          const SizedBox(height: 16),
                          _buildSectionCard(
                            icon: Icons.flag,
                            title: "Mission",
                            description:
                                "We are committed to developing cutting-edge water purification technologies, promoting environmental stewardship, and empowering communities through innovation.",
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue[800],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[800]),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}

// Placeholder pages for navigation (create these as needed)
class AnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analysis")),
      body: const Center(child: Text("Analysis Page")),
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product")),
      body: const Center(child: Text("Product Page")),
    );
  }
}

class BuyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buy")),
      body: const Center(child: Text("Buy Page")),
    );
  }
}

class SellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sell")),
      body: const Center(child: Text("Sell Page")),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact")),
      body: const Center(child: Text("Contact Page")),
    );
  }
}