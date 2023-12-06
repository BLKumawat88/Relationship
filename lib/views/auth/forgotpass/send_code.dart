import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';

class SendCode extends StatefulWidget {
  const SendCode({super.key});

  @override
  State<SendCode> createState() => _SendCodeState();
}

Widget returnLabel(title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: AppCommonColor.fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextEditingController email = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _SendCodeState extends State<SendCode> {
  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 90,
                    padding:
                        const EdgeInsets.only(left: 00, top: 10, bottom: 10),
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
                    "Forgot Password",
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
                    "Please Enter Your Email address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF696969)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                returnLabel('Enter Your Email address'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE7F5F4),
                      hintText: "xyz@gmail.com",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFC8C8C8),
                      ),
                      enabledBorder: AuthCommonTheme.enabledBorder,
                      focusedBorder: AuthCommonTheme.focusedBorder,
                      errorBorder: AuthCommonTheme.errorBorder,
                      border: AuthCommonTheme.border),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required Your Email address";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Map requestData = {"email": email.text};
                      provider.sendOTPForForgotPassword(context, requestData);
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
                    )),
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

class AuthCommonTheme {
  static OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: Color(AppCommonColor.textFieldBG)),
      borderRadius: BorderRadius.circular(15));

  static OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: Color(AppCommonColor.textFieldBG)),
      borderRadius: BorderRadius.circular(15));

  static OutlineInputBorder border = OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: Color(AppCommonColor.textFieldBG)),
      borderRadius: BorderRadius.circular(15));

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: Color(AppCommonColor.textFieldBG)),
      borderRadius: BorderRadius.circular(15));
}
