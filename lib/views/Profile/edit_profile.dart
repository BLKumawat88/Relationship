import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/theme/common_app_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../controllers/common_provider.dart';
import '../../theme/app_common_color.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  Widget returnLabel(title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  bool _passwordVisible = false;

  TextEditingController fullname = TextEditingController();
  String image = "";
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    CommonProvider provider = Provider.of(context, listen: false);
    // TODO: implement initState
    super.initState();

    fullname.text = provider.userProfileInfo['username'];
    phonenumber.text = provider.userProfileInfo['phone'];
    email.text = provider.userProfileInfo['email'];
    image = provider.userProfileInfo['avatar'];
    selectedGander = provider.userProfileInfo['gender'];
  }

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
  String selectedGander = "male";

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
        print("Date $selectedDateForBackendDeveloper");
      });
    }
  }

  final PageController controller = PageController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      body: Container(
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
              CommonAppBar.returnAppBar(
                "Profile",
                context,
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
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(image),
                              radius: 50,
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // returnLabel('Choose Client Type *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // Container(
                                //   width: MediaQuery.of(context).size.width,
                                //   height: 60,
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10),
                                //   decoration: BoxDecoration(
                                //     color: Color(AppCommonColor.textFieldBG),
                                //     borderRadius: BorderRadius.circular(15),
                                //     border: Border.all(
                                //       width: 1,
                                //       color: Color(AppCommonColor.textFieldBG),
                                //     ),
                                //   ),
                                //   child: DropdownButtonHideUnderline(
                                //     child: DropdownButton(
                                //         alignment: Alignment.topLeft,
                                //         borderRadius: BorderRadius.circular(8),
                                //         dropdownColor: Colors.white,
                                //         value: selectedClient,
                                //         items: [
                                //           // const DropdownMenuItem(
                                //           //   value: '',
                                //           //   child: Text(
                                //           //     'Business Type ',
                                //           //     style: TextStyle(color: Color(0xFF83CA13)),
                                //           //   ),
                                //           // ),
                                //           ...clientTypeList
                                //               .map(
                                //                 (e) => DropdownMenuItem(
                                //                   value: e['value'],
                                //                   child: Text(
                                //                     e['name'],
                                //                   ),
                                //                 ),
                                //               )
                                //               .toList()
                                //         ],
                                //         onChanged: (value) {
                                //           print(value);

                                //           setState(
                                //             () {
                                //               selectedClient = value.toString();
                                //             },
                                //           );
                                //         }),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('Leagal / First Name *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // TextFormField(
                                //   controller: email,
                                //   decoration: InputDecoration(
                                //       filled: true,
                                //       fillColor: const Color(0xFFE7F5F4),
                                //       hintStyle: const TextStyle(
                                //         fontSize: 14,
                                //         fontWeight: FontWeight.w400,
                                //         color: Color(0xFFC8C8C8),
                                //       ),
                                //       enabledBorder:
                                //           AuthCommonTheme.enabledBorder,
                                //       focusedBorder:
                                //           AuthCommonTheme.focusedBorder,
                                //       errorBorder: AuthCommonTheme.errorBorder,
                                //       border: AuthCommonTheme.border),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "Required Username";
                                //     }

                                //     return null;
                                //   },
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('Preferd First Name (Optional)'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // TextFormField(
                                //   controller: password,
                                //   obscureText: !_passwordVisible,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     fillColor: const Color(0xFFE7F5F4),
                                //     hintText: "Enter Code",
                                //     hintStyle: const TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color(0xFFC8C8C8),
                                //     ),
                                //     enabledBorder:
                                //         AuthCommonTheme.enabledBorder,
                                //     focusedBorder:
                                //         AuthCommonTheme.focusedBorder,
                                //     errorBorder: AuthCommonTheme.errorBorder,
                                //     border: AuthCommonTheme.border,
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "Required Code";
                                //     }

                                //     return null;
                                //   },
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('Date Of Birth *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // Container(
                                //   height: 60,
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10),
                                //   decoration: BoxDecoration(
                                //     color: Color(
                                //       AppCommonColor.textFieldBG,
                                //     ),
                                //     borderRadius: BorderRadius.circular(15),
                                //     border: Border.all(
                                //       width: 1,
                                //       color: Color(
                                //         AppCommonColor.textFieldBG,
                                //       ),
                                //     ),
                                //   ),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     children: [
                                //       Expanded(
                                //         child: Text(
                                //           "Date : ${currentDate.year}/${currentDate.month}/${currentDate.day}",
                                //           style: const TextStyle(fontSize: 18),
                                //           textAlign: TextAlign.start,
                                //         ),
                                //       ),
                                //       IconButton(
                                //           onPressed: () {
                                //             datePicker(context);
                                //           },
                                //           icon:
                                //               const Icon(Icons.arrow_drop_down))
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                SizedBox(
                                  height: widgetHightGab,
                                ),
                                returnLabel('Full Name *'),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: fullname,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFE7F5F4),
                                    hintText: "Full Name",
                                    hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFC8C8C8),
                                    ),
                                    enabledBorder:
                                        AuthCommonTheme.enabledBorder,
                                    focusedBorder:
                                        AuthCommonTheme.focusedBorder,
                                    errorBorder: AuthCommonTheme.errorBorder,
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
                                returnLabel('Gender'),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(AppCommonColor.textFieldBG),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(AppCommonColor.textFieldBG),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        alignment: Alignment.topLeft,
                                        borderRadius: BorderRadius.circular(8),
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
                                          print(value);

                                          setState(
                                            () {
                                              selectedGander = value.toString();
                                            },
                                          );
                                        }),
                                  ),
                                ),

                                SizedBox(
                                  height: widgetHightGab,
                                ),
                                returnLabel('Phone Number'),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: phonenumber,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFE7F5F4),
                                    hintText: "Phone Number",
                                    hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFC8C8C8),
                                    ),
                                    enabledBorder:
                                        AuthCommonTheme.enabledBorder,
                                    focusedBorder:
                                        AuthCommonTheme.focusedBorder,
                                    errorBorder: AuthCommonTheme.errorBorder,
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
                                returnLabel('Email *'),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: email,
                                  enabled: false,
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
                                    errorBorder: AuthCommonTheme.errorBorder,
                                    border: AuthCommonTheme.border,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required Email";
                                    }

                                    return null;
                                  },
                                ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('State *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // Container(
                                //   width: MediaQuery.of(context).size.width,
                                //   height: 60,
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10),
                                //   decoration: BoxDecoration(
                                //     color: Color(AppCommonColor.textFieldBG),
                                //     borderRadius: BorderRadius.circular(15),
                                //     border: Border.all(
                                //       width: 1,
                                //       color: Color(AppCommonColor.textFieldBG),
                                //     ),
                                //   ),
                                //   child: DropdownButtonHideUnderline(
                                //     child: DropdownButton(
                                //         alignment: Alignment.topLeft,
                                //         borderRadius: BorderRadius.circular(8),
                                //         dropdownColor: Colors.white,
                                //         value: selectedState,
                                //         items: [
                                //           // const DropdownMenuItem(
                                //           //   value: '',
                                //           //   child: Text(
                                //           //     'Business Type ',
                                //           //     style: TextStyle(color: Color(0xFF83CA13)),
                                //           //   ),
                                //           // ),
                                //           ...stateList
                                //               .map(
                                //                 (e) => DropdownMenuItem(
                                //                   value: e['value'],
                                //                   child: Text(
                                //                     e['name'],
                                //                   ),
                                //                 ),
                                //               )
                                //               .toList()
                                //         ],
                                //         onChanged: (value) {
                                //           print(value);

                                //           setState(
                                //             () {
                                //               selectedState = value.toString();
                                //             },
                                //           );
                                //         }),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('Zip Code'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // TextFormField(
                                //   controller: password,
                                //   obscureText: !_passwordVisible,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     fillColor: const Color(0xFFE7F5F4),
                                //     hintText: "Zip Code",
                                //     hintStyle: const TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color(0xFFC8C8C8),
                                //     ),
                                //     enabledBorder:
                                //         AuthCommonTheme.enabledBorder,
                                //     focusedBorder:
                                //         AuthCommonTheme.focusedBorder,
                                //     errorBorder: AuthCommonTheme.errorBorder,
                                //     border: AuthCommonTheme.border,
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "Required Code";
                                //     }

                                //     return null;
                                //   },
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('How Did You Find *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // Container(
                                //   width: MediaQuery.of(context).size.width,
                                //   height: 60,
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 10),
                                //   decoration: BoxDecoration(
                                //     color: Color(AppCommonColor.textFieldBG),
                                //     borderRadius: BorderRadius.circular(15),
                                //     border: Border.all(
                                //       width: 1,
                                //       color: Color(AppCommonColor.textFieldBG),
                                //     ),
                                //   ),
                                //   child: DropdownButtonHideUnderline(
                                //     child: DropdownButton(
                                //         alignment: Alignment.topLeft,
                                //         borderRadius: BorderRadius.circular(8),
                                //         dropdownColor: Colors.white,
                                //         value: selectedHowDidYouFind,
                                //         items: [
                                //           // const DropdownMenuItem(
                                //           //   value: '',
                                //           //   child: Text(
                                //           //     'Business Type ',
                                //           //     style: TextStyle(color: Color(0xFF83CA13)),
                                //           //   ),
                                //           // ),
                                //           ...howDidYouFind
                                //               .map(
                                //                 (e) => DropdownMenuItem(
                                //                   value: e['value'],
                                //                   child: Text(
                                //                     e['name'],
                                //                   ),
                                //                 ),
                                //               )
                                //               .toList()
                                //         ],
                                //         onChanged: (value) {
                                //           print(value);

                                //           setState(
                                //             () {
                                //               selectedHowDidYouFind =
                                //                   value.toString();
                                //             },
                                //           );
                                //         }),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel(
                                //     'Cell Phone Number * ( For Reminders)'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // TextFormField(
                                //   controller: password,
                                //   obscureText: !_passwordVisible,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     fillColor: const Color(0xFFE7F5F4),
                                //     hintText: "Cell Phone Number",
                                //     hintStyle: const TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color(0xFFC8C8C8),
                                //     ),
                                //     enabledBorder:
                                //         AuthCommonTheme.enabledBorder,
                                //     focusedBorder:
                                //         AuthCommonTheme.focusedBorder,
                                //     errorBorder: AuthCommonTheme.errorBorder,
                                //     border: AuthCommonTheme.border,
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "Required Code";
                                //     }

                                //     return null;
                                //   },
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('Email *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // TextFormField(
                                //   controller: password,
                                //   obscureText: !_passwordVisible,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     fillColor: const Color(0xFFE7F5F4),
                                //     hintText: "Email",
                                //     hintStyle: const TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color(0xFFC8C8C8),
                                //     ),
                                //     enabledBorder:
                                //         AuthCommonTheme.enabledBorder,
                                //     focusedBorder:
                                //         AuthCommonTheme.focusedBorder,
                                //     errorBorder: AuthCommonTheme.errorBorder,
                                //     border: AuthCommonTheme.border,
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "Required Code";
                                //     }

                                //     return null;
                                //   },
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // Text(
                                //   '( If client is a minor, the legal guardian must enter their email address below. )',
                                //   style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.bold,
                                //       color:
                                //           Color(AppCommonColor.appMainColor)),
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('Email *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // TextFormField(
                                //   controller: password,
                                //   obscureText: !_passwordVisible,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     fillColor: const Color(0xFFE7F5F4),
                                //     hintText: "Email",
                                //     hintStyle: const TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color(0xFFC8C8C8),
                                //     ),
                                //     enabledBorder:
                                //         AuthCommonTheme.enabledBorder,
                                //     focusedBorder:
                                //         AuthCommonTheme.focusedBorder,
                                //     errorBorder: AuthCommonTheme.errorBorder,
                                //     border: AuthCommonTheme.border,
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "Required Code";
                                //     }

                                //     return null;
                                //   },
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('Confirm Email *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // TextFormField(
                                //   controller: password,
                                //   obscureText: !_passwordVisible,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     fillColor: const Color(0xFFE7F5F4),
                                //     hintText: "Confirm Email",
                                //     hintStyle: const TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color(0xFFC8C8C8),
                                //     ),
                                //     enabledBorder:
                                //         AuthCommonTheme.enabledBorder,
                                //     focusedBorder:
                                //         AuthCommonTheme.focusedBorder,
                                //     errorBorder: AuthCommonTheme.errorBorder,
                                //     border: AuthCommonTheme.border,
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "Required Code";
                                //     }

                                //     return null;
                                //   },
                                // ),
                                // SizedBox(
                                //   height: widgetHightGab,
                                // ),
                                // returnLabel('User Name *'),
                                // const SizedBox(
                                //   height: 5,
                                // ),
                                // TextFormField(
                                //   controller: password,
                                //   obscureText: !_passwordVisible,
                                //   decoration: InputDecoration(
                                //     filled: true,
                                //     fillColor: const Color(0xFFE7F5F4),
                                //     hintText: "User Name",
                                //     hintStyle: const TextStyle(
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color(0xFFC8C8C8),
                                //     ),
                                //     enabledBorder:
                                //         AuthCommonTheme.enabledBorder,
                                //     focusedBorder:
                                //         AuthCommonTheme.focusedBorder,
                                //     errorBorder: AuthCommonTheme.errorBorder,
                                //     border: AuthCommonTheme.border,
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return "Required Code";
                                //     }
                                //     return null;
                                //   },
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      Map userProfileInfo = {
                                        "username": fullname.text,
                                        "email": email.text,
                                        "gender": selectedGander,
                                        "phone": phonenumber.text,
                                        "avatar": image,
                                        "user_id": provider.userID
                                      };

                                      provider.updateUserProfile(
                                          context, userProfileInfo);
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
                                        'Save Changes',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(
                                            AppCommonColor.whiteColor,
                                          ),
                                        ),
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
                        ],
                      )),
                ),
              )
            ],
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
