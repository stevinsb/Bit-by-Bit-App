import 'package:flutter/material.dart';

class Sell extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<Sell> {
  final TextEditingController _quantityController = TextEditingController();
  bool _isSelling = false;

  void _sellWaste() {
    if (_quantityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a quantity!")),
      );
      return;
    }

    setState(() {
      _isSelling = true;
    });

    // Simulate a sell process (replace with actual API call if needed)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSelling = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Sell Successful!"),
          content: const Text("Your waste has been accepted, and payment will be processed shortly."),
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
          "AquaClense - Sell Waste",
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
                      Icons.recycling,
                      size: 60,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Sell Waste - Get Paid Instantly",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "We will collect the waste from your location and process your payment shortly.",
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
                        labelText: "Waste to Sell (kg):",
                        labelStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _isSelling
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                          )
                        : ElevatedButton(
                            onPressed: _sellWaste,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[400],
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              "Sell Now",
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                    const SizedBox(height: 16),
                    const Text(
                      "Eco-friendly collection and fair payment guaranteed!",
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
