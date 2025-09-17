import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DailyProfitsPage extends StatelessWidget {
  final List<double> dailyEarnings = [100, 120, 140, 130, 150, 100, 170];
  final List<double> dailyExpenses = [80, 90, 150, 140, 160, 110, 180];

  DailyProfitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> dailyProfits = List.generate(
      dailyEarnings.length,
      (index) => dailyEarnings[index] - dailyExpenses[index],
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 215, 254),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0077B6),
        title: const Text('Daily Profits & Loss'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Daily Earnings and Expenses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: dailyEarnings.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: CircleAvatar(
                        backgroundColor: dailyProfits[index] >= 0
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        child: Icon(
                          dailyProfits[index] >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Day ${index + 1}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Earnings: \$${dailyEarnings[index].toStringAsFixed(2)}\n'
                        'Expenses: \$${dailyExpenses[index].toStringAsFixed(2)}',
                      ),
                      trailing: Text(
                        dailyProfits[index] >= 0
                            ? 'Profit: \$${dailyProfits[index].toStringAsFixed(2)}'
                            : 'Loss: \$${dailyProfits[index].abs().toStringAsFixed(2)}',
                        style: TextStyle(
                          color: dailyProfits[index] >= 0 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Profit/Loss Trend',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0077B6),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8.0),
                child: LineChart(
                  LineChartData(
                    maxY: 100,
                    minY: -50,
                    lineBarsData: [
                      LineChartBarData(
                        spots: dailyProfits.asMap().entries.map(
                          (entry) {
                            return FlSpot(entry.key.toDouble(), entry.value);
                          },
                        ).toList(),
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 4,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 3,
                              color: dailyProfits[index] >= 0
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              strokeWidth: 1,
                              strokeColor: Colors.green,
                            );
                          },
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.green.withOpacity(0.1),
                        ),
                      ),
                    ],
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 22,
                          interval: 2, // Show every 2nd day
                          getTitlesWidget: (double value, _) {
                            final day = value.toInt() + 1;
                            return Text(
                              '$day',
                              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 20, // Show every $20 increment
                          reservedSize: 32,
                          getTitlesWidget: (value, _) {
                            return Text(
                              '\$${value.toInt()}',
                              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        right: BorderSide(color: Colors.grey[300]!, width: 1),
                        bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 20, // Simplified grid
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey[200]!,
                          strokeWidth: 1,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
