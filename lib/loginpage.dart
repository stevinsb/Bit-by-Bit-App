import 'package:flutter/material.dart';
import 'package:aquaclense/createaccount.dart'; // Ensure this matches your file name

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _MagLoginState();
}

void showCustomSnackbar(BuildContext context, String message, bool isSuccess) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          isSuccess ? Icons.check_circle : Icons.error,
          color: isSuccess ? Colors.green : Colors.red,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            message,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.black87,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

class _MagLoginState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Validate email and password
    if (email.isEmpty || password.isEmpty) {
      showCustomSnackbar(
          context, "Email and password cannot be empty. Please try again.", false);
      return;
    }

    // Validate email format
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      showCustomSnackbar(context, "Please enter a valid email address.", false);
      return;
    }

    // Validate password length
    if (password.length < 6) {
      showCustomSnackbar(
          context, "Password must be at least 6 characters long.", false);
      return;
    }

    // Proceed with login (uncomment and adjust as needed)
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const Mainhome()),
    // );
    showCustomSnackbar(context, "Login successful!", true); // Placeholder
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center( // Center the entire content vertically
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              Text(
                'Login to continue.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Its Time to jump into reality -\nStay informed.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  hintText: 'e.g., stevin@example.com',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.black),
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  hintText: 'Password (minimum 6 characters)',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _login, // Call login function
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center( // Center the "Create an Account" text horizontally
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}