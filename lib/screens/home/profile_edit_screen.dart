// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:guggal_social/models/user_model.dart';
import 'package:guggal_social/screens/home/dashboard_screen.dart';
import 'package:guggal_social/services/base_services.dart';
import 'package:guggal_social/services/user_services.dart';
import 'package:guggal_social/utils/brand_colors.dart';
import 'package:guggal_social/widgets/progress_dailog.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool isLoading = false;
  UserModel currentUser = UserModel();
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  File? imageFile;
  bool isImageSelected = false;
  String uploadedImage = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    currentUser = (await BaseService.getCurrentUser())!;

    nameController.text = currentUser.firstName ?? "";
    emailController.text = currentUser.email ?? "";

    setState(() {
      isLoading = false;
    });
  }

  pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      uploadedImage = await UserServices.uploadImage(imageFile!, context);

      setState(() {
        isImageSelected = true;
      });

      // print('image selected');
    } else {
      setState(() {
        isImageSelected = false;
      });
      // print('image not selected');
    }

    if (kDebugMode) {
      print('--------------------image is -------------');
      print(uploadedImage);
      print(isImageSelected);
    }

    // print(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: BrandColors.appBackgroundColor,
        backgroundColor: BrandColors.appBackgroundColor,
        elevation: 0,
        titleSpacing: 0,
        leading: InkWell(
          splashColor: Colors.white,
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Profile Setting',
          style: TextStyle(
            fontSize: 18,
            fontVariations: [FontVariation('wght', 400)],
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? SizedBox(
                width: size.width,
                height: size.height / 1.2,
                child: Center(
                  child: CircularProgressIndicator(
                    color: BrandColors.primaryColor,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentUser.profilePicture == null && uploadedImage.isEmpty
                        ? GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 28),
                              decoration: BoxDecoration(
                                color: BrandColors.greyColor4,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  HeroIcon(
                                    HeroIcons.photo,
                                    color: BrandColors.greyColor,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Upload Image',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontVariations: const [
                                        FontVariation('wght', 500)
                                      ],
                                      color: BrandColors.greyColor3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: isImageSelected ||
                                          uploadedImage.isNotEmpty
                                      ? NetworkImage(
                                          "${BaseService.BASE_URL}/assets/$uploadedImage")
                                      : NetworkImage(
                                              "${BaseService.BASE_URL}/assets/${currentUser.profilePicture}")
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'First name',
                      style: TextStyle(
                        fontSize: 16,
                        fontVariations: [FontVariation('wght', 600)],
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width,
                      // height: size.height / 16,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: BrandColors.greyColor1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: nameController,
                        style: const TextStyle(
                          fontSize: 16,
                          fontVariations: [FontVariation('wght', 500)],
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Enter your name",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontVariations: const [FontVariation('wght', 500)],
                            color: BrandColors.greyColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontVariations: [FontVariation('wght', 600)],
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width,
                      // height: size.height / 12,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: BrandColors.greyColor1,
                        // border: Border.all(
                        // ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: emailController,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontVariations: const [
                                    FontVariation('wght', 400)
                                  ],
                                  color: BrandColors.greyColor,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontVariations: [FontVariation('wght', 400)],
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (nameController.text.trim().isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter first name');
                          return;
                        }

                        showDialog(
                          context: context,
                          builder: (context) =>
                              const ProgressDailog(status: "Updating Profile"),
                        );

                        Map<String, dynamic> data = {
                          "first_name": nameController.text.trim(),
                        };

                        if (isImageSelected) {
                          data['profile_picture'] = uploadedImage;
                        }

                        await UserServices.updateUserData(data, context, true);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: BrandColors.primaryColor,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              fontVariations: [FontVariation('wght', 600)],
                              color: Colors.white,
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
