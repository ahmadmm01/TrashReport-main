// ignore_for_file: unused_element, no_leading_underscores_for_local_identifiers

import 'package:final_project_2023/constants.dart';
import 'package:final_project_2023/firebase_options.dart';
import 'package:final_project_2023/presentation/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:final_project_2023/presentation/auth/login/auth_login.screen.dart';
import 'package:final_project_2023/presentation/trash/trash.screen.dart';

void main() {
  testWidgets('Login Integration Test', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    Future<void> _signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      if (user != null) {
        Get.offAll(const HomeScreen());
        Get.snackbar(
          'Success',
          'Login success',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kSecondColor,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(10),
          borderRadius: 10,
        );
      }
    }

    await tester.pumpWidget(const LoginScreen());

    await tester.pumpAndSettle();

    final emailField = find.byKey(const Key('email_field'));
    final passwordField = find.byKey(const Key('password_field'));

    await tester.enterText(emailField, 'adakahmangga@gmail.com');
    await tester.enterText(passwordField, 'mangga1234');

    final loginButton = find.byKey(const Key('login_button'));
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    expect(find.byType(TrashScreen), findsOneWidget);
  });
}
