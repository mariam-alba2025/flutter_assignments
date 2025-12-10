import 'package:flutter/material.dart';

void main() => runApp(const MyDashboardApp());

class MyDashboardApp extends StatelessWidget {
  const MyDashboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  Widget buildColoredBox(String label, Color color) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: color,
      child: Text(label,
          style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }

  Widget buildPurpleBox(String number) {
    return Container(
      alignment: Alignment.center,
      color: Colors.purple,
      child: Text(number,
          style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }

  Widget buildInfoBox(String label, String count, Color color) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(6), // مساحة حول كل مربع
      padding: const EdgeInsets.all(12),
      width: 85,
      child: Column(
        children: [
          Text(count,
              style: TextStyle(
                  fontSize: 16, color: color, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(label,
              style: TextStyle(
                  fontSize: 16, color: color, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.lightBlue[100], // المربع الكبير أزرق فاتح
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // الصف العلوي A B C
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildColoredBox('A', Colors.red),
                  buildColoredBox('B', Colors.orange),
                  buildColoredBox('C', Colors.yellow),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Fancy Section',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              // الشبكة داخل مربع رمادي
              Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(12),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(6, (index) {
                    return buildPurpleBox('${index + 1}');
                  }),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Info Cards',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              // المربعات السفلية مع مساحة حولها
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildInfoBox('Active', '23', Colors.green),
                  buildInfoBox('Pending', '15', Colors.orange),
                  buildInfoBox('Completed', '7', Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}