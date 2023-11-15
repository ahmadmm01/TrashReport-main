import 'package:final_project_2023/presentation/profile/controllers/profile.controller.dart';
import 'package:final_project_2023/presentation/profile/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:final_project_2023/presentation/auth/login/auth_login.screen.dart';
import 'package:final_project_2023/screens/profile_screen.dart';

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

    // Verify if the UI elements are present
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

    // Mock the signOut method
    when(FirebaseAuth.instance.signOut()).thenAnswer((_) async {});

    // Tap the logout button
    await tester.tap(find.text('Logout'));
    await tester.pump();

    // Verify if the signOut method is called and navigation is performed
    verify(FirebaseAuth.instance.signOut()).called(1);
    verify(mockController.logout()).called(1);
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
