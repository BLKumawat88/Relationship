import 'package:flutter/material.dart';
import 'package:relationshipsincorporated/theme/common_app_bar.dart';

import '../../theme/app_common_color.dart';

class ChoosePlanScreen extends StatelessWidget {
  const ChoosePlanScreen({super.key});

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
              CommonAppBar.returnAppBar("Choose Plan", context),
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
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(AppCommonColor.textFieldBG),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: widgetGap,
                                  ),
                                  const Text(
                                    'Why You purchase plan ?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: widgetGap,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color:
                                            Color(AppCommonColor.appMainColor),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        'Lorem lipsum simply dummy text',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: widgetGap,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color:
                                            Color(AppCommonColor.appMainColor),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        'Lorem lipsum simply dummy text',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: widgetGap,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color:
                                            Color(AppCommonColor.appMainColor),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        'Lorem lipsum simply dummy text',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: widgetGap,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color:
                                            Color(AppCommonColor.appMainColor),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        'Lorem lipsum simply dummy text',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text(
                                    'Basic plan',
                                    style: TextStyle(
                                        color:
                                            Color(AppCommonColor.appMainColor),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      '\$40 / 1 month',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  trailing: const CircleAvatar(
                                      backgroundColor: Color(0xFFE6E6E6),
                                      child: Icon(
                                          Icons.arrow_forward_ios_outlined)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: widgetGap,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/start_servey');
                              },
                              child: Card(
                                color: Color(AppCommonColor.appMainColor),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    title: Text(
                                      'Advance plan',
                                      style: TextStyle(
                                        color: Color(AppCommonColor.whiteColor),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        '\$40 / 1 month',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color(AppCommonColor.whiteColor),
                                        ),
                                      ),
                                    ),
                                    trailing: const CircleAvatar(
                                        backgroundColor: Color(0xFFE6E6E6),
                                        child: Icon(
                                            Icons.arrow_forward_ios_outlined)),
                                  ),
                                ),
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
