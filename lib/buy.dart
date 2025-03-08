import 'package:flutter/material.dart';

class Buy extends StatefulWidget {
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<Buy> {
  final TextEditingController _quantityController = TextEditingController();
  bool _isPurchasing = false;

  void _purchaseWaste() {
    if (_quantityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a quantity!")),
      );
      return;
    }

    setState(() {
      _isPurchasing = true;
    });

    // Simulate a purchase process (replace with actual API call if needed)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isPurchasing = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Purchase Successful!"),
          content: const Text("Your waste will be shipped to your address shortly."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _quantityController.clear();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensures the layout adjusts for the keyboard
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "AquaClense - Buy Waste",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView( // Wraps the body content to enable scrolling
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[100]!, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.local_shipping,
                      size: 60,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Buy Waste - Get it Delivered to You",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "We will ship the selected quantity to your address shortly.",
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 117, 117, 117),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Waste Needed (kg):",
                        labelStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _isPurchasing
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          )
                        : ElevatedButton(
                            onPressed: _purchaseWaste,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal[400],
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              "Purchase Now",
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                    const SizedBox(height: 16),
                    const Text(
                      "Secure, fast, and eco-friendly delivery!",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 56, 142, 60),
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24), // Added extra padding at the bottom
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }
}

// Placeholder pages for navigation
class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reports")),
      body: const Center(child: Text("Reports Page")),
    );
  }
}

class RecyclingMeasuresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recycling Measures")),
      body: const Center(child: Text("Recycling Measures Page")),
    );
  }
}

// Note: Replace 'Mainhome' with the actual import path if it's in a different file
// import 'path_to_mainhome.dart';