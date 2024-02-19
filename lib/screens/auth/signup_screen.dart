// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guggal_social/screens/auth/login_screen.dart';
import 'package:guggal_social/services/auth_services.dart';
import 'package:guggal_social/services/user_services.dart';
import 'package:guggal_social/utils/brand_colors.dart';
import 'package:guggal_social/utils/global_variables.dart';
import 'package:guggal_social/widgets/progress_dailog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int selectedIndex = 0;
  List<String> typeList = ["Phone", "Email"];
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      scale: 1,
                      fit: BoxFit.fill,
                      alignment: Alignment.topLeft,
                      image: AssetImage('assets/images/lines.png'),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: BrandColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: size.width / 2.4,
                            height: 5,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: BrandColors.greyColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: size.width / 2.4,
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 10,
                      ),
                      const Text(
                        'Create account to continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontVariations: [FontVariation('wght', 900)],
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(242, 242, 242, 0.48),
                          // color: Colors.red,
                        ),
                        child: Center(
                          child: ListView.builder(
                            itemCount: typeList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  selectedIndex = index;
                                  if (index == 0) {
                                  } else {}
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 8),
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    color: index == selectedIndex
                                        ? BrandColors.primaryColor
                                        : const Color.fromRGBO(
                                            245, 247, 250, 1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      typeList[index],
                                      style: TextStyle(
                                        color: index == selectedIndex
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontVariations: const [
                                          FontVariation("wght", 500)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: BrandColors.greyColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: BrandColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: firstNameController,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          //   LengthLimitingTextInputFormatter(10)
                          // ],
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter first name",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontVariations: const [
                                FontVariation('wght', 400)
                              ],
                              color: BrandColors.greyColor,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            fontVariations: [FontVariation('wght', 400)],
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                Container(
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: BrandColors.greyColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: BrandColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          //   LengthLimitingTextInputFormatter(10)
                          // ],
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter last name",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontVariations: const [
                                FontVariation('wght', 400)
                              ],
                              color: BrandColors.greyColor,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            fontVariations: [FontVariation('wght', 400)],
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                selectedIndex == 0
                    ? Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: BrandColors.greyColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: BrandColors.primaryColor,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: phoneController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: "99999-99999",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontVariations: const [
                                      FontVariation('wght', 400)
                                    ],
                                    color: BrandColors.greyColor,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontVariations: [FontVariation('wght', 400)],
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: BrandColors.greyColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: BrandColors.primaryColor,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: emailController,
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.allow(
                                    //       RegExp(r'[0-9]')),
                                    //   LengthLimitingTextInputFormatter(10)
                                    // ],
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "Enter your email",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontVariations: const [
                                          FontVariation('wght', 400)
                                        ],
                                        color: BrandColors.greyColor,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontVariations: [
                                        FontVariation('wght', 400)
                                      ],
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height / 70,
                          ),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: BrandColors.greyColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock,
                                  color: BrandColors.primaryColor,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordController,
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    //   LengthLimitingTextInputFormatter(10)
                                    // ],
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: !showPassword,
                                    decoration: InputDecoration(
                                      hintText: "Enter your password",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontVariations: const [
                                          FontVariation('wght', 400)
                                        ],
                                        color: BrandColors.greyColor,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontVariations: [
                                        FontVariation('wght', 400)
                                      ],
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Icon(
                                //   Icons.remove_red_eye,
                                //   color: BrandColors.primaryColor,
                                // )
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: Text(
                                    showPassword ? 'Hide' : "Show",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontVariations: const [
                                        FontVariation('wght', 400)
                                      ],
                                      color: BrandColors.blackColor1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height / 70,
                          ),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: BrandColors.greyColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock,
                                  color: BrandColors.primaryColor,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: confirmPasswordController,
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    //   LengthLimitingTextInputFormatter(10)
                                    // ],
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Confirm your password",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontVariations: const [
                                          FontVariation('wght', 400)
                                        ],
                                        color: BrandColors.greyColor,
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontVariations: [
                                        FontVariation('wght', 400)
                                      ],
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () async {
                    if (firstNameController.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: 'Please enter first name');
                      return;
                    }
                    if (lastNameController.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: 'Please enter last name');
                      return;
                    }
                    if (selectedIndex == 0) {
                      if (phoneController.text.trim().length != 10) {
                        Fluttertoast.showToast(
                            msg: 'Please enter valid number');
                        return;
                      }
                      var data = {
                        "first_name": firstNameController.text.trim(),
                        "last_name": lastNameController.text.trim(),
                        "email": "${phoneController.text.trim()}@gmail.com",
                        "role": customerRole,
                        "auth_type": "phone"
                      };
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            const ProgressDailog(status: 'Validating...'),
                      );
                      bool userExists = await UserServices.checkUserExists(
                          "${phoneController.text.trim()}@gmail.com");
                      if (userExists) {
                        Navigator.pop(context);
                        Fluttertoast.showToast(msg: 'number is already used');
                        return;
                      } else {
                        await AuthService.authWithPhone(context,
                            phoneController.text.trim(), false, data, "+91");
                      }
                    } else {
                      if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(emailController.text.trim())) {
                        Fluttertoast.showToast(
                            msg: 'Please enter a valid email');
                        return;
                      }
                      if (passwordController.text.trim().length < 6) {
                        Fluttertoast.showToast(
                            msg:
                                'Please enter password password with length 6 minimum');
                        return;
                      }
                      if (confirmPasswordController.text.trim() !=
                          passwordController.text.trim()) {
                        Fluttertoast.showToast(
                            msg:
                                'Confirm password should be same as entered password');
                        return;
                      }

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const ProgressDailog(
                            status: 'Creating account Please wait...'),
                      );
                      bool userExists = await UserServices.checkUserExists(
                          emailController.text.trim());

                      if (userExists) {
                        // email is already used
                        Fluttertoast.showToast(msg: 'Email is already used');
                        Navigator.pop(context);
                        return;
                      } else {
                        var data = {
                          "first_name": firstNameController.text.trim(),
                          "last_name": lastNameController.text.trim(),
                          "email": emailController.text.trim(),
                          "password": passwordController.text.trim(),
                          "role": customerRole,
                          "auth_type": "email"
                        };
                        await AuthService.serverSignUp(data, context);
                      }
                    }
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
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontVariations: [FontVariation('wght', 600)],
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 14,
                        fontVariations: const [FontVariation('wght', 400)],
                        color: BrandColors.greyColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 14,
                          fontVariations: const [FontVariation('wght', 400)],
                          color: BrandColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
