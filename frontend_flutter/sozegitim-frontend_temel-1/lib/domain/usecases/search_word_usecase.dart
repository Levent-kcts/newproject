import 'package:my_app/domain/entities/word.dart';
import 'package:my_app/domain/repositories/word_repository.dart';

class SearchWordUseCase {
  final WordRepository repository;

  SearchWordUseCase({required this.repository});

  Future<Word> execute(String term) {
    return repository.searchWord(term);
  }
}
