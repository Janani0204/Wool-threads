// customer_login_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wool_threads/customer_home_page.dart';
import 'package:wool_threads/customer_registration_page.dart';
// Import the Customer home page if different

class CustomerLoginPage extends StatefulWidget {
  const CustomerLoginPage({super.key});

  @override
  _CustomerLoginPageState createState() => _CustomerLoginPageState();
}

// Removed the standalone createUserWithEmailAndPassword function as it references undefined variables.
// You can implement user registration inside the _CustomerLoginPageState class if needed.

class _CustomerLoginPageState extends State<CustomerLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUserEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background6.jpg'), // Customer-specific background
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF7E7CE)
                .withOpacity(0.4), // Customer-specific color overlay
          ),
          Positioned(
            top: 65, // Adjust the position to fit your layout
            left: 30,
            child: GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const CircleAvatar(
                backgroundColor: Color(0xFFC19A6B),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/yarn-ball-2.png',
                      color: const Color(
                          0xFFC19A6B), // Change this to any color you want
                      colorBlendMode: BlendMode.srcIn, // Farmer-specific logo
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Customer Email',
                        fillColor: Colors.white.withOpacity(0.8),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        fillColor: Colors.white.withOpacity(0.8),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFFC19A6B), // Customer-specific button color
                      ),
                      onPressed: () async {
                        await loginUserEmailAndPassword();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CustomerHomePage()), // Customer-specific home page
                        );
                      },
                      child: const Text(
                        'Login as Customer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                      style: ElevatedButton.styleFrom(
                          //backgroundColor: Color(0xFFC19A6B),
                          ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const CustomerRegister();
                          },
                        ));
                      },
                      child: const Text(
                        'New User, Register!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 89, 52, 7),
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
