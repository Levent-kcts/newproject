import 'package:my_app/core/network/api_client.dart';
import 'package:my_app/data/models/word_model.dart';

class WordRemoteDataSource {
  final ApiClient apiClient;

  WordRemoteDataSource({required this.apiClient});

  Future<WordModel> getWordDefinition(String word) async {
    try {
      // Backend'deki endpoint: /api/words/search/{word}
      final response = await apiClient.dio.get('words/search/$word');

      // Bizim backend doğrudan objeyi dönüyor, liste değil
      return WordModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Kelime bulunamadı veya sunucu hatası: $e');
    }
  }
}
