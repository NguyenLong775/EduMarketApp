import '../models/course_model.dart';

class MockDataSource {
  static List<CourseModel> courses = [
    CourseModel(
      id: '1',
      title: 'Flutter Cơ bản',
      description: 'Khóa học giúp bạn nắm vững nền tảng Flutter.',
      price: 200000,
    ),
    CourseModel(
      id: '2',
      title: 'Lập trình Python cho người mới',
      description: 'Bắt đầu học Python một cách dễ hiểu.',
      price: 150000,
    ),
  ];
}
