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
   
    await tester.pumpWidget(
      MaterialApp(
        home: AuthSignupScreen(),
      ),
    );

    expect(find.text('Sign Up'), findsOneWidget);

    await tester.enterText(find.byKey(Key('fullNameField')), 'John Doe');

    await tester.enterText(
        find.byKey(Key('emailField')), 'john.doe@example.com');

    await tester.enterText(find.byKey(Key('passwordField')), 'password123');

    await tester.tap(find.byKey(Key('signUpButton')));

    await tester.pumpAndSettle();

    expect(find.text('Success'), findsOneWidget);
    expect(find.text('Register Success'), findsOneWidget);
  });
}
