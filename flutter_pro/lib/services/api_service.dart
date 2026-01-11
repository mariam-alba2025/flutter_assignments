import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://6956fa6ff7ea690182d10b35.mockapi.io/api/user';

  // إنشاء مستخدم جديد
  static Future<http.Response> createUser({
    required String name,
    required String email,
    required String password,
  }) {
    return http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );
  }

  // جلب مستخدم حسب الاسم
  static Future<List<dynamic>> getUserByName(String name) async {
    final response = await http.get(Uri.parse('$baseUrl?name=$name'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('فشل في جلب المستخدم');
    }
  }
}
