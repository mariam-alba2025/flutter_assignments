import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../services/auth_service.dart';
import '../routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'يرجى إدخال اسم المستخدم';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'يرجى إدخال كلمة السر';
    if (value.length < 6) return 'كلمة السر يجب أن تكون 6 أحرف على الأقل';
    return null;
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final success = await AuthService.login(
        name: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (success) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        throw Exception('اسم المستخدم أو كلمة السر غير صحيحة');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString(), textDirection: TextDirection.rtl),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.normal),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),

                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.accent.withOpacity(0.2),
                  child: const Icon(Icons.person, size: 60, color: AppColors.primary),
                ),
                const SizedBox(height: AppPadding.large),

                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'اسم المستخدم'),
                  textAlign: TextAlign.right,
                  validator: _validateUsername,
                ),
                const SizedBox(height: AppPadding.normal),

                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'كلمة السر'),
                  obscureText: true,
                  textAlign: TextAlign.right,
                  validator: _validatePassword,
                ),
                const SizedBox(height: AppPadding.small),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      'نسيت كلمة السر؟',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: AppPadding.normal),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: AppPadding.normal),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.signup);
                  },
                  child: const Text(
                    'ليس لديك حساب؟ أنشئ حساب جديد',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
