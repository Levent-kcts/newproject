import 'package:my_app/domain/entities/word.dart';

class WordModel extends Word {
  WordModel({
    required super.word,
    required super.translation,
    super.phonetic,
    required super.meanings,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] as String? ?? '',
      translation: json['translation'] as String? ?? '',
      phonetic: json['phonetic'] as String?,
      meanings: (json['meanings'] as List<dynamic>?)
              ?.map((m) => MeaningModel.fromJson(m as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'translation': translation,
      'phonetic': phonetic,
      'meanings': meanings
          .map((m) => m is MeaningModel ? m.toJson() : {
                'part_of_speech': m.partOfSpeech,
                'definition': m.definition,
                'example': m.example,
              })
          .toList(),
    };
  }
}

class MeaningModel extends Meaning {
  MeaningModel({
    required super.partOfSpeech,
    required super.definition,
    super.example,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) {
    return MeaningModel(
      partOfSpeech: json['part_of_speech'] as String? ?? '',
      definition: json['definition'] as String? ?? '',
      example: json['example'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'part_of_speech': partOfSpeech,
      'definition': definition,
      'example': example,
    };
  }
}
