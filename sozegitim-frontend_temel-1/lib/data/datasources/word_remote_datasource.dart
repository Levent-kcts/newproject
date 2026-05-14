import 'package:my_app/core/network/api_client.dart';
import 'package:my_app/data/models/word_model.dart';

class WordRemoteDataSource {
  final ApiClient apiClient;

  WordRemoteDataSource({required this.apiClient});

  Future<WordModel> fetchWord(String term) async {
    final json = await apiClient.get('/dictionary/$term');
    return WordModel.fromJson(json);
  }
}
