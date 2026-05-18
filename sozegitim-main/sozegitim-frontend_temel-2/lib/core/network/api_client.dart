import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  // Senin Python sunucunun adresi
  // Windows Chrome'da localhost yerine 127.0.0.1 kullanmak daha garantidir.
  final String baseUrl = 'http://127.0.0.1:8000';

  ApiClient();

  Future<Map<String, dynamic>> get(String path) async {
    try {
      // Tam adresi oluşturuyoruz: http://127.0.0.1:8000/dictionary/word
      final response = await http.get(Uri.parse('$baseUrl$path'));

      if (response.statusCode == 200) {
        // Python'dan gelen JSON verisini çözüp döndürüyoruz
        // UTF-8 kullanarak Türkçe karakterlerin bozulmasını engelliyoruz
        return json.decode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 404) {
        throw Exception('Kelime bulunamadı.');
      } else {
        throw Exception('Sunucu hatası: ${response.statusCode}');
      }
    } catch (e) {
      // Bir hata oluşursa (Sunucu kapalıysa vb.)
      throw Exception('Bağlantı hatası: $e');
    }
  }
}