import 'api_service.dart';

class AuthService {
  // تسجيل الدخول
  static Future<bool> login({
    required String name,
    required String password,
  }) async {
    try {
      final users = await ApiService.getUserByName(name);
      if (users.isNotEmpty && users[0]['password'] == password) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  // إنشاء حساب جديد
  static Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await ApiService.createUser(
      name: name,
      email: email,
      password: password,
    );

    return response.statusCode == 201;
  }
}
