import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';

import '../../../theme/app_common_color.dart';
import '../../../theme/common_app_bar.dart';
import '../../../theme/common_dialog.dart';

class SurveyHistoryScreen extends StatefulWidget {
  const SurveyHistoryScreen({super.key});

  @override
  State<SurveyHistoryScreen> createState() => _SurveyHistoryScreenState();
}

List monthType = [
  {'name': "Month", "value": ""},
  {'name': "January", "value": "1"},
  {'name': "February", "value": "2"},
  {'name': "March", "value": "3"},
  {'name': "April", "value": "4"},
  {'name': "May", "value": "5"},
  {'name': "June", "value": "6"},
  {'name': "July", "value": "7"},
  {'name': "August", "value": "8"},
  {'name': "September", "value": "9"},
  {'name': "October", "value": "10"},
  {'name': "November", "value": "11"},
  {'name': "December", "value": "12"}
];
String selectedMonth = "";

List weekType = [
  {'name': "Week", "value": ""},
  {'name': "1", "value": "1"},
  {'name': "2", "value": "2"},
  {'name': "3", "value": "3"},
  {'name': "4", "value": "4"},
  {'name': "5", "value": "5"},
];
String selectedWeek = "";

class _SurveyHistoryScreenState extends State<SurveyHistoryScreen> {
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
                "Survey History",
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
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(AppCommonColor.whiteColor),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(AppCommonColor.appMainColor),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        alignment: Alignment.topLeft,
                                        borderRadius: BorderRadius.circular(8),
                                        dropdownColor: Colors.white,
                                        value: selectedMonth,
                                        items: [
                                          ...monthType
                                              .map(
                                                (e) => DropdownMenuItem(
                                                  value: e['value'],
                                                  child: Text(
                                                    e['name'],
                                                    style: TextStyle(
                                                      color: Color(
                                                        AppCommonColor
                                                            .appMainColor,
                                                      ),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList()
                                        ],
                                        onChanged: (dynamic value) {
                                          if (value == "") {
                                            setState(() {
                                              selectedMonth = value.toString();
                                            });
                                          } else {
                                            setState(
                                              () {
                                                if (int.parse(value) >
                                                    DateTime.now().month) {
                                                  CommonCirculer.showErrorMessage(
                                                      context,
                                                      "You can not apply this filter");
                                                  return;
                                                }
                                                selectedMonth =
                                                    value.toString();
                                                Map requestData = {
                                                  "user_id": provider.userID,
                                                  "month": selectedMonth,
                                                  "week": selectedWeek == ""
                                                      ? provider.returnweek()
                                                      : selectedWeek
                                                };
                                                provider.getSurveyHistoryData(
                                                    context,
                                                    requestData,
                                                    false,
                                                    false);
                                              },
                                            );
                                          }
                                        }),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                              ),
                              Expanded(
                                child: Container(
                                  height: 35,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(AppCommonColor.whiteColor),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(AppCommonColor.appMainColor),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        alignment: Alignment.topLeft,
                                        borderRadius: BorderRadius.circular(8),
                                        dropdownColor: Colors.white,
                                        value: selectedWeek,
                                        items: [
                                          ...weekType
                                              .map(
                                                (e) => DropdownMenuItem(
                                                  value: e['value'],
                                                  child: Text(
                                                    e['name'],
                                                    style: TextStyle(
                                                      color: Color(
                                                        AppCommonColor
                                                            .appMainColor,
                                                      ),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList()
                                        ],
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              if (selectedMonth == "") {
                                                CommonCirculer.showErrorMessage(
                                                    context,
                                                    "Please select month first");
                                                return;
                                              }
                                              selectedWeek = value.toString();
                                              Map requestData = {
                                                "user_id": provider.userID,
                                                "month": selectedMonth == ""
                                                    ? provider.returnMonth()
                                                    : selectedMonth,
                                                "week": selectedWeek
                                              };
                                              provider.getSurveyHistoryData(
                                                  context,
                                                  requestData,
                                                  false,
                                                  false);
                                            },
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...provider.surveyHistoryData
                            .map(
                              (historyData) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Card(
                                  elevation: 5,
                                  margin: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              historyData['image']),
                                        ),
                                        title: Text(
                                          historyData['term_name'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppCommonColor.fontSize,
                                          ),
                                        ),
                                        trailing: InkWell(
                                          onTap: () {
                                            Map requestData = {
                                              "user_id": provider.userID,
                                              "month": selectedMonth == ""
                                                  ? provider.returnMonth()
                                                  : selectedMonth,
                                              "week": selectedWeek == ""
                                                  ? provider.returnweek()
                                                  : selectedWeek,
                                              "term_id": historyData['term_id']
                                            };
                                            provider.getSurvayQuizHistory(
                                                context, requestData);
                                          },
                                          child: Text(
                                            'Survey \n Details',
                                            style: TextStyle(
                                              fontSize: AppCommonColor.fontSize,
                                              fontWeight: FontWeight.bold,
                                              color: Color(
                                                AppCommonColor.appMainColor,
                                              ),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      ...historyData['users']
                                          .map(
                                            (userData) => Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFEBEBEB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        userData['user_name'],
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xFF77767E)),
                                                      ),
                                                      Text(
                                                          '${userData['rating']}/${userData['total']}'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Map requestData = {
                                            "user_id": provider.userID,
                                            "month": selectedMonth == ""
                                                ? provider.returnMonth()
                                                : selectedMonth,
                                            "week": selectedWeek == ""
                                                ? provider.returnweek()
                                                : selectedWeek,
                                            "term_id": historyData['term_id']
                                          };
                                          provider.tremIdForFutureUse =
                                              historyData['term_id'];

                                          provider.selectedMonthValueForSurveyCommentSection =
                                              selectedMonth == ""
                                                  ? provider.returnMonth()
                                                  : selectedMonth;
                                          provider.selectedWeekValueForSurveryCommnetSecton =
                                              selectedWeek == ""
                                                  ? provider.returnweek()
                                                  : selectedWeek;
                                          provider.getComment(
                                              context, requestData, true);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(
                                                AppCommonColor.textFieldBG),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'View Comments',
                                                  style: TextStyle(
                                                      fontSize: AppCommonColor
                                                          .fontSize,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF606060),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
