// auth_signup_screen_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_2023/presentation/auth/signup/auth_signup.screen.dart';
import 'package:final_project_2023/presentation/screens.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('AuthSignupScreen builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: AuthSignupScreen()),
    ));
  });
}
