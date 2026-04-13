import 'package:flutter/material.dart';
import 'package:keep_my_money/home_tab.dart';
import 'package:keep_my_money/widgets/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep My Money',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeTab(),
          Center(child: Text('카테고리'),),
          Center(child: Text('설정'),),
        ],
      ),
      bottomNavigationBar: NavBar(
        currentIndex: _currentIndex, 
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }
}
