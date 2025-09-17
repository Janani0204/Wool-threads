import 'package:flutter/material.dart';
import 'package:wool_threads/customer_login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerRegister extends StatefulWidget {
  const CustomerRegister({super.key});

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String? menuItem = 'e1'; // Default value for the dropdown

  Future<void> createUserEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      await userCredential.user!.updateDisplayName(nameController.text.trim());
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: const Color.fromARGB(255, 208, 184, 156),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background6.jpg'), // Customer-specific background
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF7E7CE).withOpacity(0.4), // Customer-specific color overlay
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.white.withOpacity(0.9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        // ignore: deprecated_member_use
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Address',
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'City',
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: menuItem,
                          dropdownColor: Colors.white.withOpacity(0.9),
                          items: const [
                            DropdownMenuItem(
                              value: 'e1',
                              child: Text('Tamil Nadu', style: TextStyle(color: Colors.black)),
                            ),
                            DropdownMenuItem(
                              value: 'e2',
                              child: Text('Kerala', style: TextStyle(color: Colors.black)),
                            ),
                            DropdownMenuItem(
                              value: 'e3',
                              child: Text('Karnataka', style: TextStyle(color: Colors.black)),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              menuItem = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'PIN Code',
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Country',
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        await createUserEmailAndPassword();
                        ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC19A6B),);
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const CustomerLoginPage();
                          },
                        ));
                      },
                      child: const Text('Submit', style: TextStyle(color: Color.fromARGB(255, 89, 52, 7), fontSize: 20.0,)),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
