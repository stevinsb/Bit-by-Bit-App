import 'dart:async';
import 'package:aquaclense/home1.dart';
import 'package:aquaclense/mainhome.dart';
import 'package:flutter/material.dart';


class Home2 extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Home2>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _logoController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  String statusMessage = "Initializing...";
  int currentStep = 0;

  final List<Map<String, dynamic>> steps = [
    {"message": "Verifying government credentials", "icon": Icons.shield_outlined},
    {"message": "Activating canal cleanup system", "icon": Icons.water_drop_outlined},
  ];

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _navigateThroughSteps();
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

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red[900],
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Future<void> _navigateThroughSteps() async {
    for (int i = 0; i < steps.length; i++) {
      setState(() {
        currentStep = i;
        statusMessage = steps[i]["message"] ?? "Processing...";
      });
      await Future.delayed(const Duration(seconds: 2));
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Mainhome(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, 
        child: SafeArea(
          child: Stack(
            children: [
            
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _slideAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         
                            ScaleTransition(
                              scale: _scaleAnimation,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
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
                                    height: 140,
                                    width: 240,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 140,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          shape: BoxShape.circle,
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
                            const SizedBox(height: 32),
                            Text(
                              "Aqua Clense",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900], 
                                letterSpacing: 1.5,
                                shadows: [
                                  Shadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 48),
                            
                            Column(
                              children: List.generate(steps.length, (index) {
                                final isActive = index <= currentStep;
                                final isCompleted = index < currentStep;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeOut,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Colors.blue[50] 
                                          : Colors.grey[100],
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: isActive
                                            ? Colors.blue[300]!
                                            : Colors.grey[300]!,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        AnimatedSwitcher(
                                          duration: const Duration(milliseconds: 300),
                                          child: Container(
                                            key: ValueKey(isCompleted),
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: isCompleted
                                                  ? Colors.green[400]
                                                  : Colors.blue[200],
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              isCompleted
                                                  ? Icons.check
                                                  : steps[index]["icon"],
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text(
                                            steps[index]["message"] ?? "",
                                            style: TextStyle(
                                              color: Colors.blue[900], 
                                              fontSize: 16,
                                              fontWeight: isActive
                                                  ? FontWeight.w600
                                                  : FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 48),
                          
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    strokeWidth: 4,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue[900]!, 
                                    ),
                                  ),
                                  Icon(
                                    Icons.water_drop,
                                    color: Colors.blue[600],
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}