import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';
import 'package:relationshipsincorporated/theme/common_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

Widget returnLabel(title) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: AppCommonColor.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        (title == "Phone Number" || title == "Gender") ? "" : "*",
        style: TextStyle(
          fontSize: AppCommonColor.fontSize,
          fontWeight: FontWeight.bold,
          color: Color(
            AppCommonColor.appMainColor,
          ),
        ),
      )
    ],
  );
}

bool _passwordVisible = false;
TextEditingController userName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController c_password = TextEditingController();
bool isPrivacyPolicyAccepted = false;

final _formKey = GlobalKey<FormState>();

List clientTypeList = [
  {'name': "Client 1", "value": "1"},
  {'name': "Ciient 2", "value": "2"},
];
String selectedClient = "1";
List genderType = [
  {'name': "Select Gender", "value": ""},
  {'name': "Male", "value": "male"},
  {'name': "Female", "value": "female"},
];
String selectedGander = "";

List stateList = [
  {'name': "RJ", "value": "1"},
  {'name': "DL", "value": "2"},
];
String selectedState = "1";

List howDidYouFind = [
  {'name': "Self", "value": "1"},
  {'name': "other", "value": "2"},
];
String selectedHowDidYouFind = "1";

double widgetHightGab = 10;

Future<void> _launchUrl() async {
  final Uri _url =
      Uri.parse('https://www.relationshipsincorporated.com/privacy-policy');
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime currentDate = DateTime.now();
  String? selectedDateForBackendDeveloper;
  datePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      // firstDate: DateTime(2022),
      firstDate: DateTime.now(),
      // firstDate: DateTime(2022, 9, 15),

      // lastDate: DateTime(3000),

      lastDate: DateTime(30000),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        currentDate = userSelectedDate;
        selectedDateForBackendDeveloper =
            "${currentDate.year}/${currentDate.month}/${currentDate.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
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
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(AppCommonColor.whiteColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                          'Sign Up',
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
                          'Let’s create your account',
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
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: widgetHightGab,
                                      ),
                                      SizedBox(
                                        height: widgetHightGab,
                                      ),
                                      returnLabel('Full Name'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: userName,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFE7F5F4),
                                          hintText: "User Name",
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
                                            return "Required Full Name";
                                          }

                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: widgetHightGab,
                                      ),
                                      returnLabel('Email'),
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
                                          border: AuthCommonTheme.border,
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Required Email";
                                          }

                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: widgetHightGab,
                                      ),
                                      returnLabel('Phone Number'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: phone,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFE7F5F4),
                                          hintText: "phone",
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
                                        // validator: (value) {
                                        //   if (value!.isEmpty) {
                                        //     return "Required Phone Number";
                                        //   }

                                        //   return null;
                                        // },
                                      ),
                                      SizedBox(
                                        height: widgetHightGab,
                                      ),
                                      returnLabel('Password'),
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
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                          filled: true,
                                          fillColor: const Color(0xFFE7F5F4),
                                          hintText: "Password",
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
                                            return "Required Password";
                                          }

                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: widgetHightGab,
                                      ),
                                      returnLabel('Confirm Password'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: c_password,
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
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                          filled: true,
                                          fillColor: const Color(0xFFE7F5F4),
                                          hintText: "Confirm Password",
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
                                            return "Required Confirm Password ";
                                          }

                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: widgetHightGab,
                                      ),
                                      returnLabel('Gender'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 60,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color:
                                              Color(AppCommonColor.textFieldBG),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 1,
                                            color: Color(
                                                AppCommonColor.textFieldBG),
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              alignment: Alignment.topLeft,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              dropdownColor: Colors.white,
                                              value: selectedGander,
                                              items: [
                                                ...genderType
                                                    .map(
                                                      (e) => DropdownMenuItem(
                                                        value: e['value'],
                                                        child: Text(
                                                          e['name'],
                                                        ),
                                                      ),
                                                    )
                                                    .toList()
                                              ],
                                              onChanged: (value) {
                                                setState(
                                                  () {
                                                    selectedGander =
                                                        value.toString();
                                                  },
                                                );
                                              }),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Theme(
                                            data: Theme.of(context).copyWith(
                                              unselectedWidgetColor: Color(
                                                AppCommonColor.appMainColor,
                                              ),
                                            ),
                                            child: Checkbox(
                                              activeColor: Color(
                                                  AppCommonColor.appMainColor),
                                              value: isPrivacyPolicyAccepted,
                                              onChanged: (value) {
                                                setState(() {
                                                  isPrivacyPolicyAccepted =
                                                      value!;
                                                });
                                              },
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: InkWell(
                                                onTap: () {
                                                  _launchUrl();
                                                },
                                                child: Text(
                                                  "Accept privacy policy",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize:
                                                        AppCommonColor.fontSize,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(
                                                      AppCommonColor
                                                          .appMainColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: widgetHightGab,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (password.text !=
                                                c_password.text) {
                                              CommonCirculer.showErrorMessage(
                                                  context,
                                                  "Password did not match");
                                            } else {
                                              provider.signUpData['username'] =
                                                  userName.text;
                                              provider.signUpData['email'] =
                                                  email.text;
                                              provider.signUpData['password'] =
                                                  password.text;
                                              provider.signUpData['phone'] =
                                                  phone.text;
                                              provider.signUpData['gender'] =
                                                  selectedGander;
                                              if (isPrivacyPolicyAccepted) {
                                                //provider.sendOTP(context);//uncomment when otp section  work
                                                provider.registerUser(context);
                                              } else {
                                                CommonCirculer.showErrorMessage(
                                                    context,
                                                    "Please Accept Privacy Policy");
                                              }
                                            }
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
                                              'Sign Up',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Color(AppCommonColor
                                                      .whiteColor)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
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
