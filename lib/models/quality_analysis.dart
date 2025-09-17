// lib/models/quality_analysis.dart
class QualityAnalysis {
  final String quality; // 'good' or 'poor'
  final double confidence;
  final QualityFactors factors;

  QualityAnalysis({
    required this.quality,
    required this.confidence,
    required this.factors,
  });

  bool get isGoodQuality => quality == 'good';
}

class QualityFactors {
  final double fiberConsistency;
  final double colorUniformity;
  final double textureQuality;
  final double overallCondition;

  QualityFactors({
    required this.fiberConsistency,
    required this.colorUniformity,
    required this.textureQuality,
    required this.overallCondition,
  });

  List<QualityFactor> get asList => [
    QualityFactor('Fiber Consistency', fiberConsistency),
    QualityFactor('Color Uniformity', colorUniformity),
    QualityFactor('Texture Quality', textureQuality),
    QualityFactor('Overall Condition', overallCondition),
  ];
}

class QualityFactor {
  final String name;
  final double value;

  QualityFactor(this.name, this.value);
}
