// lib/widgets/quality_result_widget.dart
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../models/quality_analysis.dart';

class QualityResultWidget extends StatelessWidget {
  final QualityAnalysis analysis;

  const QualityResultWidget({
    Key? key,
    required this.analysis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 16),
            _buildQualityFactors(),
            SizedBox(height: 16),
            _buildSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(
          analysis.isGoodQuality ? Icons.check_circle : Icons.cancel,
          color: analysis.isGoodQuality ? Colors.green : Colors.red,
          size: 32,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quality Assessment Complete',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: analysis.isGoodQuality ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${analysis.isGoodQuality ? "Good" : "Poor"} Quality Wool',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${analysis.confidence.round()}% confidence',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQualityFactors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.bar_chart, color: Colors.grey[600], size: 20),
            SizedBox(width: 8),
            Text(
              'Quality Factors',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        ...analysis.factors.asList.map((factor) => _buildFactorRow(factor)),
      ],
    );
  }

  Widget _buildFactorRow(QualityFactor factor) {
    Color getColor() {
      if (factor.value >= 70) return Colors.green;
      if (factor.value >= 50) return Colors.orange;
      return Colors.red;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                factor.name,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '${factor.value.round()}%',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 4),
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            lineHeight: 8,
            percent: factor.value / 100,
            backgroundColor: Colors.grey[300],
            progressColor: getColor(),
            barRadius: Radius.circular(4),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        analysis.isGoodQuality
            ? 'This wool sample shows excellent quality indicators with consistent fiber structure and good overall condition.'
            : 'This wool sample shows quality concerns. Consider checking for damage, inconsistent processing, or contamination.',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 14,
          height: 1.4,
        ),
      ),
    );
  }
}
