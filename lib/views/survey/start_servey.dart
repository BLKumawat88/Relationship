import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/common_provider.dart';
import '../../theme/app_common_color.dart';

class StartServey extends StatelessWidget {
  StartServey({super.key});

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
    CommonProvider commpnController = Provider.of(context, listen: false);

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(AppCommonColor.appMainColor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: " Survey",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' Categories ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF26A19F)),
                  ),
                  // TextSpan(
                  //   text: "in for survey",
                  //   style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  // )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Consumer<CommonProvider>(
                builder: (context, value, child) => Column(
                  children: [
                    ...commpnController.serveyCategoryList
                        .map(
                          (category) => Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 10, left: 10),
                            child: Card(
                              elevation: 2,
                              margin: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        category['icon'],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      category['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppCommonColor.fontSize,
                                      ),
                                    )
                                  ],
                                ),
                                // ListTile(
                                //   leading:
                                //   ,
                                //   title:
                                //   ,
                                //   subtitle: Padding(
                                //     padding: EdgeInsets.symmetric(vertical: 10),
                                //     child: Text(
                                //       category['description'],
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              )),
            ),
            Image.asset("assets/images/categorysureyins.png"),
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
      ),
    ));
  }
}
