import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/controllers/common_provider.dart';

import '../../../theme/app_common_color.dart';
import '../../../theme/common_app_bar.dart';

class ViewDetailsScreen extends StatelessWidget {
  const ViewDetailsScreen({super.key});

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
              CommonAppBar.returnAppBar(
                "Details",
                context,
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
                    child: ListView(
                      children: [
                        ...provider.survayQuizHistoryList
                            .map(
                              (detailsdata) => ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                    detailsdata['image'],
                                  ),
                                ),
                                title: Text(
                                  detailsdata['term_name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(detailsdata['description']),
                              ),
                            )
                            .toList(),
                        ...provider.survayQuizHistoryList[0]['quiz']
                            .map(
                              (quizdata) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Card(
                                  elevation: 2,
                                  margin: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Que:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                              child: Text(
                                                  quizdata['question_title']),
                                            )
                                          ],
                                        ),
                                        ...quizdata['users']
                                            .map(
                                              (users) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFEBEBEB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          users['user_name'],
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFF77767E)),
                                                        ),
                                                        Text(
                                                            '${users['rating'].toString()}/${users['total'].toString()}'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
