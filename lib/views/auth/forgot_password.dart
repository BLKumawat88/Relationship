import 'package:flutter/material.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
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

bool _passwordVisible = false;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/applogo.png",
                      width: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Forgot Your password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Enter Your Deatils To Reset Your Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    returnLabel('Username'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: email,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFE7F5F4),
                                          hintText: "Username",
                                          hintStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFC8C8C8),
                                          ),
                                          enabledBorder:
                                              AuthCommonTheme.enabledBorder,
                                          focusedBorder:
                                              AuthCommonTheme.focusedBorder,
                                          errorBorder:
                                              AuthCommonTheme.errorBorder,
                                          border: AuthCommonTheme.border),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Required Username";
                                        }

                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/images/usercode.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                        ),
                                        Text(
                                          'Refresh Code',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(
                                                  AppCommonColor.appMainColor)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    returnLabel('Enter Code'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: password,
                                      obscureText: !_passwordVisible,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFFE7F5F4),
                                        hintText: "Enter Code",
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFC8C8C8),
                                        ),
                                        enabledBorder:
                                            AuthCommonTheme.enabledBorder,
                                        focusedBorder:
                                            AuthCommonTheme.focusedBorder,
                                        errorBorder:
                                            AuthCommonTheme.errorBorder,
                                        border: AuthCommonTheme.border,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Required Code";
                                        }

                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color(
                                              AppCommonColor.appMainColor),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Center(
                                            child: Text(
                                          'Continue',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color(
                                                  AppCommonColor.whiteColor)),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
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
