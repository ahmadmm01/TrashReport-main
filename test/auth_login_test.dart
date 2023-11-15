import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_2023/presentation/auth/login/auth_login.screen.dart';

void main() {
  testWidgets('LoginScreen builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: LoginScreen()),
    ));

    expect(find.byType(TextField), findsNWidgets(2));

    expect(find.byType(MaterialButton), findsOneWidget);

    expect(find.text('Or continue with'), findsOneWidget);

    expect(find.byType(GestureDetector), findsOneWidget);

    expect(find.text("Don't have an account?"), findsOneWidget);

    expect(find.text('Sign Up'), findsOneWidget);
  });
}
