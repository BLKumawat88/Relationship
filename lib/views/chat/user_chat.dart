import 'package:flutter/material.dart';

import '../../theme/app_common_color.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key});

  final List messages = const [
    {
      "messageContent": "Lorem Ipsum is simply dummy text",
      "messageType": "receiver"
    },
    {
      "messageContent": "Lorem Ipsum is simply dummy text ",
      "messageType": "sender"
    },
    {
      "messageContent": "Lorem Ipsum is simply dummy text",
      "messageType": "receiver"
    },
    {
      "messageContent": "Lorem Ipsum is simply dummy text ",
      "messageType": "sender"
    },
    {
      "messageContent": "Lorem Ipsum is simply dummy text",
      "messageType": "receiver"
    },
    {
      "messageContent": "Lorem Ipsum is simply dummy text ",
      "messageType": "sender"
    },
  ];

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
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Comment",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
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
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: const CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage("assets/images/emotional.png"),
                                ),
                                title: const Text(
                                  "Communication",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle:
                                    const Text("Lorem Ipsum is simply dummy"),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("You Rated"),
                                    Text(
                                      "10 / 2",
                                      style: TextStyle(
                                        color: Color(
                                          AppCommonColor.appMainColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: const Color.fromARGB(255, 220, 218, 218),
                                height: 1,
                              ),
                              ...messages
                                  .map(
                                    (msg) => Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Align(
                                        alignment:
                                            (msg['messageType'] == "receiver"
                                                ? Alignment.topLeft
                                                : Alignment.topRight),
                                        child: Container(
                                          width: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: (msg['messageType'] ==
                                                    "receiver"
                                                ? const Color(0xFFEFEFEF)
                                                : Color(AppCommonColor
                                                    .appMainColor)),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            msg['messageContent'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: msg['messageType'] ==
                                                      "receiver"
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Write your message",
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFFA1A1A1)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFA1A1A1),
                                width: 2.0,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: CircleAvatar(
                                backgroundColor:
                                    Color(AppCommonColor.appMainColor),
                                child: Icon(
                                  Icons.send,
                                  color: Color(AppCommonColor.whiteColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
