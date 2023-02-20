import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants.dart';
import '../../../core/utils/size_config.dart';
import '../widgets/profile_content.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? file;

  Future pickerCamera() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(myfile!.path);
    });
  }

  Future uploadImage() async {
    if (file == null) return;

    String base64 = base64Encode(file!.readAsBytesSync());

    String imageName = file!.path.split("/").last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MainColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: SizeConfig.defaultSize! * 16.5,
                  color: MainColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    file != null
                        ? CircleAvatar(
                            radius: 47,
                            backgroundColor: primaryColor,
                            child: GestureDetector(
                              onTap: () {
                                pickerCamera();
                              },
                              child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(44),
                                    image: DecorationImage(
                                      image: FileImage(file!),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundColor: primaryColor,
                            child: IconButton(
                              icon: Icon(
                                Icons.person,
                                size: 36,
                                color: Colors.grey,
                              ),
                              onPressed: () => {
                                pickerCamera()
                                },
                            ),
                          ),
                  ],
                ),
                Positioned(
                  top: 5,
                  right: 10,
                  child: Icon(
                    Icons.edit_note_rounded,
                    color: primaryColor,
                    size: 38,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: SizeConfig.defaultSize! * 5,
                  left: SizeConfig.defaultSize! * 5,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Mahmoud Hanafy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Mahmoud2022@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ProfileContent(
                text: "My Orders", icon: Icons.backpack, color: Colors.grey),
            ProfileContent(
                text: "Favourites",
                icon: FontAwesomeIcons.heart,
                color: Colors.grey),
            ProfileContent(
                text: "Settings", icon: Icons.settings, color: Colors.grey),
            ProfileContent(
                text: "My Cart", icon: Icons.shopping_cart, color: Colors.grey),
            ProfileContent(
                text: "Rate Us",
                icon: Icons.star_rate_outlined,
                color: Colors.grey),
            ProfileContent(
                text: "Refer a friend", icon: Icons.share, color: Colors.grey),
            ProfileContent(text: "Help", icon: Icons.help, color: Colors.grey),
            ProfileContent(
                text: "Log Out", icon: Icons.logout, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
