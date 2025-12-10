import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List.generate(8, (index) => "overwhelming");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue, // لون سماوي
        centerTitle: true, // العنوان بالوسط
        title: const Text("emotion"),
        leading: const Icon(Icons.menu), // أيقونة همبرقر منيو
      ),
      body: Container(
        color: Colors.grey[300], // خلفية رمادية أغمق من الكاردات
        child: GridView.count(
          crossAxisCount: 2, // عمودين
          children: items.map((text) {
            return Card(
              color: Colors.white, // لون الكارد أبيض
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // مربعات بدون تدوير
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/meme.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                  Text(text, style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // بدون تفاعل
        backgroundColor: Colors.lightBlue, // لون الزر سماوي
        child: const Icon(Icons.refresh), // أيقونة ريلود
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // أقصى اليمين
    );
  }
}