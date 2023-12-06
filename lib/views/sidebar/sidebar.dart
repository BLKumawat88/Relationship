import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';
import 'package:relationshipsincorporated/theme/common_dialog.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});

  final List menuItem = const [
    {
      "icon": "assets/images/Home.png",
      "title": "Home",
      "id": 1,
    },
    {
      "icon": "assets/images/Survey.png",
      "title": "Start New Survey",
      "id": 2,
    },
    {
      "icon": "assets/images/surveyhistoryicon.png",
      "title": "Survey History",
      "id": 6,
    },
    {
      "icon": "assets/images/Plans.png",
      "title": "Invite Partner",
      "id": 3,
    },
    {
      "icon": "assets/images/Profileicon.png",
      "title": "Profile",
      "id": 4,
    },
    {
      "icon": "assets/images/contactussidebaricon.png",
      "title": "Contact Us",
      "id": 7,
    },
    {
      "icon": "assets/images/Logout.png",
      "title": "Logout",
      "id": 5,
    },
    {
      "icon": "assets/images/Logout.png",
      "title": "Delete Account",
      "id": 8,
    },
  ];
  showAlertDialog(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Delete"),
      onPressed: () {
        provider.deleteAccount(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure?"),
      // content: Text(
      //     "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  provider.userImage,
                ),
              ),
              title: Text(
                provider.userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                provider.userEmailId,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...menuItem
                .map(
                  (menulist) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: menulist['id'] == 1
                            ? Color(AppCommonColor.appMainColor)
                            : Colors.transparent,
                      ),
                      child: ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -3),
                        onTap: () {
                          if (menulist['id'] == 1) {
                            Navigator.pop(context);
                          } else if (menulist['id'] == 2) {
                            // Navigator.pop(context);
                            if (provider.isSurvey) {
                              CommonCirculer.showErrorMessage(
                                  context, "Survey already taken");
                            } else {
                              provider.getServeyCategory(context, true);
                            }
                            // Navigator.pushNamed(context, '/start_servey');
                          } else if (menulist['id'] == 3) {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/invite_partner');
                          } else if (menulist['id'] == 4) {
                            // Navigator.pop(context);
                            provider.getUserProfile(context, true);
                            // Navigator.pushNamed(context, "/user_profile");
                          } else if (menulist['id'] == 5) {
                            // Navigator.pop(context);
                            provider.logout(context);
                            // Navigator.pushNamed(context, "/user_profile");
                          } else if (menulist['id'] == 6) {
                            Map requestData = {
                              "user_id": provider.userID,
                              "month": provider.returnMonth(),
                              "week": provider.returnweek()
                            };
                            provider.getSurveyHistoryData(
                                context, requestData, true, true);
                          } else if (menulist['id'] == 7) {
                            provider.getContactDetails(context);
                          } else if (menulist['id'] == 8) {
                            showAlertDialog(context);
                          }
                        },
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset(
                            menulist['icon'],
                            width: 25,
                            color: menulist['id'] == 1
                                ? Color(AppCommonColor.whiteColor)
                                : Colors.black,
                          ),
                        ),
                        title: Text(
                          menulist['title'],
                          style: TextStyle(
                              fontSize: AppCommonColor.fontSize,
                              color: menulist['id'] == 1
                                  ? Color(AppCommonColor.whiteColor)
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
