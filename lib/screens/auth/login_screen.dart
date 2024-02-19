// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guggal_social/screens/auth/signup_screen.dart';
import 'package:guggal_social/services/auth_services.dart';
import 'package:guggal_social/services/user_services.dart';
import 'package:guggal_social/utils/brand_colors.dart';
import 'package:guggal_social/widgets/progress_dailog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int selectedIndex = 0;
  List<String> typeList = ["Phone", "Email"];
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 22,
              ),
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
                      'Welcome to BRANDKILN',
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
                                      : const Color.fromRGBO(245, 247, 250, 1),
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
                  ],
                ),
              ),

              SizedBox(
                height: size.height / 50,
              ),
              Text(
                'Login with ${typeList[selectedIndex]}',
                style: TextStyle(
                  fontSize: 14,
                  fontVariations: const [FontVariation('wght', 400)],
                  color: BrandColors.greyColor,
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
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "999 999 999 1",
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
                      ],
                    ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () async {
                  if (selectedIndex == 0) {
                    if (phoneController.text.trim().length != 10) {
                      Fluttertoast.showToast(
                          msg: 'Please enter a valid number');
                      return;
                    }

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          const ProgressDailog(status: 'Validating...'),
                    );
                    bool userExists = await UserServices.checkUserExists(
                        "${phoneController.text.trim()}@gmail.com");
                    if (userExists) {
                      await AuthService.authWithPhone(
                          context,
                          phoneController.text.trim(),
                          true,
                          {
                            "email": "${phoneController.text.trim()}@gmail.com",
                          },
                          "+91");
                    } else {
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: 'Please create account first');
                      return;
                    }
                  } else {
                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(emailController.text.trim())) {
                      Fluttertoast.showToast(msg: 'Please enter a valid email');
                      return;
                    }

                    if (passwordController.text.trim().length < 6) {
                      Fluttertoast.showToast(
                          msg:
                              'Please enter password with length greater than 6');
                      return;
                    }
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          const ProgressDailog(status: 'Signing...'),
                    );
                    await AuthService.serverSignIn(emailController.text.trim(),
                        passwordController.text.trim(), context);
                  }
                  // bool userExists =
                  //     await UserServices.checkUserExists(emailController.text);

                  // showDialog(
                  //   context: context,
                  //   barrierDismissible: false,
                  //   builder: (context) =>
                  //       const ProgressDailog(status: 'Signing in...'),
                  // );
                  // if (userExists) {
                  //   await AuthService.serverSignIn(emailController.text.trim(),
                  //       passwordController.text.trim(), context);
                  // } else {
                  //   await AuthService.serverSignUp({
                  //     'first_name':
                  //         emailController.text.trim().split('@').first,
                  //     'email': emailController.text.trim(),
                  //     'password': passwordController.text.trim(),
                  //     'role': customerRole,
                  //     'auth_type': "email",
                  //   }, context);
                  // }
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         SizedBox(
              //           height: size.height / 25,
              //         ),
              //         Text(
              //           'OR LOGIN WITH',
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontVariations: const [FontVariation('wght', 400)],
              //             color: BrandColors.greyColor,
              //           ),
              //         ),
              //         SizedBox(
              //           height: size.height / 45,
              //         ),
              //         Row(
              //           children: [
              //             GestureDetector(
              //               onTap: () async {
              //                 await AuthService().signInWithGoogle(context);
              //                 // Fluttertoast.showToast(msg: 'Coming soon');
              //               },
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: BrandColors.greyColor1,
              //                   // color: Colors.red,
              //                   borderRadius: BorderRadius.circular(20),
              //                 ),
              //                 padding: const EdgeInsets.all(24),
              //                 child: Center(
              //                   child: Image.asset(
              //                     'assets/images/google.png',
              //                     height: 24,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: size.height / 50,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),

              SizedBox(
                width: size.width,
                height: size.height / 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
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
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
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
    );
  }
}
