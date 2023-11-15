import 'package:animate_do/animate_do.dart';
import 'package:final_project_2023/constants.dart';
import 'package:final_project_2023/presentation/auth/login/auth_login.screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'My Profile',
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: kSecondColor,
          centerTitle: true,
        ),
        body: Center(
          child: FadeInUp(
            delay: const Duration(milliseconds: 800),
            duration: const Duration(milliseconds: 800),
            child: Container(
              width: 350,
              height: 250,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kSecondColor, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser?.photoURL ?? ""),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.displayName ?? "Unnamed",
                    style: const TextStyle(
                      color: kSecondColor,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.email ?? "",
                    style: const TextStyle(
                      color: kSecondColor,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      logout();
                    },
                    height: 45,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: kSecondColor,
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(const LoginScreen());
    });
  }
}
