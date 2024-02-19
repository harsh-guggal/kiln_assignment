// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guggal_social/screens/home/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guggal_social/screens/auth/login_screen.dart';
import 'package:guggal_social/screens/auth/otp_screen.dart';
import 'package:guggal_social/services/base_services.dart';
import 'package:guggal_social/services/user_services.dart';
import 'package:guggal_social/widgets/progress_dailog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guggal_social/models/user_model.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // sign in with phone number
  static Future authWithPhone(
      context, phoneNumber, isLogin, payload, code) async {
    print('------------------ auth with phone begins -----------------');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          //  const Center(
          //   child: CircularProgressIndicator(),
          // ),
          const ProgressDailog(status: 'Sending OTP...'),
    );
    TextEditingController pinController = TextEditingController(text: "");
    try {
      print('${code + phoneNumber}');
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: code + phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            if (kDebugMode) {
              print("verification completed");
            }
          },
          timeout: const Duration(seconds: 00),
          verificationFailed: (e) {
            // if (kDebugMode) {
            print("verification failed, ${e.toString()}");
            // }
            Fluttertoast.showToast(
                msg: 'Error occurred while accessing credentials. $e.');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          codeSent: ((String verificationId, int? resendToken) async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  pinController: pinController,
                  phoneNumber: phoneNumber,
                  onCompleted: () async {
                    print(
                        '------------------ on completed begins -----------------');
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    if (kDebugMode) {
                      print("Inputed Pin: ${pinController.text.trim()}");
                    }
                    if (pinController.text.trim().isEmpty ||
                        pinController.text.trim() == "") {
                      Fluttertoast.showToast(msg: 'Please enter a valid pin.');
                      Navigator.of(context).pop();
                    } else {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                          verificationId: verificationId,
                          smsCode: pinController.text.trim(),
                        );
                        UserCredential result = await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        if (kDebugMode) {
                          print("result: ${result.user!.uid}");
                        }
                        if (isLogin) {
                          await serverSignIn('$phoneNumber@gmail.com',
                              result.user!.uid, context);
                        } else {
                          payload['password'] = result.user!.uid;
                          print('before signup-------------->');
                          print(payload);
                          await serverSignUp(payload, context);
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'invalid-verification-code') {
                          // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text(
                          //       'Invalid OTP',
                          //     ),
                          //   ),
                          // );
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              elevation: 6,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.red,
                              content: const Center(
                                child: Text(
                                  'Invalid OTP',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        } else if (e.code == 'invalid-credential') {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Error occurred while accessing credentials. Try again.',
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Error occurred while accessing credentials. Try again.',
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      }
                    }
                  },
                ),
              ),
            );
          }),
          codeAutoRetrievalTimeout: (String verificationId) {
            // Fluttertoast.showToast(msg: "OTP Timed Out");
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'The account already exists with a different credential',
            ),
          ),
        );
      } else if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Error occurred while accessing credentials. Try again.',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Error occurred while accessing credentials. Try again.',
            ),
          ),
        );
      }
    }
  }

  static Future<void> serverSignIn(email, password, context) async {
    try {
      var resp = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/auth/login",
        method: 'POST',
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      if (resp.statusCode == 200) {
        var data = jsonDecode(resp.body);
        if (kDebugMode) {
          print("data: $data");
        }
        UserModel? user = await UserServices.fetchUserByEmail(email);
        BaseService.saveToken(
          data['data']['access_token'],
          data['data']['refresh_token'],
          user!.toJson(),
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
        Fluttertoast.showToast(
            msg: "Sign In Failed, User Doesn't Exists, Please Sign Up!");

        // msg: "Wrong email or password"
        // );
      }
    } catch (e) {
      if (kDebugMode) {
        print("error: $e");
      }
      return;
    }
  }

  static Future<void> serverSignUp(payload, context) async {
    try {
      var resp = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/users",
        method: 'POST',
        body: jsonEncode(payload),
      );
      if (resp.statusCode == 200) {
        var data = jsonDecode(resp.body);
        if (kDebugMode) {
          print("data: $data");
        }
        await serverSignIn(payload['email'], payload['password'], context);
      } else {
        print(resp.body);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
        Fluttertoast.showToast(msg: "Sign Up Failed, Please Try Again!");
      }
    } catch (e) {
      if (kDebugMode) {
        print("error: $e");
      }
      return;
    }
  }

  static Future<void>? logOut(context) {
    SharedPreferences.getInstance().then((value) {
      value.setBool("isLogin", false);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false);
    });
    FirebaseAuth.instance.signOut();
    return null;
  }
}
