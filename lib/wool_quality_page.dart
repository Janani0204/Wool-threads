// lib/pages/wool_quality_page.dart
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/quality_analysis.dart';
import '../widgets/image_upload_widget.dart';
import '../widgets/quality_result_widget.dart';

class WoolQualityPage extends StatefulWidget {
  @override
  _WoolQualityPageState createState() => _WoolQualityPageState();
}

class _WoolQualityPageState extends State<WoolQualityPage> {
  File? _uploadedImage;
  bool _isAnalyzing = false;
  QualityAnalysis? _analysis;

  void _handleImageUpload(File file) {
    setState(() {
      _uploadedImage = file;
      _analysis = null;
      _isAnalyzing = true;
    });

    // Simulate analysis
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        final random = Random();
        setState(() {
          _analysis = QualityAnalysis(
            quality: random.nextBool() ? 'good' : 'poor',
            confidence: 85 + random.nextDouble() * 10,
            factors: QualityFactors(
              fiberConsistency: 70 + random.nextDouble() * 25,
              colorUniformity: 75 + random.nextDouble() * 20,
              textureQuality: 80 + random.nextDouble() * 15,
              overallCondition: 78 + random.nextDouble() * 18,
            ),
          );
          _isAnalyzing = false;
        });
      }
    });
  }

  void _handleRemoveImage() {
    setState(() {
      _uploadedImage = null;
      _analysis = null;
      _isAnalyzing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wool Threads'),
        backgroundColor: Color.fromARGB(255, 161, 129, 89),
        foregroundColor: Color.fromARGB(255, 253, 228, 188),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUploadSection(),
                  if (_analysis != null && !_isAnalyzing) ...[
                    SizedBox(height: 24),
                    _buildResultsSection(),
                  ],
                  if (_uploadedImage == null) ...[
                    SizedBox(height: 24),
                    _buildFeaturesSection(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 161, 129, 89), const Color.fromARGB(255, 103, 72, 41)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'AI-Powered Analysis',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Professional Fabric Quality Assessment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                _buildStatCard('99.2%', 'Accuracy'),
                _buildStatCard('3s', 'Analysis'),
                _buildStatCard('24/7', 'Available'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Fabric Sample',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Take a clear photo of your fabric for instant quality analysis',
          style: TextStyle(color: Colors.grey[600]),
        ),
        SizedBox(height: 16),
        ImageUploadWidget(
          onImageSelected: _handleImageUpload,
          uploadedImage: _uploadedImage,
          onRemoveImage: _handleRemoveImage,
          isAnalyzing: _isAnalyzing,
        ),
      ],
    );
  }

  Widget _buildResultsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quality Analysis Complete',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Here\'s your detailed fabric assessment',
          style: TextStyle(color: Colors.grey[600]),
        ),
        SizedBox(height: 16),
        QualityResultWidget(analysis: _analysis!),
      ],
    );
  }

  Widget _buildFeaturesSection() {
    return Column(
      children: [
        Text(
          'Why Choose WoolThreads?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Professional-grade analysis at your fingertips',
          style: TextStyle(color: Colors.grey[600]),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            _buildFeatureCard(
              Icons.flash_on,
              'Instant Analysis',
              'Get results in 3 seconds with AI-powered detection',
              Colors.brown,
            ),
            SizedBox(width: 8),
            _buildFeatureCard(
              Icons.arrow_downward_rounded,
              'Precise Results',
              '99.2% accuracy with detailed quality breakdown',
              Colors.brown,
            ),
          ],
        ),
        SizedBox(height: 8),
        _buildFeatureCard(
          Icons.shield,
          'Industry Standard',
          'Professional-grade assessment trusted by experts',
          Colors.brown,
          fullWidth: true,
        ),
      ],
    );
  }

  Widget _buildFeatureCard(
    IconData icon,
    String title,
    String description,
    Color color, {
    bool fullWidth = false,
  }) {
    Widget card = Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    return fullWidth ? card : Expanded(child: card);
  }
}
