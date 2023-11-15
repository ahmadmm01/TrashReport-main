import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_2023/presentation/home/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart';

import 'package:final_project_2023/presentation/trash/trash.screen.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockLocation extends Mock implements Location {}

void main() {
  group('TrashScreen Tests', () {
    late TrashScreen trashScreen;
    late MockFirebaseAuth mockFirebaseAuth;
    late MockLocation mockLocation;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockLocation = MockLocation();

      Get.put<FirebaseAuth>(mockFirebaseAuth);
      Get.put<Location>(mockLocation);

      trashScreen = TrashScreen();
    });

    testWidgets('TrashScreen UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: trashScreen,
        ),
      );

      expect(find.text('OMOTRASH'), findsOneWidget);
      expect(find.text('Submit Trash'), findsOneWidget);
      expect(find.text("If you can't reduce then reuse!"), findsOneWidget);
    });

    test('Submit Trash Test', () async {
      when(mockLocation.getLocation())
          .thenAnswer((_) async => LocationData.fromMap({
                'latitude': 37.7749,
                'longitude': -122.4194,
              }));

      verify(Get.snackbar('Success', 'Data saved successfully',
              snackPosition: SnackPosition.TOP,
              backgroundColor: const Color.fromARGB(123, 33, 149, 243)))
          .called(1);

      verify(Get.offAll(const HomeScreen())).called(1);
    });
  });
}
