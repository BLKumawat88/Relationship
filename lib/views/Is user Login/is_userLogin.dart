import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';

import '../auth/get_started.dart';
import '../bottombar/bottom_bar.dart';

class IsUserLoggedInOrNot extends StatefulWidget {
  const IsUserLoggedInOrNot({super.key});

  @override
  State<IsUserLoggedInOrNot> createState() => _IsUserLoggedInOrNotState();
}

class _IsUserLoggedInOrNotState extends State<IsUserLoggedInOrNot> {
  @override
  void initState() {
    firebaseNotification();
    // TODO: implement initState
    super.initState();
  }

  firebaseNotification() async {
    CommonProvider provider =
        Provider.of<CommonProvider>(context, listen: false);
    String deviceToken = await getDeviceToken();
    print("###### PRINT DEVICE TOKEN TO USE FOR PUSH NOTIFCIATION ######");
    print(deviceToken);
    provider.fcmToken = deviceToken;
    print("############################################################");

    // listen for user to click on notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      String? title = remoteMessage.notification!.title;
      String? description = remoteMessage.notification!.body;

      //im gonna have an alertdialog when clicking from push notification
      // Alert(
      //   context: context,
      //   type: AlertType.error,
      //   title: title, // title from push notification data
      //   desc: description, // description from push notifcation data
      //   buttons: [
      //     DialogButton(
      //       child: Text(
      //         "COOL",
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       ),
      //       onPressed: () => Navigator.pop(context),
      //       width: 120,
      //     )
      //   ],
      // ).show();
    });
  }

  Future getDeviceToken() async {
    //request user permission for push notification
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging _firebaseMessage = FirebaseMessaging.instance;
    String? deviceToken = await _firebaseMessage.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }

  @override
  Widget build(BuildContext context) {
    CommonProvider provider =
        Provider.of<CommonProvider>(context, listen: false);
    return FutureBuilder(
      future: provider.isUserLogin(),
      builder: (contect, authResult) {
        if (authResult.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Color(AppCommonColor.appMainColor),
            ),
          );
        } else {
          if (authResult.data == true) {
            return AppBottomBar();
          }
          return const GetStartedScreen();
        }
      },
    );
  }
}
