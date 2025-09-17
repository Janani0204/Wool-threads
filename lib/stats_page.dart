import 'package:flutter/material.dart';

class MarketStatsPage extends StatelessWidget {
  const MarketStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Market Stats',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0077B6),
      ),
      body: Container(
        color: const Color.fromARGB(255, 182, 215, 254), // Match background to home page
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shipments and Profits Section
                Text(
                  'Shipments and Profits',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                StatsCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShipmentDetail(
                        shipmentId: '#001',
                        destination: 'City A',
                        woolQuantity: '50 kg',
                        profit: '\$2500',
                      ),
                      ShipmentDetail(
                        shipmentId: '#002',
                        destination: 'City B',
                        woolQuantity: '30 kg',
                        profit: '\$1500',
                      ),
                      ShipmentDetail(
                        shipmentId: '#003',
                        destination: 'City C',
                        woolQuantity: '20 kg',
                        profit: '\$1000',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Warehouse Details Section
                Text(
                  'Warehouses Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                StatsCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WarehouseDetail(
                        name: 'Warehouse A',
                        location: 'City A',
                        storedWool: '100 kg',
                      ),
                      WarehouseDetail(
                        name: 'Warehouse B',
                        location: 'City B',
                        storedWool: '150 kg',
                      ),
                      WarehouseDetail(
                        name: 'Warehouse C',
                        location: 'City C',
                        storedWool: '200 kg',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Market Price Section
                Text(
                  'Market Price of Wool',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                StatsCard(
                  child: Center(
                    child: Text(
                      '\$50 per kg',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0077B6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final Widget child;

  const StatsCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
    );
  }
}

class ShipmentDetail extends StatelessWidget {
  final String shipmentId;
  final String destination;
  final String woolQuantity;
  final String profit;

  const ShipmentDetail({super.key, 
    required this.shipmentId,
    required this.destination,
    required this.woolQuantity,
    required this.profit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipment ID: $shipmentId',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Destination: $destination'),
        Text('Wool Quantity: $woolQuantity'),
        Text(
          'Profit: $profit',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const Divider(color: Colors.black26),
      ],
    );
  }
}

class WarehouseDetail extends StatelessWidget {
  final String name;
  final String location;
  final String storedWool;

  const WarehouseDetail({super.key, 
    required this.name,
    required this.location,
    required this.storedWool,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Location: $location'),
        Text('Stored Wool: $storedWool'),
        const Divider(color: Colors.black26),
      ],
    );
  }
}
