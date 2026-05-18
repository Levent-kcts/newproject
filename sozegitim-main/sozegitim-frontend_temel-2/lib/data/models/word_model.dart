import '../../domain/entities/word.dart';

class WordModel extends Word {
  WordModel({
    required super.word,
    required super.translation,
    required super.level,
    super.phonetic,
    required super.meanings,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] ?? "",
      translation: json['translation'] ?? "",
      level: json['level'] ?? "A1",
      phonetic: json['phonetic'],
      meanings: json['meanings'] != null
          ? (json['meanings'] as List)
              .map((m) => MeaningModel.fromJson(m))
              .toList()
          : [],
    );
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
      // DÜZELTME: Python'dan gelen 'part_of_speech' ismini Flutter'daki 'partOfSpeech'e bağlıyoruz
      partOfSpeech: json['part_of_speech'] ?? "", 
      definition: json['definition'] ?? "",
      example: json['example'],
    );
  }
}