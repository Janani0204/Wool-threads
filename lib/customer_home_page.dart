// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, duplicate_ignore
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wool_threads/login_choice_page.dart';
import 'package:wool_threads/wool_quality_page.dart';
import 'tracking_page.dart';
import 'customer_cart_page.dart';
 // Import the ChatBot page
// Import the Cart Page

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  _CustomerHomePage createState() => _CustomerHomePage();
}

class _CustomerHomePage extends State<CustomerHomePage> {
  final List<Map<String, dynamic>> products = [
    {'asset': 'assets/card/sweater.jpeg','name': 'Sweater', 'description': 'Cozy wool sweater', 'price': 500},
    {'asset': 'assets/card/coat.jpeg','name': 'Jacket', 'description': 'Warm wool jacket', 'price': 700},
    {'asset': 'assets/card/blanket.jpg','name': 'Blanket', 'description': 'Soft wool blanket', 'price': 300},
    {'asset': 'assets/card/gloves.jpeg','name': 'Gloves', 'description': 'Comfortable wool gloves', 'price': 200},
    {'asset': 'assets/card/baskets.jpeg','name': 'Bag', 'description': 'Stylish wool bag', 'price': 400},
    {'asset': 'assets/card/bedsheet.jpeg','name': 'Quilt', 'description': 'Handmade wool quilt', 'price': 600},
    {'asset': 'assets/card/bluesweatshirt.jpeg','name': 'Sweater', 'description': 'Modern wool sweater', 'price': 550},
    {'asset': 'assets/card/dress.jpeg','name': 'Jacket', 'description': 'Elegant wool jacket', 'price': 750},
    {'asset': 'assets/card/blanket2.jpeg','name': 'Blanket', 'description': 'Luxurious wool blanket', 'price': 35},
    {'asset': 'assets/card/gloves2.jpeg','name': 'Gloves', 'description': 'Durable wool gloves', 'price': 25},
  ];
  final user = FirebaseAuth.instance.currentUser;
  String name = FirebaseAuth.instance.currentUser?.displayName ?? 'User';

  @override
  void initState() {
    super.initState();
    name = user?.displayName ?? 'User';
  }

  final List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      final index = cartItems.indexWhere((item) => item['name'] == product['name']);
      if (index != -1) {
        cartItems[index]['quantity'] += 1; // Increment quantity if the product is already in the cart
      } else {
        cartItems.add({...product, 'quantity': 1}); // Add product to cart with quantity
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        centerTitle: false,
        title: Text(
          'Wool Threads',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 161, 129, 89),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cartItems.length}',
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFF7E7CE),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 161, 129, 89),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color.fromARGB(255, 161, 129, 89)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome, $name', // Changed from Farmer Name
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Color.fromARGB(255, 161, 129, 89)),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginChoicePage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFFF7E7CE),
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Arrivals',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 330, // Adjusted height to accommodate larger images
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length < 6 ? products.length : 6, // Display only 6 items
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 5.0), // Reduced spacing between cards
                          child: SizedBox(
                            width: 250,
                            child: Card(
                              color: Color.fromARGB(255, 253, 228, 188),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        product['asset'],
                                        height: 200, // Increased height
                                        width: 200, // Increased width
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          product['name'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                      product['description'],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                      ],
                                    ),
                                    
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '₹${product['price']}.00',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 161, 129, 89),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Icon(Icons.star, color: Color.fromARGB(255, 161, 129, 89), size: 18,),
                                            Text('4.7',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 161, 129, 89),
                                          ),),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            addToCart(product);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(255, 161, 129, 89),
                                          ),
                                          child: Text(
                                            'Add',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'More Products',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 350, // Adjusted height to accommodate larger images
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length > 6 ? products.length - 6 : 0, // Display remaining items
                      itemBuilder: (context, index) {
                        final product = products[index + 6];
                        return Padding(
                          padding: const EdgeInsets.only(right: 5.0), // Reduced spacing between cards
                          child: SizedBox(
                            width: 250,
                            child: Card(
                              color: Color.fromARGB(255, 253, 228, 188),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        product['asset'],
                                        height: 200, // Increased height
                                        width: 200, // Increased width
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      product['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      product['description'],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '₹${product['price']}.00',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 161, 129, 89),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            addToCart(product);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(255, 161, 129, 89),
                                          ),
                                          child: Text(
                                            'Add',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 161, 129, 89),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WoolQualityPage()),
                );
              },
              child: Icon(Icons.chat, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Color.fromARGB(255, 161, 129, 89),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, size: 40.0, color: Color(0xFFF7E7CE)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.track_changes_outlined, size: 40.0, color: Color(0xFFF7E7CE)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage(appBarColor: Color.fromARGB(255, 161, 129, 89), // customer color
        userType: "customer",)));
            },
          ),
        ],
      ),
    );
  }
}

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Center(
        child: Text('Chatbot Interface Coming Soon!'),
      ),
    );
  }
}