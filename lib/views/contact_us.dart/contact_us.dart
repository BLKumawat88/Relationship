import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/common_dialog.dart';

import '../../theme/app_common_color.dart';
import '../../theme/common_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final TextEditingController query = TextEditingController();

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
                "Contact Us",
                context,
              ),
              Expanded(
                child: Consumer<CommonProvider>(
                  builder: (context, value, child) => Container(
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
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Drop us a Question",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            // Text(
                            //   "(${provider.contactUsInfo['address']})",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       fontSize: 13, fontWeight: FontWeight.w600),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: query,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFE7F5F4),
                                  hintText: "Type your question here*",
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
                                  return "Required Email Address";
                                }

                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                print("Data Des ${query.text}");

                                if (query.text == "") {
                                  CommonCirculer.showErrorMessage(
                                      context, "Message Required");
                                } else {
                                  Map requestData = {
                                    "user_id": provider.userID,
                                    "query": query.text
                                  };
                                  provider.submitContextUsQuery(
                                      context, requestData);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(AppCommonColor.appMainColor),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 55,
                                child: Center(
                                    child: Text(
                                  'Submit Question',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color(AppCommonColor.whiteColor)),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Contact Details",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(
                                              AppCommonColor.appMainColor),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Address",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${provider.contactUsInfo['address']}",
                                              style: TextStyle(
                                                color: Color(AppCommonColor
                                                    .appMainColor),
                                              ),
                                            ),
                                            Text(
                                              "${provider.contactUsInfo['address2']}",
                                              style: TextStyle(
                                                color: Color(AppCommonColor
                                                    .appMainColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Color(
                                              AppCommonColor.appMainColor),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Have Any Questions?",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${provider.contactUsInfo['phone']}",
                                              style: TextStyle(
                                                color: Color(AppCommonColor
                                                    .appMainColor),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.mail_rounded,
                                          color: Color(
                                              AppCommonColor.appMainColor),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mail Us",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${provider.contactUsInfo['email']}",
                                              style: TextStyle(
                                                color: Color(AppCommonColor
                                                    .appMainColor),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
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
