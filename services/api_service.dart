import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/place.dart';

class ApiService {
  // Hàm để gọi API và lấy danh sách địa điểm
  static Future<List<Place>> fetchPlaces() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // Chuyển đổi từ JSON sang danh sách Place
      return jsonResponse.map((place) => Place.fromJson({
        'name': place['title'], // Giả lập thuộc tính 'name'
        'description': place['body'], // Giả lập thuộc tính 'description'
      })).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }
}
