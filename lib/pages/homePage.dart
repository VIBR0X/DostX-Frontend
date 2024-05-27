import 'package:dostx/language_manager.dart';
import 'package:dostx/pages/brief_cope_results_page.dart';
import 'package:dostx/pages/cost_effective_analysis_page.dart';
import 'package:dostx/pages/emothional_wheeel_reults.dart';
import 'package:dostx/pages/family_burden_results_page.dart';
import 'package:dostx/globals.dart%20';
import 'package:dostx/pages/psychoeducation_page.dart';
import 'package:dostx/pages/zarit_burden_results_page.dart';
import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'package:dostx/palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../custom_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'coping_strategy_about.dart';

class HomePageFirst extends StatefulWidget {
  final Function(int) updateHomeIndex;
  final Function() getPrevPageIndex;
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  const HomePageFirst({
    super.key,
    required this.updateHomeIndex,
    required this.getPrevPageIndex,
    required this.updateSubPage,
    required this.getPrevSubPage,
  });
  @override
  State<HomePageFirst> createState() => _HomePageFirstState();
}

class _HomePageFirstState extends State<HomePageFirst> {
  List<bool> feelingSelection = [false, false, false, false];
  Widget _buildRescueSessions(BuildContext context, subPageArray) {
    return Container(
      height: 280 / 869 * screenHeight(context),
      child: RawScrollbar(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
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
                          child: index == 0
                              ? Image.asset("assets/p1.png")
                              : Image.asset("assets/p2.png"),
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
                    child: Text(
                      index == 0
                          ? translations[LanguageManager().currentLanguage]![
                              'lets_breathe_easy']!
                          : "Grounding Technique",
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
                      index == 0 ? "Breath Work" : "Coping with Anxiety",
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
                              onPressed: () {
                                if (index == 0) {
                                  widget.updateSubPage(subPageArray[0]);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context)=>navigationPageArray[0])
                                  // );
                                }
                                if (index == 1) {}
                                if (index == 2) {}
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                child: Text(
                                  "BEGIN",
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
                    "How do you feel today?",
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
                          "Rescue Sessions",
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
                            'See All',
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
                          "Form Screening",
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
                    title: 'Zarit Scale',
                    author: 'By Dr. Someone Someone',
                    testDate: '29 Aug 2022',
                    buttonText: "Begin",
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
                    title: 'Emotional Wheel',
                    author: 'By Dr. Someone Someone',
                    testDate: '29 Aug 2022',
                    buttonText: "Begin",
                    onPressed: () {
                      widget.updateSubPage("emotional_wheel_results");

                      //   Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>  EmotionalWheelResultsPage(),
                      //   ),
                      // );
                    },
                  ),
                  ReusableTile(
                    title: 'Family Burden Scale',
                    author: 'By Dr. Someone Someone',
                    testDate: '29 Aug 2022',
                    buttonText: "Begin",
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
                    title: 'COPE Scale',
                    author: 'By Dr. Someone Someone',
                    testDate: '29 Aug 2022',
                    buttonText: "Begin",
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
                                      ? 'Psycho-'
                                      : index == 1
                                          ? 'Medicine'
                                          : index == 2
                                              ? 'Doctor'
                                              : index == 3
                                                  ? 'Financial'
                                                  : '',
                                  style: TextStyle(
                                      color: const Color(0xff323736),
                                      fontFamily: "SFProText",
                                      fontSize: 10 * fontHelper(context))),
                              Text(
                                  index == 0
                                      ? 'education'
                                      : index == 1
                                          ? 'Reminder'
                                          : index == 2
                                              ? 'Connect'
                                              : index == 3
                                                  ? 'Coping'
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
