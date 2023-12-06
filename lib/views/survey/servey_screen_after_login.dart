import 'package:flutter/material.dart';

import '../../theme/app_common_color.dart';

class SurveyScreenAfterLogin extends StatelessWidget {
  SurveyScreenAfterLogin({super.key});

  final double widgetGap = 10;

  final List categoryData = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Select categories data you are ",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'intersted ',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF26A19F)),
                ),
                TextSpan(
                  text: "in for survey",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...categoryData
                      .map(
                        (category) => Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    category['image'],
                                  ),
                                ),
                                title: Text(
                                  category['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    category['subtitle'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                trailing: Checkbox(
                                  value: true,
                                  activeColor:
                                      Color(AppCommonColor.appMainColor),
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/servey_screen');
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
                  'Start Survey',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(AppCommonColor.whiteColor)),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
