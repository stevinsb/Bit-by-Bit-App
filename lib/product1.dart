import 'package:aquaclense/mainhome.dart';
import 'package:flutter/material.dart';

class Product1 extends StatelessWidget {
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
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: Colors.blue[800],
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AquaClense 1.0 - The Beginning",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "A revolutionary solution for effective and affordable waste management in water bodies and canals",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Revolutionizing Waste Management",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "AquaClense 1.0 marks the dawn of a revolutionary era in waste management, targeting the heart of the problem—canals and water bodies. These neglected arteries of our planet are where waste accumulates most aggressively, choking ecosystems and threatening communities. Our solution is engineered to tackle this crisis head-on, focusing on efficiency, innovation, and affordability.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 32),

                 
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "A Game-Changer for Canals and Water Bodies",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "AquaClense 1.0 is not just a product—it’s a vision brought to life. Designed specifically for canals and water bodies, it addresses the rampant waste buildup that traditional methods fail to manage. At its core is a powerful suction pump that effortlessly extracts waste—plastic, shoes, metal, and more—depositing it into a sturdy holding bin. From there, our cost-effective removal system kicks in: a simple shovel clears the bin, ensuring operational simplicity without breaking the bank. For height adjustments, a manual pulley system offers precision and control, adaptable to any canal depth.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Evolving to AquaClense 1.1",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Looking ahead, AquaClense 1.1 takes innovation further. For regions where manual pulleys prove labor-intensive, we introduce a conveyor belt system paired with a motorized, sensor-controlled automatic pulley. This upgrade minimizes human effort, maximizes efficiency, and ensures waste removal is seamless, even in the most challenging environments. Imagine a system so intuitive it anticipates waste levels and adjusts itself—that’s the future we’re building.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  
                  Center(
                    child: Image.asset(
                      'assets/logo/abcd2.jpg',
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

                  
                  const Text(
                    "Global Impact, Local Solutions",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "In countries like Malaysia, where canals and rivers such as the Klang River and Malacca River drown under heaps of waste, AquaClense shines as a beacon of hope. With electricity costs in these regions being remarkably low, our solution leverages this advantage to deliver unmatched efficiency. The suction pump and motorized pulley operate at minimal expense, making AquaClense a financially viable choice for governments and businesses alike. This isn’t just a product—it’s a lifeline for communities suffocating under waste, transforming polluted waterways into thriving ecosystems once more.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 32),

                  
                  const Text(
                    "The AquaClense Advantage",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Investing in AquaClense 1.0 and its 1.1 evolution isn’t just a financial decision—it’s a stake in the future. By replacing backbreaking manual labor with a semi-automated system, we slash operational costs by up to 60% compared to traditional methods. The suction pump’s relentless efficiency clears waste faster than any human crew, while the bin-and-shovel approach—or the advanced conveyor belt—ensures scalability without complexity. In regions plagued by canal waste, AquaClense delivers results that speak louder than promises: cleaner water, healthier communities, and a profitable return on investment. This is your chance to back a product that doesn’t just solve a problem—it redefines the industry.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 32),

                  
                  Container(
                    padding: const EdgeInsets.all(24),
                    color: Colors.blue[50],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Request Your Personalized Quote",
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
                            hintText: "Type your message",
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
                            hintText: "stevin@gmail.com",
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
