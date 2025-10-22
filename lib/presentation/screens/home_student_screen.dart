import 'package:flutter/material.dart';
import '../../data/datasources/mock_data_source.dart';
import 'chat_screen.dart';
import 'login_screen.dart';

class HomeStudentScreen extends StatefulWidget {
  const HomeStudentScreen({super.key});

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  final myCourses = <String>[];

  void buyCourse(String id) {
    setState(() {
      myCourses.add(id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thanh toán thành công!')),
      );
    });
  }

  void logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final courses = MockDataSource.courses;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang học viên'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, i) {
          final c = courses[i];
          final bought = myCourses.contains(c.id);
          return Card(
            child: ListTile(
              title: Text(c.title),
              subtitle: Text('${c.price} VNĐ'),
              trailing: ElevatedButton(
                onPressed: bought ? null : () => buyCourse(c.id),
                child: Text(bought ? 'Đã mua' : 'Mua ngay'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ChatScreen()),
        ),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
