import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_2023/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/display.controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayScreen extends GetView<DisplayController> {
  const DisplayScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: kSecondColor,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('form').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final message = snapshot.data!.docs[index];
              DocumentSnapshot card = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kSecondColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kSecondColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Name: ${card['name']}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: kSecondColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: double.infinity,
                            height: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kSecondColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Phone number: ${card['phone']}',
                                  style: const TextStyle(
                                      fontSize: 15, color: kSecondColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: double.infinity,
                            height: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kSecondColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'The type of trash: ${card['type']}',
                                  style: const TextStyle(
                                      fontSize: 15, color: kSecondColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: double.infinity,
                            height: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kSecondColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Weight: ${card['weight']}',
                                  style: const TextStyle(
                                      fontSize: 15, color: kSecondColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: double.infinity,
                            height: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kSecondColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Address: ${card['address']}',
                                  style: const TextStyle(
                                      fontSize: 15, color: kSecondColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: double.infinity,
                            height: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kSecondColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Location details: ${card['location']}',
                                  style: const TextStyle(
                                      fontSize: 15, color: kSecondColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: double.infinity,
                            height: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kSecondColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Landmark: ${card['landmark']}',
                                  style: const TextStyle(
                                      fontSize: 15, color: kSecondColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InkWell(
                            onTap: () async {
                              final url =
                                  'https://www.google.com/maps/search/?api=1&query=${message['maps']}';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Container(
                              width: 120,
                              height: 35,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: kSecondColor),
                                  borderRadius: BorderRadius.circular(10),
                                  color: kSecondColor,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Go to location',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
