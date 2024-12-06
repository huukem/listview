import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 2',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
            child: Text(
              'Flex Demo - CodeFresher',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          actions: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                'DEBUG',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              buildCard(
                'gallery/pictures/hinh1.jpg',
                'Lập trình Flutter',
                'Thực chiến dự án app mobile 2022',
              ),
              SizedBox(height: 16),
              Divider(thickness: 2, color: Colors.cyanAccent),
              SizedBox(height: 16),
              buildCard(
                'gallery/pictures/hinh2.jpg',
                'Lập trình Android',
                'Java + Kotlin',
              ),
              SizedBox(height: 16),
              Divider(thickness: 2, color: Colors.cyanAccent),
              SizedBox(height: 16),
              buildCard(
                'gallery/pictures/hinh3.jpg',
                'Lập trình Java cơ bản',
                'Cho người mới bắt đầu',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String imagePath, String title, String subtitle) {
    bool isRightAligned = imagePath.contains('hinh2.jpg');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: isRightAligned
          ? [
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(width: 30), // Tạo khoảng cách giữa nội dung và hình ảnh
        Flexible(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ]
          : [
        Flexible(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 30), // Tạo khoảng cách giữa hình ảnh và nội dung
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
