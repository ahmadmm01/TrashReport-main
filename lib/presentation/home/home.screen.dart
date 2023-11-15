import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project_2023/constants.dart';
import 'package:final_project_2023/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _screen = 0;
  final screen = [TrashScreen(), const DisplayScreen(), const ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screen[_screen],
      bottomNavigationBar: Container(
        child: CurvedNavigationBar(
          index: 0,
          color: kSecondColor,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: kSecondColor,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 800),
          onTap: (index) {
            setState(() {
              _screen = index;
            });
          },
          items: const [
            Icon(
              Iconsax.trash,
              color: Colors.white,
            ),
            Icon(
              Iconsax.bag,
              color: Colors.white,
            ),
            Icon(
              Iconsax.user,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
