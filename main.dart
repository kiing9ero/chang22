import 'package:final_project/mainpage.dart';
import 'package:final_project/profile.dart';
import 'package:final_project/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedINdex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedINdex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면에 보이는 영역
    return Scaffold(
      body: IndexedStack(
        index: _selectedINdex,
        children: [MainPage(), Search(), Profile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '메인'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
        ],
        currentIndex: _selectedINdex,
        onTap: _onItemTapped,
      ),
    );
  }
}
