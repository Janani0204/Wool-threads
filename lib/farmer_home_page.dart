import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wool_threads/login_choice_page.dart';
import 'package:wool_threads/stats_page.dart';
import 'tracking_page.dart';
import 'profits_page.dart';
import 'notifications_page.dart';

class FarmerHomePage extends StatelessWidget {
  const FarmerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wool Threads',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0077B6),
        centerTitle: false,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 182, 215, 254),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0077B6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xFF0077B6)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Farmer Name', // Changed from Farmer Name
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
              leading: Icon(Icons.logout, color: Color(0xFF0077B6)),
              title: Text('Logout', style: TextStyle(color: Color(0xFF0077B6), fontWeight: FontWeight.bold),),
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
          // Main Content
          Container(
            color: const Color.fromARGB(255, 182, 215, 254), // Full background color
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10), // Padding for content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Graph Section
                          const Text(
                            'Daily Profits',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 300, // Adjust height of the graph
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 40,
                                      interval: 50,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          value.toInt().toString(),
                                          style: const TextStyle(
                                            color: Color(0xFF0077B6),
                                            fontSize: 12,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          'Day ${value.toInt()}',
                                          style: const TextStyle(
                                            color: Color(0xFF0077B6),
                                            fontSize: 12,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: true),
                                lineBarsData: [
                                  LineChartBarData(
                                    isCurved: true,
                                    spots: [
                                      const FlSpot(0, 100),
                                      const FlSpot(1, 120),
                                      const FlSpot(2, 140),
                                      const FlSpot(3, 80),
                                      const FlSpot(4, 200),
                                      const FlSpot(5, 180),
                                      const FlSpot(6, 250),
                                    ],
                                    color: const Color(0xFF0077B6),
                                    barWidth: 4,
                                    isStrokeCapRound: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Profit Summary Section
                          const Text(
                            'Today\'s Profit',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Wool Sold:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '50 kg',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price per kg:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\$50',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Divider(color: Colors.black26),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Profit:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0077B6),
                                      ),
                                    ),
                                    Text(
                                      '\$2500',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0077B6),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Tracking Status Section
                          const Text(
                            'Warehouse Status',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: const Column(
                              children: [
                                ShipmentCard(
                                  id: '#001',
                                  destination: 'City A',
                                  status: 'In Transit',
                                  eta: '2 Days',
                                ),
                                ShipmentCard(
                                  id: '#002',
                                  destination: 'City B',
                                  status: 'Delivered',
                                  eta: 'Completed',
                                ),
                                ShipmentCard(
                                  id: '#003',
                                  destination: 'City C',
                                  status: 'Pending Pickup',
                                  eta: '5 Days',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Wool Standards Section
                          const Text(
                            'Wool Standards',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1. Micron Count: 20-22 microns.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '2. Staple Length: 3-4 inches.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '3. Clean Wool Yield: Above 70%.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '4. Fiber Strength: High tensile strength.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Chatbot Button
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF0077B6),
        child: SizedBox(
          height: 70, // Adjust the height of the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/traveling.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TrackingPage(
                      appBarColor: Color.fromARGB(255, 94, 123, 83), // farmer color
        userType: "farmer",
                    )),
                  ); // Navigate to the tracking page
                },
              ),
              IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/money-3.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 50,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyProfitsPage()),
                  );
                },
              ),
              IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/diagram.png"),
                  color: Color.fromARGB(255, 182, 215, 254),
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MarketStatsPage()),
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

class ShipmentCard extends StatelessWidget {
  final String id;
  final String destination;
  final String status;
  final String eta;

  const ShipmentCard({super.key, 
    required this.id,
    required this.destination,
    required this.status,
    required this.eta,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          'Shipment ID: $id',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Destination: $destination'),
            Text('Status: $status'),
            Text('ETA: $eta'),
          ],
        ),
        trailing: Icon(
          status == 'Delivered' ? Icons.check_circle : Icons.local_shipping,
          color: status == 'Delivered' ? Colors.green : Colors.blue,
        ),
      ),
    );
  }
}


