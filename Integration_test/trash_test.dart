import 'package:final_project_2023/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project_2023/presentation/trash/trash.screen.dart';

void main() {
  testWidgets('TrashScreen UI Test', (WidgetTester tester) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final FirebaseAuth _auth = FirebaseAuth.instance;
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: TrashScreen(),
      ),
    );

    // Verify that the title is rendered.
    expect(find.text('OMOTRASH'), findsOneWidget);

    // Enter text in Name field
    await tester.enterText(find.byKey(Key('nameField')), 'John Doe');

    // Enter text in Phone Number field
    await tester.enterText(find.byKey(Key('phoneNoField')), '081234567890');

    // Tap on the Select Type dropdown
    await tester.tap(find.byKey(Key('typeDropdown')));

    // Wait for the animation to complete and the dropdown to expand
    await tester.pumpAndSettle();

    // Tap on the 'Can' option in the dropdown
    await tester.tap(find.text('Can'));

    // Verify that the selected type is 'Can'
    expect(find.text('Can'), findsOneWidget);

    // Enter text in Weight field
    await tester.enterText(find.byKey(Key('weightField')), '6.5 kg');

    // Enter text in Address field
    await tester.enterText(find.byKey(Key('addressField')),
        'Urban Village, Sub-district, District');

    // Enter text in Location Details field
    await tester.enterText(
        find.byKey(Key('locationField')), 'House/Unit/Floor number');

    // Enter text in Landmark field
    await tester.enterText(
        find.byKey(Key('landmarkField')), 'Next to a coffee shop');

    // Tap on the Submit button
    await tester.tap(find.byKey(Key('submitButton')));

    // Wait for the animation to complete and navigate to the next screen
    await tester.pumpAndSettle();

    // Verify that the success message is displayed
    expect(find.text('Success'), findsOneWidget);
    expect(find.text('Data saved successfully'), findsOneWidget);
  });
}
