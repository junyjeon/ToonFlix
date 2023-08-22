import 'package:flutter/material.dart';
import 'package:toonflix/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

//니코's api 사용
// /today endpoint
// 제목, 썸네일, id

// /episodes endpoint
/// 에피소드 제목, 썸네일, id, 설명, 연령제한, 

/// carousel
/// appbar
