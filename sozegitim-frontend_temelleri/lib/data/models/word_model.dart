import 'package:my_app/domain/entities/word.dart';

class WordModel extends Word {
  WordModel({
    required super.term,
    required super.definition,
    required super.examples,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      term: json['term'] as String? ?? '',
      definition: json['definition'] as String? ?? '',
      examples: (json['examples'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'term': term,
      'definition': definition,
      'examples': examples,
    };
  }
}
