import 'package:flutter/material.dart';
import 'home_student_screen.dart';
import 'home_teacher_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String error = '';

  void login() {
    String email = emailController.text.trim();
    String pass = passwordController.text.trim();
    if (email == 'teacher@edu.com' && pass == '123456') {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const HomeTeacherScreen()));
    } else if (email == 'student@edu.com' && pass == '123456') {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const HomeStudentScreen()));
    } else {
      setState(() => error = 'Sai tài khoản hoặc mật khẩu!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập EduMarket')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Mật khẩu')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Đăng nhập')),
            if (error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(error, style: const TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}
