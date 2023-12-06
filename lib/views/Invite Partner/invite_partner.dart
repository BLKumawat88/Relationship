import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';
import 'package:relationshipsincorporated/theme/common_dialog.dart';

import '../../theme/common_app_bar.dart';

class InvitePartner extends StatefulWidget {
  const InvitePartner({super.key});

  @override
  State<InvitePartner> createState() => _InvitePartnerState();
}

class _InvitePartnerState extends State<InvitePartner> {
  TextEditingController emailID = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CommonProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/invitebg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonAppBar.returnAppBar(
                  "Invite Partner",
                  context,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Invite partner",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Please Enter Your Partner’s Email",
                            style: TextStyle(color: Color(0xFF707B81)),
                          ),
                          Text(
                            "for invitation",
                            style: TextStyle(color: Color(0xFF707B81)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Image.asset(
                            "assets/images/invitepartneicon.png",
                            width: 200,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DottedBorder(
                              color: Color(AppCommonColor.appMainColor),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(12),
                              padding: EdgeInsets.all(6),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: emailID,
                                          decoration: InputDecoration(
                                            hintText: "demo@Gmail.com",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          backgroundColor: Color(
                                            AppCommonColor.appMainColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (emailID.text == "") {
                                            CommonCirculer.showErrorMessage(
                                                context, "Required Email");
                                          } else {
                                            Map requestData = {
                                              "user_id": provider.userID,
                                              "email": emailID.text
                                            };
                                            provider.invitePartner(
                                                context, requestData);
                                          }
                                        },
                                        child: Text('Send'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
