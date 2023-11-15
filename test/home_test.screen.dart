// home_screen_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_2023/presentation/screens.dart';
import 'package:final_project_2023/presentation/home/home.screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('HomeScreen builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(),
    ));
  });
}
