import 'package:final_project_2023/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/login/auth_login.screen.dart';
import '../auth/signup/auth_signup.screen.dart';
import 'controllers/welcome.controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/people-cleaning-beach-trash_23-2148423019.jpg?w=1060&t=st=1674737024~exp=1674737624~hmac=a6642719359c1d473cfcbeba4b96ee13f38934d1e317f4d274beac7d031317d6'),
                    fit: BoxFit.contain,
                    alignment: Alignment.center),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'OMOTRASH\n',
                        style: TextStyle(
                          color: kSecondColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      TextSpan(
                        text:
                            'Take part in our mission to #GiveTrashANewLife',
                        style: TextStyle(
                          color: kSecondColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const AuthSignupScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kSecondColor,
                          ),
                          child: Row(
                            children: const <Widget>[
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kSecondColor,
                          ),
                          child: Row(
                            children: const <Widget>[
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
