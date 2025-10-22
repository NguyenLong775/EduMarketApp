import 'package:flutter/material.dart';
import '../../data/datasources/mock_data_source.dart';
import '../../data/models/course_model.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final priceCtrl = TextEditingController();

  void addCourse() {
    if (titleCtrl.text.isEmpty || priceCtrl.text.isEmpty) return;
    MockDataSource.courses.add(CourseModel(
      id: DateTime.now().toString(),
      title: titleCtrl.text,
      description: descCtrl.text,
      price: double.parse(priceCtrl.text),
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm khóa học')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: 'Tên khóa học')),
            TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: 'Mô tả')),
            TextField(
                controller: priceCtrl,
                decoration: const InputDecoration(labelText: 'Giá')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: addCourse, child: const Text('Lưu')),
          ],
        ),
      ),
    );
  }
}
