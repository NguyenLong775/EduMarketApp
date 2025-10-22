# 🎓 EduMarket - Mini Education Marketplace App

Ứng dụng mô phỏng sàn giáo dục: giáo viên đăng khóa học, học viên mua và chat trực tiếp.

## 🧱 Kiến trúc
Áp dụng Clean Architecture + Flutter BLoC:
- **data**: Chứa models, datasource, repository implementation
- **domain**: Chứa entities, repositories abstract, usecases
- **presentation**: Giao diện, Bloc và màn hình
- **main.dart**: Entry point

## 👤 Tài khoản mẫu
| Vai trò | Email | Mật khẩu |
|----------|--------|-----------|
| Giáo viên | teacher@edu.com | 123456 |
| Học viên | student@edu.com | 123456 |

## 🚀 Cách chạy
```bash
git clone https://github.com/NguyenLong775/EduMarketApp.git
cd EduMarketApp
flutter pub get
flutter run
