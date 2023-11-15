import 'package:animate_do/animate_do.dart';
import 'package:final_project_2023/constants.dart';
import 'package:final_project_2023/presentation/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';

class TrashScreen extends StatefulWidget {
  late String title;
  Widget? child;
  TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  double? _latitude;
  double? _longitude;
  int activeIndex = 0;
  bool _isExpanded = true;
  String? selectedItem;
  late String _name;
  late String _type;
  late String _weight;
  late String _phoneNo;
  late String _address;
  late String _location;
  late String _landmark;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final List<String> _images = [
    'https://img.freepik.com/free-vector/illustration-with-people-cleaning-beach_23-2148437841.jpg?w=1060&t=st=1674918310~exp=1674918910~hmac=e97204bb59d6354bd32a382f3a3c2e57dc724614f4f8fea29e65fab539aa6df8'
  ];
  final Location _location2 = Location();

  @override
  Widget build(BuildContext context) {
    _location2.getLocation().then((value) {
      setState(() {
        _latitude = value.latitude!;
        _longitude = value.longitude!;
      });
    });
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'OMOTRASH',
            style: TextStyle(fontSize: 25),
          ),
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
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
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
                  child: const Text(
                    'Submit Trash',
                    style: TextStyle(
                        color: kSecondColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: const Text(
                    "If you can't reduce then reuse!",
                    style: TextStyle(
                        color: kSecondColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
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
                      _name = value;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Name',
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
                  height: 5,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: TextField(
                    onChanged: (value) {
                      _phoneNo = value;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'E.g. 081234567890',
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
                        Iconsax.call,
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
                  height: 5,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: DropDownCard(
                    title: selectedItem ?? "Select the type of trash",
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            selectedItem = 'Can';
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: kSecondColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Can',
                                style: TextStyle(
                                  color: kSecondColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            selectedItem = 'Rubber';
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: kSecondColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Rubber',
                                style: TextStyle(
                                  color: kSecondColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            selectedItem = 'Glass';
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: kSecondColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Glass',
                                style: TextStyle(
                                  color: kSecondColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            selectedItem = 'Paper';
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kSecondColor, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Paper',
                                style: TextStyle(
                                  color: kSecondColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        GestureDetector(
                          onTap: () {
                            selectedItem = 'Plastic';
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kSecondColor, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Plastic',
                                style: TextStyle(
                                  color: kSecondColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            selectedItem = 'Metal';
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kSecondColor, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Metal',
                                style: TextStyle(
                                  color: kSecondColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: TextField(
                    onChanged: (value) {
                      _weight = value;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Weight',
                      hintText: 'Input trash weigh (E.g. 6,5 kg)',
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
                        Iconsax.weight,
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
                  height: 5,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: TextField(
                    onChanged: (value) {
                      _address = value;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'E.g. urban village, sub-district, district',
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
                        Iconsax.location,
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
                  height: 5,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: TextField(
                    onChanged: (value) {
                      _location = value;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Location details',
                      hintText: 'E.g. house/unit/floor number',
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
                        Iconsax.home,
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
                  height: 5,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 800),
                  child: TextField(
                    onChanged: (value) {
                      _landmark = value;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: 'Landmark',
                      hintText: 'E.g. house next to a coffee shop',
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
                        Iconsax.home_11,
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
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: kSecondColor, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GoogleMap(
                      onTap: (latLng) {
                        setState(() {
                          _latitude = latLng.latitude;
                          _longitude = latLng.longitude;
                        });
                      },
                      mapType: MapType.satellite,
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(-7.8108182, 110.3196722),
                        zoom: 15,
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: true,
                      buildingsEnabled: true,
                      compassEnabled: true,
                      trafficEnabled: true,
                      tiltGesturesEnabled: true,
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
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? true) {
                        _formKey.currentState?.save();
                        await FirebaseFirestore.instance
                            .collection('form')
                            .add({
                          'name': _name,
                          'phone': _phoneNo,
                          'type': selectedItem,
                          'weight': _weight,
                          'address': _address,
                          'location': _location,
                          'landmark': _landmark,
                          'maps': _latitude.toString() +
                              ',' +
                              _longitude.toString(),
                        });
                        Get.snackbar('Success', 'Data saved successfully',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: const Color.fromARGB(123, 33, 149, 243));
                        Get.offAll(const HomeScreen());
                      }
                    },
                    height: 45,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: kSecondColor,
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownCard extends StatefulWidget {
  final String title;
  final Widget child;

  const DropDownCard({super.key, required this.title, required this.child});

  @override
  _DropDownCardState createState() => _DropDownCardState();
}

class _DropDownCardState extends State<DropDownCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kSecondColor, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: const TextStyle(color: kSecondColor),
        ),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: widget.child,
          )
        ],
        onExpansionChanged: (isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },
      ),
    );
  }
}
