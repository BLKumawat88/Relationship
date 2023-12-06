import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';

import '../../theme/app_common_color.dart';
import '../../theme/common_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final List categoryData = const [
    {
      "title": "Admin Replyed Your Commentn",
    },
    {
      "title": "Admin Replyed Your Comment",
    },
    {
      "title": "Admin Replyed Your Comment",
    },
    {
      "title": "Admin Replyed Your Comment",
    },
    {
      "title": "Admin Replyed Your Comment",
    },
    {
      "title": "Admin Replyed Your Comment",
    },
    {
      "title": "Admin Replyed Your Comment",
    },
  ];

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
                "Notification",
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
                        child: provider.notificationList.isNotEmpty
                            ? ListView(
                                children: [
                                  ...provider.notificationList
                                      .map(
                                        (category) => Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Card(
                                            elevation: 5,
                                            margin: const EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: ListTile(
                                                onTap: () {
                                                  Map requestData = {
                                                    "user_id": provider.userID,
                                                    "month": category['month'],
                                                    "week": category['week'],
                                                    "term_id":
                                                        category['term_id']
                                                  };
                                                  print(requestData);
                                                  provider.tremIdForFutureUse =
                                                      category['term_id'];
                                                  provider.selectedMonthValueForSurveyCommentSection =
                                                      category['month'];
                                                  provider.selectedWeekValueForSurveryCommnetSecton =
                                                      category['week'];
                                                  provider.getComment(context,
                                                      requestData, true);
                                                  provider.commentRead(
                                                      context, requestData);
                                                },
                                                title: Text(
                                                  category['comment'],
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                leading: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Color(AppCommonColor
                                                        .textFieldBG),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Center(
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.notifications,
                                                          color: Color(
                                                              AppCommonColor
                                                                  .appMainColor),
                                                        ),
                                                        Positioned(
                                                          // draw a red marble
                                                          top: 0.0,
                                                          right: 2.0,
                                                          child: Icon(
                                                              Icons
                                                                  .brightness_1,
                                                              size: 8.0,
                                                              color: Color(
                                                                  AppCommonColor
                                                                      .appMainColor)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ],
                              )
                            : Center(
                                child: Text(
                                  "No Result Found",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
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
