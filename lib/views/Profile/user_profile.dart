import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import '../../theme/app_common_color.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  final double widgetGap = 10;

  Widget commonUserProfileData(context, heading, value) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(AppCommonColor.textFieldBG),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(
                    AppCommonColor.appMainColor,
                  )),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImageFromGallery(context) async {
    CommonProvider provider = Provider.of(context, listen: false);
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

    if (pickedFile != null) {
      Uint8List imagePath = await pickedFile.readAsBytes();

      String imageBase64Encoded =
          "data:image/jpeg;base64,${base64.encode(imagePath)}";
      provider.updateUserProfileImage(context,
          {"user_id": provider.userID, "image_url": imageBase64Encoded});
    }
  }

  Future<void> _takePicture(context) async {
    CommonProvider provider = Provider.of(context, listen: false);
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 30);

    if (pickedFile != null) {
      Uint8List imagePath = await pickedFile.readAsBytes();

      String imageBase64Encoded =
          "data:image/jpeg;base64,${base64.encode(imagePath)}";
      provider.updateUserProfileImage(context,
          {"user_id": provider.userID, "image_url": imageBase64Encoded});
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    _getImageFromGallery(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _takePicture(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/appbackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 55,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Proflie",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/edit_profile");
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(AppCommonColor.whiteColor),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),

                          Consumer<CommonProvider>(
                            builder: (context, value, child) => Center(
                              child: CircleAvatar(
                                backgroundColor:
                                    Color(AppCommonColor.appMainColor),
                                backgroundImage: NetworkImage(
                                    provider.userProfileInfo['avatar']),
                                radius: 50,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              provider.userProfileInfo['username'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: Center(
                              child: Text(
                                "Change Profile Picture",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(AppCommonColor.appMainColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // commonUserProfileData(
                          //     context, "Client Type", "In office"),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // commonUserProfileData(
                          //     context, "Legal / First Name", "Robert"),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // commonUserProfileData(
                          //     context, "Preferd First Name", "Alfie"),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // commonUserProfileData(
                          //     context, "Date of Birth", "12 / 12 / 2023 "),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          commonUserProfileData(context, "Email",
                              provider.userProfileInfo['email']),
                          const SizedBox(
                            height: 10,
                          ),
                          // commonUserProfileData(
                          //   context,
                          //   "Street Addres",
                          //   "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // commonUserProfileData(
                          //   context,
                          //   "Street Addres 2",
                          //   "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // commonUserProfileData(context, "City", "Gotham"),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // commonUserProfileData(context, "State", "Newyork"),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          commonUserProfileData(context, "Gender",
                              provider.userProfileInfo['gender']),
                          const SizedBox(
                            height: 10,
                          ),
                          commonUserProfileData(context, "Phone Number",
                              provider.userProfileInfo['phone']),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // commonUserProfileData(
                          //     context, "Password", "**********"),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
