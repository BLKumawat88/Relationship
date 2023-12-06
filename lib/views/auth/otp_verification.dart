import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';
import 'package:relationshipsincorporated/theme/common_dialog.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({
    super.key,
  });

  @override
  _OtpVerifyScreenState createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;

  String currentText = "";

  final formKey = GlobalKey<FormState>();

  Timer? _timer;

  int _secondsRemaining = 60;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();

    super.initState();

    startTimer();
  }

  @override
  void dispose() {
    errorController!.close();

    _timer?.cancel();

    super.dispose();
  }

  void getStartedOtp() {
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Color(AppCommonColor.whiteColor),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 90,
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFF7F7F9),
                        child: Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: Color(AppCommonColor.appMainColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/verify_otp_icon.png",
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          "OTP Verification",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Center(
                        child: Text(
                          "Please check your email to see the verification code",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF696969)),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text("OTP Code"),
                      const SizedBox(
                        height: 15,
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Color(AppCommonColor.appMainColor),
                                fontWeight: FontWeight.bold,
                              ),
                              textStyle: const TextStyle(color: Colors.black),
                              length: 4,
                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              validator: (v) {
                                return null;
                              },
                              pinTheme: PinTheme(
                                errorBorderColor: const Color(0xFFFF5A5F),
                                borderWidth: 1,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 55,
                                fieldWidth: 55,
                                activeFillColor:
                                    Color(AppCommonColor.textFieldBG),
                                selectedFillColor: const Color(0xFFF6F6F6),
                                inactiveColor: const Color(0xFFE6E6EB),
                                inactiveFillColor: const Color(0xFFF6F6F6),
                                selectedColor:
                                    Color(AppCommonColor.appMainColor),
                              ),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              keyboardType: TextInputType.number,
                              onCompleted: (v) {},
                              onChanged: (value) {
                                debugPrint(value);

                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                return true;
                              },
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          if (provider.userOtp == currentText) {
                            print("otp matched");
                            provider.registerUser(context);
                          } else {
                            CommonCirculer.showErrorMessage(
                                context, "OTP did not match");
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(AppCommonColor.appMainColor),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Verify',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(AppCommonColor.whiteColor)),
                            ),
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
      ),
    );
  }
}
