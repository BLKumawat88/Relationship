import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';
import 'package:relationshipsincorporated/views/Dashboard/dashboard_screen.dart';

import '../../theme/common_dialog.dart';
import '../survey/servey_screen_after_login.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _selectedIndex = 0;

  final List _widgets = [
    DashBoardScreen(),
    SurveyScreenAfterLogin(),
    DashBoardScreen(),
    DashBoardScreen(),
  ];

  void _onItemTapped(int index) {
    CommonProvider provider = Provider.of(context, listen: false);
    setState(() {
      // _selectedIndex = index;
    });
    if (index == 0) {
    } else if (index == 1) {
      // setState(() {
      //   _selectedIndex = index;
      // });
      if (provider.isSurvey) {
        CommonCirculer.showErrorMessage(context, "Survey already taken");
      } else {
        provider.getServeyCategory(context, false);
      }

      // Navigator.pushNamed(context, '/start_servey');
    } else if (index == 2) {
      // setState(() {
      //   _selectedIndex = index;
      // });

      Map requestData = {
        "user_id": provider.userID,
        "month": provider.returnMonth(),
        "week": provider.returnweek()
      };
      provider.getSurveyHistoryData(context, requestData, true, false);
      // Navigator.pushNamed(context, '/survey_screen_after_login');
    } else if (index == 3) {
      provider.getUserProfile(context, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Home.png",
              width: 30,
              color: _selectedIndex == 0
                  ? Color(
                      AppCommonColor.appMainColor,
                    )
                  : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Survey.png",
              width: 26,
              color: _selectedIndex == 1
                  ? Color(
                      AppCommonColor.appMainColor,
                    )
                  : Colors.black,
            ),
            label: 'Survey',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/surveyhistoryicon.png",
              width: 30,
              color: Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Profileicon.png",
              width: 30,
              color: Colors.black,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
