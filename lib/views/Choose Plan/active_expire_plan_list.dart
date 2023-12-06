import 'package:flutter/material.dart';
import 'package:relationshipsincorporated/theme/common_app_bar.dart';

import '../../theme/app_common_color.dart';

class ActiveExpirePlanList extends StatelessWidget {
  const ActiveExpirePlanList({super.key});

  final double widgetGap = 10;

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 55,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Subscription",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/notification');
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Active",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                    color: Color(AppCommonColor.appMainColor),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Advance plan",
                                            style: TextStyle(
                                              color: Color(
                                                AppCommonColor.whiteColor,
                                              ),
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text("\$40 / 3 month",
                                              style: TextStyle(
                                                color: Color(
                                                  AppCommonColor.whiteColor,
                                                ),
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              backgroundColor: Color(
                                                AppCommonColor.whiteColor,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              'Expired on 23 aug',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: widgetGap,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Expired Subscription",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                    color: Color(AppCommonColor.textFieldBG),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Advance plan",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("\$40 / 3 month",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              backgroundColor: Color(
                                                AppCommonColor.appMainColor,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              '   Expired   ',
                                              style: TextStyle(
                                                color: Color(
                                                    AppCommonColor.whiteColor),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
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
