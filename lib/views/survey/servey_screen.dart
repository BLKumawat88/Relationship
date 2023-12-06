import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationshipsincorporated/theme/common_app_bar.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../controllers/common_provider.dart';
import '../../theme/app_common_color.dart';

class ServeyScreen extends StatefulWidget {
  const ServeyScreen({super.key});

  @override
  State<ServeyScreen> createState() => _ServeyScreenState();
}

class _ServeyScreenState extends State<ServeyScreen> {
  final double widgetGap = 10;
  int pageStartingValue = 0;
  double _value = 5.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CommonProvider commpnController = Provider.of(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      commpnController.getServeyQuestionList(context);
    });
  }

  final List categoryData = [
    {
      "image": "assets/images/categorycommunication.png",
      "title": "Communication",
      "subtitle": "Lorem Ipsum is simply dummy"
    },
    {
      "image": "assets/images/resolving.png",
      "title": "Resolving Conflict",
      "subtitle": "Lorem Ipsum is simply dummy"
    },
    {
      "image": "assets/images/affection.png",
      "title": "Affection",
      "subtitle": "Lorem Ipsum is simply dummy"
    },
    {
      "image": "assets/images/intative.png",
      "title": "Initiative",
      "subtitle": "Lorem Ipsum is simply dummy"
    },
    {
      "image": "assets/images/listing.png",
      "title": "Listening",
      "subtitle": "Lorem Ipsum is simply dummy"
    },
    {
      "image": "assets/images/plalyful.png",
      "title": "Playfulness",
      "subtitle": "Lorem Ipsum is simply dummy"
    },
    {
      "image": "assets/images/responsibility.png",
      "title": "Responsibility",
      "subtitle": "Lorem Ipsum is simply dummy"
    },
    {
      "image": "assets/images/emotional.png",
      "title": "Emotional Reactivity",
      "subtitle": "Lorem Ipsum is simply dummy"
    }
  ];

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    CommonProvider commpnController = Provider.of(context, listen: false);
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
                "Survey",
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
                    child: Consumer<CommonProvider>(
                      builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          onPageChanged: (currentpage) {
                            setState(() {
                              pageStartingValue = currentpage;
                            });
                            print("Current page $currentpage");
                          },

                          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                          /// Use [Axis.vertical] to scroll vertically.
                          controller: controller,
                          children: <Widget>[
                            ...commpnController.serveyQuestionList
                                .map(
                                  (categoryData) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                              categoryData['icon'],
                                            ),
                                          ),
                                          title: Text(
                                            categoryData['name'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),

                                          // subtitle: Padding(
                                          //   padding: const EdgeInsets.symmetric(
                                          //       vertical: 10),
                                          //   child: Text(
                                          //     categoryData['description'],
                                          //     style: const TextStyle(
                                          //       fontWeight: FontWeight.bold,
                                          //     ),
                                          //   ),
                                          // ),
                                          trailing: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFF0BB16E)),
                                            child: const Text('Skip'),
                                            onPressed: () {
                                              controller.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 5),
                                                curve: Curves.easeIn,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ...categoryData['questions']
                                                  .map(
                                                    (questionData) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      child: Card(
                                                        elevation: 5,
                                                        margin: const EdgeInsets
                                                            .all(0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    const Text(
                                                                      "Que:       ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Flexible(
                                                                      child: Text(
                                                                          questionData[
                                                                              'name']),
                                                                    )
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    const Text(
                                                                      "Ans:",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          SfSlider(
                                                                        inactiveColor:
                                                                            Colors.green,
                                                                        activeColor:
                                                                            const Color(0xFFC12F27),
                                                                        min:
                                                                            0.0,
                                                                        max:
                                                                            10.0,
                                                                        value: questionData[
                                                                            'answer'],
                                                                        interval:
                                                                            1,
                                                                        showTicks:
                                                                            false,
                                                                        showLabels:
                                                                            true,
                                                                        enableTooltip:
                                                                            true,
                                                                        minorTicksPerInterval:
                                                                            0,
                                                                        stepSize:
                                                                            1.0,
                                                                        showDividers:
                                                                            false,
                                                                        onChanged:
                                                                            (dynamic
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            questionData['answer'] =
                                                                                value;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                              const Text(
                                                "Add a comment",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Card(
                                                color: const Color(0xFFF2F2F2),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    initialValue:
                                                        categoryData['comment'],
                                                    onChanged: (value) {
                                                      categoryData['comment'] =
                                                          value;
                                                    },
                                                    maxLines: 5, //or null
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    decoration:
                                                        const InputDecoration
                                                            .collapsed(
                                                      hintText: "Tell Us More",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          pageStartingValue > 0
                                              ? ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Color(
                                                          AppCommonColor
                                                              .appMainColor)),
                                                  onPressed: () {
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                    controller.previousPage(
                                                      duration: const Duration(
                                                          milliseconds: 5),
                                                      curve: Curves.easeIn,
                                                    );
                                                  },
                                                  child: const Text(
                                                      '     Prev    '),
                                                )
                                              : SizedBox(),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color(
                                                    AppCommonColor
                                                        .appMainColor)),
                                            onPressed: () {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                              if (pageStartingValue + 1 ==
                                                  commpnController
                                                      .serveyQuestionList
                                                      .length) {
                                                Map requestData = {
                                                  "user_id":
                                                      commpnController.userID,
                                                  "survay": commpnController
                                                      .serveyQuestionList
                                                };

                                                commpnController.submitSurvey(
                                                    context, requestData);
                                              } else {
                                                controller.nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 5),
                                                  curve: Curves.easeIn,
                                                );
                                              }
                                            },
                                            child: pageStartingValue + 1 ==
                                                    commpnController
                                                        .serveyQuestionList
                                                        .length
                                                ? const Text("  Finish  ")
                                                : const Text('     Next    '),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox? parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData? sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme!.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox!.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
