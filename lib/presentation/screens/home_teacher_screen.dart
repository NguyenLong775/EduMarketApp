import 'package:flutter/material.dart';
import 'add_course_screen.dart';
import '../../data/datasources/mock_data_source.dart';
import 'login_screen.dart'; // 👉 Thêm import này để logout về LoginScreen

class HomeTeacherScreen extends StatefulWidget {
  const HomeTeacherScreen({super.key});

  @override
  State<HomeTeacherScreen> createState() => _HomeTeacherScreenState();
}

class _HomeTeacherScreenState extends State<HomeTeacherScreen> {
  // 👉 Hàm đăng xuất
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
        title: const Text('Trang giáo viên'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(courses[i].title),
          subtitle: Text('${courses[i].price} VNĐ'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddCourseScreen()),
          );
          setState(() {}); // Cập nhật lại danh sách sau khi thêm khóa học
        },
        label: const Text('Thêm khóa học'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
