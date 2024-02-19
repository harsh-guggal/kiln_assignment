// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guggal_social/models/user_model.dart';
import 'package:guggal_social/screens/home/profile_edit_screen.dart';
import 'package:guggal_social/services/base_services.dart';
import 'package:guggal_social/utils/brand_colors.dart';
import 'package:guggal_social/widgets/pop_ups.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotification = false;
  bool isLoading = false;

  UserModel currentUser = UserModel();

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

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: isLoading
            ? SizedBox(
                width: size.width,
                height: size.height,
                child: Center(
                  child: CircularProgressIndicator(
                    color: BrandColors.primaryColor,
                  ),
                ),
              )
            : Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width,
                        height: size.height / 4.5,
                        color: BrandColors.primaryColor,
                      ),
                      Positioned(
                        left: -100,
                        top: -20,
                        child: Container(
                          height: size.height / 4.5,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white70.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -50,
                        bottom: -150,
                        child: Container(
                          height: size.height / 4.5,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white70.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            Text(
                              currentUser.firstName ?? "",
                              style: TextStyle(
                                fontSize: 18,
                                fontVariations: const [
                                  FontVariation('wght', 800)
                                ],
                                color: BrandColors.blackColor1,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: BrandColors.primaryColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  currentUser.email ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontVariations: const [
                                      FontVariation('wght', 400)
                                    ],
                                    color: BrandColors.greyColor3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            GestureDetector(
                              onTap: () {
                                showLogOutPopUp(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 7,
                                      color:
                                          Color.fromRGBO(156, 156, 156, 0.25),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 16),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        // color: BrandColors.greyColor4,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.red.withOpacity(0.1),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.logout,
                                          size: 18,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontVariations: [
                                            FontVariation('wght', 400)
                                          ],
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -80,
                        child: SizedBox(
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          currentUser.profilePicture == null
                                              ? const AssetImage(
                                                  'assets/images/default.png')
                                              : NetworkImage(
                                                      '${BaseService.BASE_URL}/assets/${currentUser.profilePicture}')
                                                  as ImageProvider,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ProfileEditScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        // padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            width: 2,
                                            color: BrandColors.greyColor2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.edit,
                                            color: BrandColors.blackColor1,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
