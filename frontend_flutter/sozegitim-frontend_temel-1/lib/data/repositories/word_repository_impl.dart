import 'package:my_app/data/datasources/word_remote_datasource.dart';
import 'package:my_app/domain/entities/word.dart';
import 'package:my_app/domain/repositories/word_repository.dart';

class WordRepositoryImpl implements WordRepository {
  final WordRemoteDataSource remoteDataSource;

  WordRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Word> searchWord(String term) {
    return remoteDataSource.getWordDefinition(term);
  }
}
