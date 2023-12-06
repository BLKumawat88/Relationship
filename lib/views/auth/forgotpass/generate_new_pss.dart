import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';
import 'package:relationshipsincorporated/theme/common_dialog.dart';

class GenerateNewPassword extends StatefulWidget {
  const GenerateNewPassword({super.key});

  @override
  State<GenerateNewPassword> createState() => _GenerateNewPasswordState();
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

TextEditingController password = TextEditingController();
TextEditingController confirmpass = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool _passwordVisible = false;

class _GenerateNewPasswordState extends State<GenerateNewPassword> {
  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                    height: 40,
                  ),
                  returnLabel('Enter New password'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: const Color(0xFFE7F5F4),
                        hintText: "* * * * * * * * *",
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
                        return "Required Password";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  returnLabel('Confirm password'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: confirmpass,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: const Color(0xFFE7F5F4),
                        hintText: "* * * * * * * * *",
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
                        return "Required Confirm Password ";
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
                        if (password.text != confirmpass.text) {
                          CommonCirculer.showErrorMessage(context,
                              "Confirm password did not match with password");
                        } else {
                          Map requestData = {
                            "email": provider
                                .storeEmailOfForgotPasswordForGenerateNewPss,
                            "password": password.text
                          };
                          provider.chnagePassword(context, requestData);
                          password.text = "";
                          confirmpass.text = "";
                        }
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
                        'Submit',
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
