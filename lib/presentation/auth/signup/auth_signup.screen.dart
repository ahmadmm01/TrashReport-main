import 'package:animate_do/animate_do.dart';
import 'package:final_project_2023/constants.dart';
import 'package:final_project_2023/presentation/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'controllers/auth_signup.controller.dart';

class AuthSignupScreen extends StatefulWidget {
  const AuthSignupScreen({super.key});

  @override
  State<AuthSignupScreen> createState() => _AuthSignupScreenState();
}

class _AuthSignupScreenState extends State<AuthSignupScreen> {
  int activeIndex = 0;
  bool _isObscure = true;
  late String fullName;
  late String _email;
  late String _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<String> _images = [
    'https://img.freepik.com/free-vector/illustration-with-people-cleaning-beach-concept_23-2148437842.jpg?w=1060&t=st=1674918303~exp=1674918903~hmac=20892acffdc3bb3bb209234b28ce5b042684b9e483650c9acbca3f13b77b2a8c'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: kSecondColor,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              FadeInUp(
                child: Container(
                  height: 270,
                  child: Stack(
                    children: _images.asMap().entries.map((e) {
                      return Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 800),
                          opacity: activeIndex == e.key ? 1 : 0,
                          child: Image.network(e.value, height: 200),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 800),
                child: TextField(
                  onChanged: (value) {
                          fullName = value;
                        },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Input your fullname',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    labelStyle: const TextStyle(
                      color: kSecondColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(
                      Iconsax.text,
                      color: kSecondColor,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kSecondColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    floatingLabelStyle:
                        const TextStyle(color: kSecondColor, fontSize: 18),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kSecondColor, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 800),
                child: TextField(
                  onChanged: (value) {
                          _email = value;
                        },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Input your email',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    labelStyle: const TextStyle(
                      color: kSecondColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(
                      Iconsax.user,
                      color: kSecondColor,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kSecondColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    floatingLabelStyle:
                        const TextStyle(color: kSecondColor, fontSize: 18),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kSecondColor, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 800),
                child: TextField(
                  onChanged: (value) {
                          _password = value;
                        },
                  obscureText: _isObscure,
                  cursorColor: kSecondColor,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye, color: kSecondColor),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    labelStyle: const TextStyle(
                      color: kSecondColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(
                      Icons.key,
                      color: kSecondColor,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kSecondColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    floatingLabelStyle:
                        const TextStyle(color: kSecondColor, fontSize: 18),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kSecondColor, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                delay: const Duration(milliseconds: 800),
                child: MaterialButton(
                  onPressed: () async{
                    final UserCredential userCredential =
                              await _auth.createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                          final User? user = userCredential.user;
                          if (user != null) {
                            // Update the display name in Firebase
                            await user.updateProfile(displayName: fullName);
                            await user.reload();
                            Get.offAll(const HomeScreen());
                            Get.snackbar('Success', 'Register Success',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor:
                                    const Color.fromARGB(133, 76, 175, 79),
                                colorText: Colors.white,
                                duration: const Duration(seconds: 3),
                                margin: const EdgeInsets.all(10),
                                borderRadius: 10);
                          }
                  },
                  height: 45,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: kSecondColor,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: TextStyle(
                          color: Colors.grey.shade400, fontSize: 14.0),
                    ),
                    TextButton(
                      onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: kSecondColor, fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
