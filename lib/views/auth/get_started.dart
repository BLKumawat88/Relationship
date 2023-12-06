import 'package:flutter/material.dart';

import '../../theme/app_common_color.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/getstarted.png'),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/login");
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
                  'Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(AppCommonColor.whiteColor)),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
