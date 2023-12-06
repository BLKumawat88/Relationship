import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/common_dialog.dart';

import '../../../theme/app_common_color.dart';
import '../../../theme/common_app_bar.dart';

class ViewCommentScreen extends StatefulWidget {
  ViewCommentScreen({super.key});

  @override
  State<ViewCommentScreen> createState() => _ViewCommentScreenState();
}

class _ViewCommentScreenState extends State<ViewCommentScreen> {
  final TextEditingController msg = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CommonProvider provider = Provider.of(context, listen: false);
    provider.getNotificationStatusForHomeScreenNotificationIcon(context);
  }

  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
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
                    Expanded(
                      child: Center(
                        child: Text(
                          "Comments",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Map requestData = {
                          "user_id": provider.userID,
                          "month": provider
                              .selectedMonthValueForSurveyCommentSection,
                          "week":
                              provider.selectedWeekValueForSurveryCommnetSecton,
                          "term_id": provider.tremIdForFutureUse
                        };

                        provider.getComment(context, requestData, false);
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: Color(AppCommonColor.whiteColor),
                      ),
                    )
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
                    child: Consumer<CommonProvider>(
                        builder: (context, value, child) => Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ...provider.commentList
                                            .map(
                                              (commentData) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 30,
                                                      backgroundImage:
                                                          NetworkImage(
                                                        commentData['avatar'],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            commentData[
                                                                'user_name'],
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xFF77767E)),
                                                          ),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          Text(
                                                            commentData[
                                                                'comment'],
                                                            style:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFF3A3A3A),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList()

                                        // Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Row(
                                        //     children: [
                                        //       Image.asset(
                                        //         "assets/images/listing.png",
                                        //         width: 40,
                                        //       ),
                                        //       SizedBox(
                                        //         width: 10,
                                        //       ),
                                        //       Flexible(
                                        //         child: Column(
                                        //           crossAxisAlignment:
                                        //               CrossAxisAlignment.start,
                                        //           children: [
                                        //             Text(
                                        //               "@admin",
                                        //               style: TextStyle(
                                        //                   color: Color(0xFF77767E)),
                                        //             ),
                                        //             SizedBox(
                                        //               height: 2,
                                        //             ),
                                        //             Text(
                                        //               'Whether you\'re in a new relationship or are a long-time couple',
                                        //               style: TextStyle(
                                        //                 color: Color(0xFF3A3A3A),
                                        //                 fontWeight: FontWeight.w500,
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Row(
                                        //     children: [
                                        //       Image.asset(
                                        //         "assets/images/profile.png",
                                        //         width: 40,
                                        //       ),
                                        //       SizedBox(
                                        //         width: 10,
                                        //       ),
                                        //       Flexible(
                                        //         child: Column(
                                        //           crossAxisAlignment:
                                        //               CrossAxisAlignment.start,
                                        //           children: [
                                        //             Text(
                                        //               "@robert",
                                        //               style: TextStyle(
                                        //                   color: Color(0xFF77767E)),
                                        //             ),
                                        //             SizedBox(
                                        //               height: 2,
                                        //             ),
                                        //             Text(
                                        //               'Whether you\'re in a new relationship or are a long-time couple',
                                        //               style: TextStyle(
                                        //                 color: Color(0xFF3A3A3A),
                                        //                 fontWeight: FontWeight.w500,
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  minLines:
                                      1, //Normal textInputField will be displayed
                                  maxLines: 4,
                                  controller: msg,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFEBEBEB),
                                    hintText: "@Your Reply",
                                    hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFC8C8C8),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.send,
                                        color:
                                            Color(AppCommonColor.appMainColor),
                                      ),
                                      onPressed: () {
                                        if (msg.text == "") {
                                          CommonCirculer.showErrorMessage(
                                              context, "Required Message");
                                        } else {
                                          Map requestData = {
                                            "user_id": provider.userID,
                                            "month": provider
                                                .selectedMonthValueForSurveyCommentSection,
                                            "week": provider
                                                .selectedWeekValueForSurveryCommnetSecton,
                                            "term_id":
                                                provider.tremIdForFutureUse,
                                            "comment": msg.text
                                          };
                                          provider.addComment(
                                              context, requestData);
                                          msg.text = "";
                                        }
                                      },
                                    ),
                                    enabledBorder:
                                        AuthCommonTheme.enabledBorder,
                                    focusedBorder:
                                        AuthCommonTheme.focusedBorder,
                                    errorBorder: AuthCommonTheme.errorBorder,
                                    border: AuthCommonTheme.border,
                                  ),
                                ),
                              ],
                            )),
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

class AuthCommonTheme {
  static OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color(0xFFEBEBEB)),
      borderRadius: BorderRadius.circular(5));

  static OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color(0xFFEBEBEB)),
      borderRadius: BorderRadius.circular(5));

  static OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color(0xFFEBEBEB)),
      borderRadius: BorderRadius.circular(5));

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color(0xFFEBEBEB)),
      borderRadius: BorderRadius.circular(5));
}
