import 'package:final_project_2023/presentation/profile/controllers/profile.controller.dart';
import 'package:final_project_2023/presentation/profile/profile.screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:final_project_2023/presentation/auth/login/auth_login.screen.dart';

class MockProfileController extends Mock implements ProfileController {}

void main() {
  late ProfileController mockController;

  setUp(() {
    mockController = MockProfileController();
  });

  testWidgets('ProfileScreen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfileScreen(),
      ),
    );
    expect(find.text('My Profile'), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('Logout button press test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfileScreen(),
      ),
    );

    when(FirebaseAuth.instance.signOut()).thenAnswer((_) async {});

    await tester.tap(find.text('Logout'));
    await tester.pump();

    verify(FirebaseAuth.instance.signOut()).called(1);
    verify(mockController.logout()).called(1);
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
