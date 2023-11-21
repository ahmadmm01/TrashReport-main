import 'package:final_project_2023/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project_2023/presentation/auth/signup/auth_signup.screen.dart';

void main() {
  testWidgets('AuthSignupScreen UI Test', (WidgetTester tester) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final FirebaseAuth _auth = FirebaseAuth.instance;
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: AuthSignupScreen(),
      ),
    );

    // Verify that the title is rendered.
    expect(find.text('Sign Up'), findsOneWidget);

    // Enter text in Full Name field
    await tester.enterText(find.byKey(Key('fullNameField')), 'John Doe');

    // Enter text in Email field
    await tester.enterText(
        find.byKey(Key('emailField')), 'john.doe@example.com');

    // Enter text in Password field
    await tester.enterText(find.byKey(Key('passwordField')), 'password123');

    // Tap on the Sign Up button
    await tester.tap(find.byKey(Key('signUpButton')));

    // Wait for the animation to complete and navigate to the next screen
    await tester.pumpAndSettle();

    // Verify that the new screen is rendered
    expect(find.text('Success'), findsOneWidget);
    expect(find.text('Register Success'), findsOneWidget);
  });
}
