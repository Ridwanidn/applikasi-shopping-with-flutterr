import 'package:flutter/material.dart';
import 'package:skl_ui_app_1/homepage.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Pure black background
      body: Container(
        height: MediaQuery.of(context).size.height, // Full-screen height
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with "Sign Up" text
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25, // 25% of screen height
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.9), // White theme for header
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70), // Bottom-left corner curved outward
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Black text in header
                    ),
                  ),
                ),
              ),

              // Sign Up Form
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30),
                    
                    // Name Input
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.black), // White label text
                        hintText: 'Your full name',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 187, 187, 187)), // Semi-transparent white hint
                        filled: true,
                        fillColor: Color.fromARGB(255, 230, 230, 230), // Black input field background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.black.withOpacity(0.9)), // White input text
                    ),
                    SizedBox(height: 20),

                    // Email Input
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black), // White label text
                        hintText: 'youremail@gmail.com',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 187, 187, 187)), // Semi-transparent white hint
                        filled: true,
                        fillColor: Color.fromARGB(255, 230, 230, 230), // Black input field background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // White input text
                    ),
                    SizedBox(height: 20),

                    // Password Input
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black), // White label text
                        hintText: '••••••••',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 187, 187, 187)), // Semi-transparent white hint
                        filled: true,
                        fillColor: Color.fromARGB(255, 230, 230, 230), // Black input field background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // White input text
                    ),
                    SizedBox(height: 20),

                    // Confirm Password Input
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.black), // White label text
                        hintText: '••••••••',
                        hintStyle: TextStyle(color: Color.fromARGB(255, 187, 187, 187)), // Semi-transparent white hint
                        filled: true,
                        fillColor: Color.fromARGB(255, 230, 230, 230), // Black input field background
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // White input text
                    ),
                    SizedBox(height: 60),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage(),));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.black.withOpacity(0.9), // White button background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16, color: Colors.white), // Black button text
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUp(),
  ));
}
