import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/common_dialog.dart';
import 'package:relationshipsincorporated/views/sidebar/sidebar.dart';

import '../../theme/app_common_color.dart';
import 'Chart/line_chart.dart';
import 'Chart/line_chart1.dart';
import 'chart_container.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List categoryData = const [
    {
      "image": "assets/images/categorycommunication.png",
      "title": "Communication",
      "subtitle": "Lorem Ipsum is simply dummy "
    },
    {
      "image": "assets/images/resolving.png",
      "title": "Resolving Conflict",
      "subtitle": "Lorem Ipsum is simply dummy "
    },
    {
      "image": "assets/images/affection.png",
      "title": "Affection",
      "subtitle": "Lorem Ipsum is simply dummy "
    },
    {
      "image": "assets/images/intative.png",
      "title": "Initiative",
      "subtitle": "Lorem Ipsum is simply dummy "
    },
    {
      "image": "assets/images/listing.png",
      "title": "Listening",
      "subtitle": "Lorem Ipsum is simply dummy "
    },
    {
      "image": "assets/images/plalyful.png",
      "title": "Playfulness",
      "subtitle": "Lorem Ipsum is simply dummy "
    },
    {
      "image": "assets/images/responsibility.png",
      "title": "Responsibility",
      "subtitle": "Lorem Ipsum is simply dummy "
    },
    {
      "image": "assets/images/emotional.png",
      "title": "Emotional Reactivity",
      "subtitle": "Lorem Ipsum is simply dummy "
    }
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isListEmpty = true;

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

  @override
  void initState() {
    CommonProvider provider = Provider.of(context, listen: false);
    // TODO: implement initState
    super.initState();
    Map requestData = {
      "user_id": provider.userID,
      "month": provider.returnMonth(),
      "week": provider.returnweek()
    };
    provider.getHomeScreenData(context, requestData);
    provider.getNotificationStatusForHomeScreenNotificationIcon(context);
  }

  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SidebarScreen(),
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
              SizedBox(
                height: 55,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        provider.getNotification(context);
                      },
                      child: Consumer<CommonProvider>(
                          builder: (context, value, child) => Stack(
                                children: <Widget>[
                                  Icon(
                                    Icons.notifications,
                                    color: Color(AppCommonColor.whiteColor),
                                  ),
                                  provider.notificationList.isNotEmpty
                                      ? Positioned(
                                          // draw a red marble
                                          top: 0.0,
                                          right: 2.0,
                                          child: Icon(Icons.brightness_1,
                                              size: 8.0,
                                              color: Colors.redAccent),
                                        )
                                      : SizedBox()
                                ],
                              )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Filters",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 35,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Color(AppCommonColor.whiteColor),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(
                                              AppCommonColor.appMainColor),
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            alignment: Alignment.topLeft,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                                  selectedMonth =
                                                      value.toString();
                                                });
                                              } else {
                                                setState(
                                                  () {
                                                    if (int.parse(value) >
                                                        DateTime.now().month) {
                                                      CommonCirculer
                                                          .showErrorMessage(
                                                              context,
                                                              "You can not apply this filter");
                                                      return;
                                                    }
                                                    selectedMonth =
                                                        value.toString();
                                                    Map requestData = {
                                                      "user_id":
                                                          provider.userID,
                                                      "month": selectedMonth,
                                                      "week": selectedWeek == ""
                                                          ? provider
                                                              .returnweek()
                                                          : selectedWeek
                                                    };
                                                    if (value != "") {
                                                      provider.isLoading = true;
                                                      provider
                                                          .getHomeScreenData(
                                                              context,
                                                              requestData);
                                                    }
                                                  },
                                                );
                                              }
                                            }),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 35,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Color(AppCommonColor.whiteColor),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          width: 1,
                                          color: Color(
                                              AppCommonColor.appMainColor),
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            alignment: Alignment.topLeft,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                                  selectedWeek =
                                                      value.toString();
                                                  Map requestData = {
                                                    "user_id": provider.userID,
                                                    "month": selectedMonth == ""
                                                        ? provider.returnMonth()
                                                        : selectedMonth,
                                                    "week": selectedWeek
                                                  };
                                                  if (value != "") {
                                                    provider.isLoading = true;
                                                    provider.getHomeScreenData(
                                                        context, requestData);
                                                  }
                                                },
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          provider.isLoading
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Color(AppCommonColor.appMainColor),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                      child: provider.isSurvey
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Card(
                                                  child: ChartContainer(
                                                    title: 'Bar Chart',
                                                    color:
                                                        const Color(0xffffffff),
                                                    chart: LineChartContent(),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                // Image.asset("assets/images/days.png"),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(provider.userName),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                // Image.asset("assets/images/days.png"),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.pink,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(provider.partner_name),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  "Categories",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                ...provider
                                                    .categoryForHomeScreen
                                                    .map(
                                                      (category) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 20),
                                                        child: Card(
                                                          elevation: 5,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                            child: ListTile(
                                                              onTap: () {
                                                                Map requestData =
                                                                    {
                                                                  "user_id":
                                                                      provider
                                                                          .userID,
                                                                  "month":
                                                                      category[
                                                                          'month'],
                                                                  "week":
                                                                      category[
                                                                          'week'],
                                                                  "term_id":
                                                                      category[
                                                                          'id']
                                                                };
                                                                provider.getSurvayQuizHistory(
                                                                    context,
                                                                    requestData);
                                                              },
                                                              leading:
                                                                  CircleAvatar(
                                                                radius: 30,
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                  category[
                                                                      'icon'],
                                                                ),
                                                              ),
                                                              title: Text(
                                                                category[
                                                                    'name'],
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              trailing: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    category[
                                                                            'is_notification'] =
                                                                        false;
                                                                  });
                                                                  Map requestData =
                                                                      {
                                                                    "user_id":
                                                                        provider
                                                                            .userID,
                                                                    "month":
                                                                        category[
                                                                            'month'],
                                                                    "week": category[
                                                                        'week'],
                                                                    "term_id":
                                                                        category[
                                                                            'id']
                                                                  };
                                                                  print(
                                                                      requestData);
                                                                  provider.tremIdForFutureUse =
                                                                      category[
                                                                          'id'];
                                                                  provider.selectedMonthValueForSurveyCommentSection =
                                                                      category[
                                                                          'month'];
                                                                  provider.selectedWeekValueForSurveryCommnetSecton =
                                                                      category[
                                                                          'week'];
                                                                  provider.getComment(
                                                                      context,
                                                                      requestData,
                                                                      true);
                                                                  provider.commentRead(
                                                                      context,
                                                                      requestData);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  width: 30,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        AppCommonColor
                                                                            .appMainColor),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        Stack(
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .notifications,
                                                                          color:
                                                                              Color(AppCommonColor.whiteColor),
                                                                        ),
                                                                        category['is_notification']
                                                                            ? Positioned(
                                                                                // draw a red marble
                                                                                top: 0.0,
                                                                                right: 2.0,
                                                                                child: Icon(Icons.brightness_1, size: 8.0, color: Colors.redAccent),
                                                                              )
                                                                            : SizedBox()
                                                                      ],
                                                                    ),
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
                                          : Column(
                                              children: [
                                                Card(
                                                  child: ChartContainer(
                                                    title: 'Bar Chart',
                                                    color:
                                                        const Color(0xffffffff),
                                                    chart: LineChart1Content(),
                                                  ),
                                                ),
                                                // Image.asset(
                                                //   "assets/images/emptydata.png",
                                                //   width: MediaQuery.of(context)
                                                //           .size
                                                //           .width /
                                                //       2,
                                                // ),
                                                // const SizedBox(
                                                //   height: 10,
                                                // ),
                                                // const Text(
                                                //   "You don’t have Any Survey List",
                                                //   style: TextStyle(
                                                //     fontWeight: FontWeight.bold,
                                                //     fontSize: 16,
                                                //   ),
                                                // ),
                                                // const SizedBox(
                                                //   height: 10,
                                                // ),
                                                // const Text(
                                                //   "Click on the survey button for Survey",
                                                //   style: TextStyle(
                                                //       color: Color(0xFF929292)),
                                                // ),
                                                // const SizedBox(
                                                //   height: 20,
                                                // ),

                                                SizedBox(
                                                  height: 50,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    provider.getServeyCategory(
                                                        context, false);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Color(
                                                          AppCommonColor
                                                              .appMainColor),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 50,
                                                    child: Center(
                                                        child: Text(
                                                      'Start Survey',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color: Color(
                                                              AppCommonColor
                                                                  .whiteColor)),
                                                    )),
                                                  ),
                                                )
                                              ],
                                            )),
                                ),
                        ],
                      ),
                    ),
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
