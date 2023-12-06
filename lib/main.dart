import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/views/Dashboard/dashboard_screen.dart';
import 'package:relationshipsincorporated/views/Notification/notification.dart';
import 'package:relationshipsincorporated/views/Profile/edit_profile.dart';
import 'package:relationshipsincorporated/views/Profile/user_profile.dart';
import 'package:relationshipsincorporated/views/auth/forgotpass/email_otp_varification.dart';
import 'package:relationshipsincorporated/views/auth/forgotpass/generate_new_pss.dart';
import 'package:relationshipsincorporated/views/auth/forgotpass/send_code.dart';
import 'package:relationshipsincorporated/views/auth/get_started.dart';
import 'package:relationshipsincorporated/views/auth/login_screen.dart';
import 'package:relationshipsincorporated/views/auth/otp_verification.dart';
import 'package:relationshipsincorporated/views/auth/sign_up.dart';
import 'package:relationshipsincorporated/views/bottombar/bottom_bar.dart';
import 'package:relationshipsincorporated/views/chat/user_chat.dart';
import 'package:relationshipsincorporated/views/contact_us.dart/contact_us.dart';
import 'package:relationshipsincorporated/views/survey/servey_screen.dart';
import 'package:relationshipsincorporated/views/survey/servey_screen_after_login.dart';
import 'package:relationshipsincorporated/views/survey/start_servey.dart';

import 'views/Choose Plan/active_expire_plan_list.dart';
import 'views/Choose Plan/choose_plan.dart';
import 'views/Dashboard/Survey History/survey_history.dart';
import 'views/Dashboard/Survey History/view_comment.dart';
import 'views/Dashboard/Survey History/view_details.dart';
import 'views/Invite Partner/invite_partner.dart';
import 'views/Is user Login/is_userLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommonProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Relationships Satisfaction',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        ),
        home: const IsUserLoggedInOrNot(),
        routes: {
          "/login": (context) => const LoginScreen(),
          "/getStarted": (context) => const GetStartedScreen(),
          "/forgotpassword": (context) => const SendCode(),
          "/signup": (context) => const SignUpScreen(),
          "/choose_plan": (context) => const ChoosePlanScreen(),
          "/start_servey": (context) => StartServey(),
          "/servey_screen": (context) => const ServeyScreen(),
          "/dashboard": (context) => DashBoardScreen(),
          "/user_chat": (context) => const UserChatScreen(),
          "/notification": (context) => const NotificationScreen(),
          "/active_expire_plan_list": (context) => const ActiveExpirePlanList(),
          "/user_profile": (context) => const UserProfile(),
          "/edit_profile": (context) => const EditUserProfile(),
          "/survey_screen_after_login": (context) => SurveyScreenAfterLogin(),
          "/bottom_bar": (context) => const AppBottomBar(),
          "/otp_verification": (context) => const OtpVerifyScreen(),
          "/generate_new_pass": (context) => const GenerateNewPassword(),
          "/survey_history": (context) => const SurveyHistoryScreen(),
          "/view_comments": (context) => ViewCommentScreen(),
          "/view_details": (context) => const ViewDetailsScreen(),
          "/invite_partner": (context) => const InvitePartner(),
          "/contact_us": (context) => ContactUsScreen(),
          "/forgot_pass_otp": (context) =>
              const EmailOTPVerificationForForgotPassword(),
        },
      ),
    );
  }
}
