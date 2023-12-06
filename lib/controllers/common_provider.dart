import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/services.dart';
import '../theme/common_dialog.dart';

class CommonProvider with ChangeNotifier {
  int userID = 0;

  String userName = "";
  String userImage = "";
  String userEmailId = "";
  String partner_name = "";
  String fcmToken = "";

  //To save password
  String userEmail = "";
  String userPassword = "";

  dynamic selectedMonthValueForSurveyCommentSection = "";
  dynamic selectedWeekValueForSurveryCommnetSecton = "";
  List<LineChartBarData> lineChartBarData = [];

  Map signUpData = {
    "username": "",
    "email": "",
    "password": "",
    "phone": "",
    "gender": ""
  };

  Future<void> userLogin(Map loginUser, context) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);

        var result = await APICall.postRequest("/login", loginUser, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          userID = result['data']['user_id'];

          Map userInfo = {
            "user_id": userID,
            "email": loginUser['username'],
            "password": loginUser['password'],
            "is_save_user": loginUser['isUserSave'],
            "is_log_out": false
          };
          const storage = FlutterSecureStorage();
          final userDataLocal = json.encode(userInfo);
          await storage.write(key: 'relationshipIsLogin', value: userDataLocal);

          Navigator.of(context).pushNamedAndRemoveUntil(
              '/bottom_bar', (Route<dynamic> route) => false);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  String userOtp = "0000";
  Future<void> sendOTP(context) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result = await APICall.postRequest("/register_otp", signUpData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          userOtp = result['data']['otp'];
          log("result $userOtp");
          Navigator.pushNamed(context, "/otp_verification");
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  String storeEmailOfForgotPasswordForGenerateNewPss = "";
  Future<void> sendOTPForForgotPassword(context, requestData) async {
    storeEmailOfForgotPasswordForGenerateNewPss = requestData['email'];
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result =
            await APICall.postRequest("/reset_pass_otp", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          userOtp = result['data']['otp'];
          log("result $userOtp");
          Navigator.pushNamed(context, "/forgot_pass_otp");
          CommonCirculer.showErrorMessage(context, result['message']);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> chnagePassword(context, requestData) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result = await APICall.postRequest("/reset_pass", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/getStarted', (Route<dynamic> route) => false);
          CommonCirculer.showErrorMessage(context, result['message']);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> registerUser(context) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);

        var result = await APICall.postRequest("/register", signUpData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          Navigator.pop(context);
          Navigator.pop(context);
          CommonCirculer.showErrorMessage(context, result['message']);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> invitePartner(context, requestData) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);

        var result =
            await APICall.postRequest("/invite_partner", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          Navigator.pop(context);
          CommonCirculer.showErrorMessage(context, result['message']);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> submitSurvey(context, requestData) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);

        var result = await APICall.postRequest("/save_survay", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/bottom_bar', (Route<dynamic> route) => false);
          CommonCirculer.showErrorMessage(context, result['message']);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Map userProfileInfo = {
    "username": "",
    "email": "",
    "gender": "",
    "phone": "",
    "avatar": ""
  };

  Future<void> getUserProfile(context, screenPopStatus) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result =
            await APICall.postRequest("/get_profile", {"user_id": userID}, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          if (screenPopStatus) {
            CommonCirculer.hideLoading(context);
          }
          userProfileInfo['username'] = result['data']['username'];
          userProfileInfo['email'] = result['data']['email'];
          userProfileInfo['gender'] = result['data']['gender'];
          userProfileInfo['phone'] = result['data']['phone'];
          userProfileInfo['avatar'] = result['data']['avatar'];
          Navigator.pushNamed(context, "/user_profile");
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> updateUserProfile(context, requestData) async {
    userProfileInfo['user_id'] = userID;
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result =
            await APICall.postRequest("/update_profile", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          isLoading = true;
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/bottom_bar', (Route<dynamic> route) => false);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> updateUserProfileImage(context, requestData) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result =
            await APICall.postRequest("/update_avatar", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          CommonCirculer.hideLoading(context);
          userProfileInfo['avatar'] = result['data']['avatar'];
          userImage = result['data']['avatar'];
          notifyListeners();
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  List surveyHistoryData = [];
  Future<void> getSurveyHistoryData(
      context, requestData, routingStatus, sideBarcloseStatus) async {
    log("request data $requestData");
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result =
            await APICall.postRequest("/survay_history", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          surveyHistoryData = result['data'];
          if (sideBarcloseStatus) {
            CommonCirculer.hideLoading(context);
          }
          if (routingStatus) {
            Navigator.pushNamed(context, '/survey_history');
          } else {
            notifyListeners();
          }
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  List serveyCategoryList = [];
  Future<void> getServeyCategory(context, screenPopStatus) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result = await APICall.getRequest("/survay_categories", '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          if (screenPopStatus) {
            CommonCirculer.hideLoading(context);
          }
          serveyCategoryList = result['data'];
          Navigator.pushNamed(context, '/start_servey');
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Map contactUsInfo = {};
  Future<void> getContactDetails(context) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result = await APICall.getRequest("/contact_details", '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          CommonCirculer.hideLoading(context);
          contactUsInfo = result['data'];
          Navigator.pushNamed(context, '/contact_us');
          print(result);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  List notificationList = [];
  Future<void> getNotification(context) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result = await APICall.postRequest(
            "/get_notification", {"user_id": userID}, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          notificationList = result['data'];
          Navigator.pushNamed(context, '/notification');
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> getNotificationStatusForHomeScreenNotificationIcon(
      context) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        var result = await APICall.postRequest(
            "/get_notification", {"user_id": userID}, '');

        if (result["status_code"] == 200) {
          notificationList = result['data'];
          notifyListeners();
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> submitContextUsQuery(context, requiredData) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result =
            await APICall.postRequest("/submit_query", requiredData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          CommonCirculer.hideLoading(context);
          CommonCirculer.showErrorMessage(context, result['message']);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  List commentList = [];
  dynamic tremIdForFutureUse = "";
  Future<void> getComment(context, requestData, routingStatus) async {
    print("requestData data $requestData");
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result = await APICall.postRequest("/get_comment", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          commentList = result['data'];

          if (routingStatus) {
            Navigator.pushNamed(context, "/view_comments");
          } else {
            notifyListeners();
          }
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> commentRead(context, requestData) async {
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        var result =
            await APICall.postRequest("/comment_read", requestData, '');

        if (result["status_code"] == 200) {}
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  List survayQuizHistoryList = [];
  Future<void> getSurvayQuizHistory(context, requestData) async {
    print(requestData);
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result =
            await APICall.postRequest("/survay_quiz_history", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          survayQuizHistoryList = result['data'];
          Navigator.pushNamed(context, "/view_details");
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<void> addComment(context, requestData) async {
    print(requestData);
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result =
            await APICall.postRequest("/create_comment", requestData, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          getComment(
              context,
              {
                "user_id": userID,
                "month": selectedMonthValueForSurveyCommentSection,
                "week": selectedWeekValueForSurveryCommnetSecton,
                "term_id": tremIdForFutureUse
              },
              false);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  List serveyQuestionList = [];
  Future<void> getServeyQuestionList(context) async {
    serveyQuestionList.clear();
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result = await APICall.getRequest("/survay_question", '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          serveyQuestionList.addAll(result['data']);
          notifyListeners();
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  bool isLoading = true;
  bool isSurvey = false;
  List categoryForHomeScreen = [];
  Future<void> getHomeScreenData(context, requestData) async {
    lineChartBarData.clear();
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        var result = await APICall.postRequest("/get_home", requestData, '');

        if (result["status_code"] == 200) {
          userName = result['data']['username'];
          userImage = result['data']['avatar'];
          userEmailId = result['data']['email'];
          partner_name = result['data']['partner_name'];
          isSurvey = result['data']['is_survay'];
          categoryForHomeScreen = result['data']['categories'];

          List<FlSpot> userFirstData = [];

          List<FlSpot> userSecondData = [
            // FlSpot(1, 2),
            // FlSpot(2, 4),
            // FlSpot(3, 6),
            // FlSpot(4, 4),
            // FlSpot(5, 3),
            // FlSpot(6, 2),
            // FlSpot(7, 1),
            // FlSpot(8, 1),
          ];

          List userFirstDummy = [];
          List usersecondDummy = [];
          userFirstDummy = result['data']['graph_data'][0]['parent_user'];
          usersecondDummy = result['data']['graph_data'][0]['partner_user'];

          for (int i = 0; i < userFirstDummy.length; i++) {
            print(userFirstDummy[i]['position']);
            userFirstData.add(FlSpot(userFirstDummy[i]['position'].toDouble(),
                userFirstDummy[i]['rating'].toDouble()));
          }

          for (int i = 0; i < usersecondDummy.length; i++) {
            print(usersecondDummy[i]['position']);
            userSecondData.add(FlSpot(usersecondDummy[i]['position'].toDouble(),
                usersecondDummy[i]['rating'].toDouble()));
          }
          lineChartBarData.add(
            LineChartBarData(
              color: Colors.green,
              // colors: lineColor,
              isCurved: true,
              spots: userFirstData,
            ),
          );
          if (usersecondDummy.isNotEmpty) {
            lineChartBarData.add(LineChartBarData(
                color: Colors.pink,
                // colors: lineColor,
                isCurved: true,
                spots: userSecondData));
          }
          isLoading = false;
          notifyListeners();
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }

  Future<bool> checkInternetAvailableOrNot() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  int returnweek() {
    int currentWeek = DateTime.now().day;
    if (currentWeek <= 7) {
      return 1;
    } else if (currentWeek <= 14) {
      return 2;
    } else if (currentWeek <= 21) {
      return 3;
    } else if (currentWeek <= 28) {
      return 4;
    } else if (currentWeek > 28) {
      return 5;
    } else {
      return 1;
    }
  }

  int returnMonth() {
    return DateTime.now().month;
  }

  logout(context) async {
    const storage = FlutterSecureStorage();
    final readDta = await storage.read(key: 'relationshipIsLogin');
    if (readDta != null) {
      final userInfo = json.decode(readDta);
      Map userInfo1 = {
        "user_id": userInfo['user_id'],
        "email": userInfo['email'],
        "password": userInfo['password'],
        "is_save_user": userInfo['is_save_user'],
        "is_log_out": true
      };
      userEmail = userInfo['email'];
      userPassword = userInfo['password'];
      await storage.delete(key: 'relationshipIsLogin');
      final userDataLocal = json.encode(userInfo1);
      await storage.write(key: 'relationshipIsLogin', value: userDataLocal);

      isLoading = true;
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/getStarted', (Route<dynamic> route) => false);
    }
  }

  isUserLogin() async {
    const storage = FlutterSecureStorage();
    final readDta = await storage.read(key: 'relationshipIsLogin');
    if (readDta != null) {
      final userInfo = json.decode(readDta);
      userID = userInfo['user_id'];
      if (userInfo['is_log_out']) {
        if (userInfo['is_save_user']) {
          userEmail = userInfo['email'];
          userPassword = userInfo['password'];
          return false;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  deleteAccount(context) async {
    print(userID);
    if (!await checkInternetAvailableOrNot()) {
      CommonCirculer.showErrorMessage(context, "No Internet Connection");
      return;
    } else {
      try {
        CommonCirculer.showProgressIndicator(context);
        var result = await APICall.postRequest(
            "/delete_account", {"user_id": userID}, '');
        CommonCirculer.hideLoading(context);
        if (result["status_code"] == 200) {
          const storage = FlutterSecureStorage();
          await storage.delete(key: 'relationshipIsLogin');
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/getStarted', (Route<dynamic> route) => false);
        }
        if (result["status_code"] == 400) {
          CommonCirculer.showErrorMessage(context, result['message']);
        }
      } catch (error) {
        CommonCirculer.showErrorMessage(context, error);
      }
    }
  }
}
