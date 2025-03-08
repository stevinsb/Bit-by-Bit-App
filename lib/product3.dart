import 'package:flutter/material.dart';

class Product3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "AquaClense",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: Colors.blue[800],
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "AquaClense 3.0 - More with Physics",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Redefining waste management in stagnant water bodies by harnessing the power of physics",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Physics: Solving Real-World Problems Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Physics: Solving Real-World Problems",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Physics isn’t just theory—it’s the backbone of practical solutions. From bridges to rockets, it shapes our world by solving complex challenges with elegant precision. AquaClense 3.0 is a shining example: by applying fluid dynamics and mathematical calculations, we transform stagnant water into a flowing system that captures waste effortlessly. In a world drowning in pollution, physics offers a lifeline—precise, predictable, and powerful—making seemingly impossible problems solvable.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Features of AquaClense 3.0 Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Features of AquaClense 3.0",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Placed at the center of a canal, AquaClense 3.0 is custom-built to match the canal’s dimensions, ensuring optimal flow production. Using a tapering design, it channels water to accelerate flow toward a collection bin. No motors, no complexity—just pure physics at work. The system’s dimensions are calculated to maximize velocity and refresh rate, ensuring waste is swept into the bin efficiently, ready for removal.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Case Study: Klang River Implementation Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Case Study: Klang River Implementation",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Consider the Klang River in Malaysia, a waterway choked with 55 tons of plastic waste daily. For a customer here, we tailored AquaClense 3.0 to its specifics. The flow rate, defined as A*V (area × velocity), was calculated precisely. Near the collection bin, the area is 2m × 15m = 30m². At the tapering position, velocity reaches approximately 50m³/s (or 800 cuft/s). The channeling section’s area is 20m × 10m × 0.6m = 32m². With a flow rate of 800 cuft/s, the refresh rate cycles at 0.08 Hz—enough to fill the product efficiently. This outflow rate far exceeds the inflow of 55 tons/day, proving AquaClense 3.0’s effectiveness in managing plastic and microplastic pollution, as studied in UITM-CMT 581 (Environmental Impact of Plastics at Juri and Klang).",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Image Section (Add your image here)
                  Center(
                    child: Image.asset(
                      'assets/logo/klang.jpg', // Replace with your actual image path
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 300,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Text("Image not found"),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Get Your Quote Now Section
                  Container(
                    padding: const EdgeInsets.all(24),
                    color: Colors.blue[50],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Get Your Quote Now",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green[700],
                            hintText: "message",
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "your.email@company.com",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[600],
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text("Request Pricing"),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Center(
                          child: Text(
                            "You’ll receive a comprehensive quote with pricing details, implementation timeline, and ROI analysis.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



