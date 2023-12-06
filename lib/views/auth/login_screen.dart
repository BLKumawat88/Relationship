import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
// TextEditingController(text: "webnauticaldesigner@gmail.com");
  TextEditingController password = TextEditingController();
// TextEditingController(text: "123456");

  final _formKey1 = GlobalKey<FormState>();
  bool checkBox = false;
  @override
  void initState() {
    CommonProvider controller = Provider.of(context, listen: false);
    email.text = controller.userEmail;
    password.text = controller.userPassword;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CommonProvider controller = Provider.of(context, listen: false);
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
                          'Log in',
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
                          'Enter your email & password to login',
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
                          key: _formKey1,
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
                                    returnLabel('Email Address'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: email,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFE7F5F4),
                                          hintText: "Email",
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
                                          return "Required Email Address";
                                        }

                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    returnLabel('Password'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: password,
                                      obscureText: !_passwordVisible,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFFE7F5F4),
                                        hintText: "Password",
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFC8C8C8),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
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
                                          return "Required Password";
                                        }

                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                activeColor: Color(
                                                    AppCommonColor
                                                        .appMainColor),
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                value: checkBox,
                                                onChanged: (value) {
                                                  setState(() {
                                                    checkBox = value!;
                                                  });
                                                },
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'Save Login',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFF336666),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/forgotpassword');
                                          },
                                          child: Text(
                                            "Forgot Password",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF336666)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_formKey1.currentState!
                                            .validate()) {
                                          Map requestData = {
                                            "username": email.text,
                                            "password": password.text,
                                            "isUserSave": checkBox,
                                            "token": controller.fcmToken,
                                          };
                                          controller.userLogin(
                                              requestData, context);
                                        }
                                      },
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
                                          'Login',
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
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    returnLabel('New User?'),
                                    Text(
                                      ' Create Account',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color(AppCommonColor.appMainColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              )
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
