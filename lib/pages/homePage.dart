import 'package:dostx/language_manager.dart';
import 'package:dostx/globals.dart%20';
import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'package:dostx/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import '../config.dart';
import '../custom_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePageFirst extends StatefulWidget {
  final Function(int) updateHomeIndex;
  final Function() getPrevPageIndex;
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  final copingStrategies;
  const HomePageFirst({
    super.key,
    required this.updateHomeIndex,
    required this.getPrevPageIndex,
    required this.updateSubPage,
    required this.getPrevSubPage,
    required this.copingStrategies
  });
  @override
  State<HomePageFirst> createState() => _HomePageFirstState();
}

class _HomePageFirstState extends State<HomePageFirst> {
  List<bool> feelingSelection = [false, false, false, false];
  var copeBox = Hive.box('CopeStrategyStateManagementBox');
  var tokenBox = Hive.box('TokenBox');

  @override
  void initState() {
    // TODO: implement initState
    int initMood =  tokenBox.get('moodOfUser')??-1;
    if (initMood !=-1){
      feelingSelection[initMood] = true;
    }
    super.initState();
  }

  Widget _buildRescueSessions(BuildContext context, subPageArray) {
    return Container(
      height: 280 / 869 * screenHeight(context),
      child: RawScrollbar(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.copingStrategies.length,
          itemBuilder: (context, index) {
            return Container(
              width: 230 / 414 * screenWidth(context),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white, // Replace with your desired color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child:  Image.network(
                            appConfig["serverURL"]+'/'+widget.copingStrategies[index]['image'],
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset("assets/p1.png"
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        10 / 414 * screenWidth(context), 0, 0, 0),
                    child: Text(widget.copingStrategies[index]['title'],
                      style: TextStyle(
                          color: const Color(0xff323736),
                          fontFamily: "SFProMedium",
                          fontWeight: FontWeight.w200,
                          fontSize: 14 * fontHelper(context)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        10 / 414 * screenWidth(context), 0, 0, 0),
                    child: Text(
                      "${widget.copingStrategies[index]['expected_time_to_read']} mins read",
                      style: TextStyle(
                          color: const Color(0xff9FA4A4),
                          fontFamily: "SFProText",
                          fontSize: 12 * fontHelper(context)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth(context) * 70 / 414,
                        10 / 869 * screenHeight(context),
                        0,
                        0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: GradientOptions.signInGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 38 / 869 * screenHeight(context),
                        width: 150 / 414 * screenWidth(context),
                        child: SizedBox(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: GradientOptions.signInGradient,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: TextButton(
                              onPressed: ()async {
                                await copeBox.put('title',widget.copingStrategies[index]['title']);
                                await copeBox.put('imageUrl',widget.copingStrategies[index]['image']);
                                await copeBox.put('hi',widget.copingStrategies[index]['content_hindi']);
                                await copeBox.put('en',widget.copingStrategies[index]['content_english']);
                                await copeBox.put('mr',widget.copingStrategies[index]['content_marathi']);
                                widget.updateSubPage('individual_cope_strategy_page');
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                child: Text(
                                   translations[LanguageManager().currentLanguage]!['begin']!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "SFProText",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12 * fontHelper(context)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xffFFF2E3),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      17,
                      0, //screenHeight(context) * 20 / 869,
                      0,
                      screenHeight(context) * 30 / 869),
                  child: Text(
                    translations[LanguageManager().currentLanguage]!['title_feeling_text']!,
                    style: TextStyle(
                        fontSize: 20 * fontHelper(context),
                        fontFamily: 'SFProTextMedium',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF204267),
                        letterSpacing: 1.1),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          // feelingSelection=[false,false,false,false];
                          setState(() {
                            feelingSelection = [true, false, false, false];
                            tokenBox.put('moodOfUser',0);
                          });
                        },
                        child: SvgPicture.asset(
                          feelingSelection[0]
                              ? "assets/smiley-selected.svg"
                              : "assets/smiley-unselected.svg",
                          height: 67.26,
                          width: 67.26,
                        )),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          setState(() {
                            feelingSelection = [false, true, false, false];
                            tokenBox.put('moodOfUser',1);
                          });
                        },
                        child: SvgPicture.asset(
                          feelingSelection[1]
                              ? "assets/sad-selected.svg"
                              : "assets/sad-unselected.svg",
                          height: 67.26,
                          width: 67.26,
                        )),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          setState(() {
                            feelingSelection = [false, false, true, false];
                            tokenBox.put('moodOfUser',2);
                          });
                        },
                        child: SvgPicture.asset(
                          feelingSelection[2]
                              ? "assets/hooo-selected.svg"
                              : "assets/hooo-unselected.svg",
                          height: 67.26,
                          width: 67.26,
                        )),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          setState(() {
                            feelingSelection = [false, false, false, true];
                            tokenBox.put('moodOfUser',3);
                          });
                        },
                        child: SvgPicture.asset(
                          feelingSelection[3]
                              ? "assets/angry-selected.svg"
                              : "assets/angry-unselected.svg",
                          height: 67.26,
                          width: 67.26,
                        )),
                    const Spacer()
                  ],
                ),
                const SizedBox(height: 24)
              ],
            ),
          ),
          Container(
            color: const Color(0xFFF1F1F1),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: SizedBox(
                        height: screenHeight(context) * 89 / 869 + 18,
                        child: _buildHorizontalScrollSection(context)),
                  ),
                  SizedBox(height: screenHeight(context) * 30 / 869 - 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                        child: Text(
                          translations[LanguageManager().currentLanguage]!['rescue_sessions']!,
                          style: TextStyle(
                            fontSize: 16 * fontHelper(context),
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // Spacer(),
                      TextButton(
                          onPressed: () {
                            widget.updateHomeIndex(2);
                          },
                          child: Text(
                            translations[LanguageManager().currentLanguage]!['see_all']!,
                            style: TextStyle(
                              fontFamily: 'SFProText',
                              fontSize: 14 * fontHelper(context),
                              color: const Color(0xFF323736),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child:
                        _buildRescueSessions(context, ["cope_strategy_test"]),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(height: screenHeight(context) * 30 / 869 - 18),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          translations[LanguageManager().currentLanguage]!['form_screening']!,
                          style: TextStyle(
                            fontSize: 16 * fontHelper(context),
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ReusableTile(
                    title: translations[LanguageManager().currentLanguage]!['zarit_scale_form_title']!,
                    author: 'By Dr. Zarit',
                    testDate: '',
                    buttonText: translations[LanguageManager().currentLanguage]!['begin']!,
                    onPressed: () {
                      widget.updateSubPage("zarit_burden_results");
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //   builder: (context) =>  ZaritBurdenResultsPage(),
                      // ),
                      // );
                    },
                  ),
                  ReusableTile(
                    title: translations[LanguageManager().currentLanguage]!['emotional_wheel_results']!,
                    author: 'By Dr. Robert Plutchik',
                    testDate: '',
                    buttonText: translations[LanguageManager().currentLanguage]!['begin']!,
                    onPressed: () {
                      widget.updateSubPage("emotional_wheel_results");

                      //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>  EmotionalWheelResultsPage(),
                    //   ),
                    // );
                      },
                  ), ReusableTile(
                    title: translations[LanguageManager().currentLanguage]!['family_burden_scale_form_title']!,
                    author: 'By Dr. Pai and Dr. Kapur',
                    testDate: '',
                    buttonText: translations[LanguageManager().currentLanguage]!['begin']!,
                    onPressed: () {
                      widget.updateSubPage("family_burden_results");

                      //   Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>  FamilyBurdenResultsPage(),
                      //   ),
                      // );
                    },
                  ),
                  ReusableTile(
                    title: translations[LanguageManager().currentLanguage]!['brief_cope_form_title']!,
                    author: 'By Dr. Carver and Dr. Scheier',
                    testDate: '',
                    buttonText: translations[LanguageManager().currentLanguage]!['begin']!,
                    onPressed: () {
                      //   Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>  BriefCopeResultsPage(),
                      //   ),
                      // );
                      widget.updateSubPage("brief_cope_results");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalScrollSection(BuildContext context) {
    List<void Function(BuildContext)> routes = [
      (BuildContext context) {
        // Navigator.push(
        //     context,
        //   MaterialPageRoute(builder: (context) => const PsychoEducationPage())
        // );
        widget.updateSubPage("psycho_education");
      },
      (BuildContext context) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>  MedicalReminderPage(),
        //   ),
        // );
        widget.updateHomeIndex(3);
      },
      (BuildContext context) {
        Fluttertoast.showToast(
          msg: "Feature Coming Soon",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xAA444444),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      (BuildContext context) {
        widget.updateHomeIndex(1);
        widget.updateSubPage("cost_effectiveness_analysis");
      },
    ];

    return Container(
      // height: 100,

      decoration: BoxDecoration(
        // Change background color here
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RawScrollbar(
        thumbColor: const Color(0xff1A3858),
        thickness: 10,
        radius: const Radius.circular(10),
        child: ListView.builder(
          // padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: routes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => routes[index](context),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  width: screenWidth(context) * 89 / 414,
                  margin: EdgeInsets.fromLTRB(
                      0, 0, screenWidth(context) * 12 / 414, 0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff0000000A).withOpacity(0.01),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50 * screenHeight(context) / 869,
                          width: 50 * screenWidth(context) / 414,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, screenHeight(context) * 12 / 869, 0, 0),
                            child: index != 2
                                ? Image.asset(
                                    "assets/image/Icon$index.png",
                                    fit: BoxFit.contain,
                                  )
                                : SvgPicture.asset(
                                    "assets/svg/DocIcon.svg",
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context) * 5 / 869,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                  index == 0
                                      ? translations[LanguageManager().currentLanguage]!['psycho']!
                                      : index == 1
                                          ? translations[LanguageManager().currentLanguage]!['medicine']!
                                          : index == 2
                                              ? translations[LanguageManager().currentLanguage]!['doctor']!
                                              : index == 3
                                                  ? translations[LanguageManager().currentLanguage]!['financial']!
                                                  : '',
                                  style: TextStyle(
                                      color: const Color(0xff323736),
                                      fontFamily: "SFProText",
                                      fontSize: 10 * fontHelper(context))),
                              Text(
                                  index == 0
                                      ? translations[LanguageManager().currentLanguage]!['education']!
                                      : index == 1
                                          ? translations[LanguageManager().currentLanguage]!['reminder']!
                                          : index == 2
                                              ? translations[LanguageManager().currentLanguage]!['connect']!
                                              : index == 3
                                                  ? translations[LanguageManager().currentLanguage]!['coping']!
                                                  : '',
                                  style: TextStyle(
                                      color: const Color(0xff323736),
                                      fontFamily: "SFProText",
                                      fontSize: 10 * fontHelper(context))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//   Widget _buildRescueSessions() {
//     return Column(
//       children: List.generate(
//         3,
//             (index) => Container(
//           margin: EdgeInsets.symmetric(vertical: 10),
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.blue, // Replace with your desired color
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Text(
//             "Rescue Session $index",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

Widget _buildHistory(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 6, 0),
      child: ListView.builder(
        itemCount: 5, // Number of history cards to display
        itemBuilder: (context, index) {
          return _buildHistoryCard(
            'History ${index + 1}',
            "Dr ABC",
            "29 Aug 2022",
            () {
              // Handle tap action for history card
            },
          );
        },
      ),
    ),
  );
}

Widget _buildHistoryCard(
    String text, String doctor, String date, VoidCallback tap) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 14, fontFamily: 'SFProMedium'),
              ),
            ],
          ),
          Row(
            children: [
              Text(doctor,
                  style:
                      const TextStyle(fontSize: 14, fontFamily: 'SFProText')),
            ],
          ),
          Row(
            children: [
              Text(date,
                  style:
                      const TextStyle(fontSize: 14, fontFamily: 'SFProText')),
              const Spacer(),
              SizedBox(
                height: 43,
                width: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: GradientOptions.signInGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    onPressed: tap,
                    child: const Text(
                      "Check Result",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'SFProText'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
