import 'package:final_project_2023/presentation/home/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project_2023/main.dart'; // Replace with the path to your main.dart file
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  testWidgets('Login Integration Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        HomeScreen()); // Replace with the name of your main app widget

    // Wait for the app to load
    await tester.pumpAndSettle();

    // Find the email and password text fields
    final emailField =
        find.byKey(Key('email_field')); // Add a key to your email text field
    final passwordField = find
        .byKey(Key('password_field')); // Add a key to your password text field

    // Enter the username and password
    await tester.enterText(emailField, 'adakahmangga@gmail.com');
    await tester.enterText(passwordField, 'mangga1234');

    // Find and tap the login button
    final loginButton =
        find.byKey(Key('login_button')); // Add a key to your login button
    await tester.tap(loginButton);

    // Wait for the authentication process to complete
    await tester.pumpAndSettle();

    // Check if the user is redirected to the home screen
    expect(find.text('Home Screen'),
        findsOneWidget); // Replace with a text that indicates you are on the home screen
  });
}
