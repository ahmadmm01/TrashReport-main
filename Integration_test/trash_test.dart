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
    await tester.pumpWidget(
      MaterialApp(
        home: TrashScreen(),
      ),
    );

    expect(find.text('OMOTRASH'), findsOneWidget);

    await tester.enterText(find.byKey(Key('nameField')), 'John Doe');

    await tester.enterText(find.byKey(Key('phoneNoField')), '081234567890');

    await tester.tap(find.byKey(Key('typeDropdown')));

    await tester.pumpAndSettle();

    await tester.tap(find.text('Can'));

    expect(find.text('Can'), findsOneWidget);

    await tester.enterText(find.byKey(Key('weightField')), '6.5 kg');

    await tester.enterText(find.byKey(Key('addressField')),
        'Urban Village, Sub-district, District');

    await tester.enterText(
        find.byKey(Key('locationField')), 'House/Unit/Floor number');

    await tester.enterText(
        find.byKey(Key('landmarkField')), 'Next to a coffee shop');

    await tester.tap(find.byKey(Key('submitButton')));

    await tester.pumpAndSettle();

    expect(find.text('Success'), findsOneWidget);
    expect(find.text('Data saved successfully'), findsOneWidget);
  });
}
