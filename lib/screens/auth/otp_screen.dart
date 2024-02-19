import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:guggal_social/utils/brand_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key,
      this.phoneNumber,
      this.pinController,
      required this.onCompleted});
  final String? phoneNumber;
  final TextEditingController? pinController;
  final VoidCallback onCompleted;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            color: BrandColors.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: size.width / 2.4,
                          height: 5,
                        ),
                      ],
                    ),

                    const SizedBox(height: 60),
                    const Text(
                      'Verification Code',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Please enter the 6 digit code sent to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.phoneNumber!,
                      // "9813433176",
                      style: TextStyle(
                        color: BrandColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),

                    // OTP Text Fields
                    const SizedBox(height: 60),
                  ],
                ),
              ),

              Pinput(
                length: 6,
                obscureText: false,
                controller: widget.pinController,
                autofillHints: const [AutofillHints.oneTimeCode],

                defaultPinTheme: PinTheme(
                  width: 55,
                  height: 55,
                  textStyle: TextStyle(
                      fontSize: 20,
                      color: BrandColors.primaryColor,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F2F2),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsRetrieverApi,
                // ignore: avoid_print
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  // bool userExists = await UserService.checkUserExists(
                  //     "${widget.phoneNumber}@dairy.com");
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                  // print(widget.phoneNumber);
                  // await AuthService.authWithPhone(
                  //     context, widget.phoneNumber, true, {});
                },
                child: Text(
                  'Retry Again?',
                  style: TextStyle(
                    color: BrandColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              // const Spacer(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  widget.onCompleted();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
            ],
          ),
        ),
      ),
    );
  }
}
