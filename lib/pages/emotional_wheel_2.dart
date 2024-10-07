import 'dart:convert';

import 'package:dostx/em_wheel_emotions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import '../config.dart';
import '../globals.dart';
import 'package:http/http.dart' as http;

import '../palette.dart';
import 'package:flutter/material.dart';
import '../translations.dart';
import '../language_manager.dart';

class EmotionalWheel2 extends StatefulWidget {
  final Function(String, [bool]) updateSubPage;
  final Function() getPrevSubPage;
  const EmotionalWheel2({
    super.key,
    required this.updateSubPage,
    required this.getPrevSubPage
  });
  @override
  State<EmotionalWheel2> createState() => _EmotionalWheel2State();
}

class _EmotionalWheel2State extends State<EmotionalWheel2> {
  String? maritalStatus;
  String? relation;
  var embox = Hive.box('EmotionalWheelBox');
  String? emotion1;
  String? emotion2;
  String? emotion3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emotion1 = embox.get("primary_emotion");
    emotion2 = emotionMap[emotion1]!.keys.toList()[0];
    emotion3 = emotionMap[emotion1]![emotion2]!.toList()[0];
  }

  @override
  Widget build(BuildContext context) {
    //print(emotion1);
    //print(emotion2);
    //print(emotion3);

    double relFont = fontHelper(context);
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: screenHeight(context)*0.105,
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,

        backgroundColor:const Color(
          0xFFE5A194,
        ),
        title: Image.asset(
          'assets/image/logo.png',
          width: 98,
          // height: 27,
          // height: 80,
        ),

        leadingWidth: 100,
        leading:  Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
              child: SvgPicture.asset(
                'assets/svg/lang.svg',
                width: 41,
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Select Language'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text('English'),
                            onTap: () {
                              // Set English language
                              LanguageManager().setLanguage('en');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {

                              });
                            },
                          ),
                          ListTile(
                            title: const Text('Hindi'),
                            onTap: () {
                              // Set Hindi language
                              LanguageManager().setLanguage('hi');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {
                                // Update UI if necessary
                              });
                            },
                          ),
                          ListTile(
                            title: const Text('Marathi'),
                            onTap: () {
                              // Set Marathi language
                              LanguageManager().setLanguage('mr');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {
                                // Update UI if necessary
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.transparent,
                  shape: CircleBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/language_icon.svg',
                    width: 24,
                    height: 24,
                    color: Colors.black, // Optionally customize the color
                  ),
                ),
              ),
            ),
          ],
        ),

      ),

      backgroundColor: const Color(0xFFE5A194),
      body: Container(
        height: screenHeight(context),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30),
          ),
          color: ColorOptions.whitish,
        ),
        // physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          translations[LanguageManager().currentLanguage]!['emotional_wheel_form_title']!,
                          style: const TextStyle(
                            fontFamily: 'JostBold',
                            fontSize: 28,
                            color: Color(0xffE5A194),
                          ),
                        ),
                        SizedBox(height: (5/869)*screenHeight(context),),
                        Container(
                          width: 45,
                          height: 4,
                          decoration: BoxDecoration(
                            color: ColorOptions.skin,
                            border: Border.all(
                                color: ColorOptions.skin,
                                width: 1
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Text( translations[LanguageManager().currentLanguage]!['emotional_wheel_question_2']!,
                    style: TextStyle(
                      color: const Color(0xFFE5A194),
                      fontFamily: 'JostMedium',
                      fontSize: 14 * fontHelper(context),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    // width: 150,
                    decoration:  BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFDEDEDF),
                        width: 1,

                      ),
                    ),
                    child: DropdownButton<String>(

                      // itemHeight: 1000,
                      // menuMaxHeight: 300,
                      alignment: Alignment.center,
                      iconEnabledColor: const Color(0xFF4D4D4D),
                      elevation: 0,
                      // isExpanded: true, // Allow the dropdown to expand to fit the parent
                      underline: const SizedBox(), // Remove the default underline
                      value: emotion2,
                      iconSize: 25,
                      isDense: true,
                      style: TextStyle(
                          fontSize: relFont * 12.0,
                          fontFamily: 'SFProMedium',
                          color: const Color(0xFF606060),
                          letterSpacing: 1.1),
                      items: emotionMap[emotion1]!.keys.map<DropdownMenuItem<String>>(
                              (String value){
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Container(
                                width: 150,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Text(
                                    value,
                                  ),
                                ),
                              ),
                            );
                          }
                      ).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          emotion2 = value!;
                          emotion3 = emotionMap[emotion1]![emotion2]!.toList()[0];

                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 109,
                  ),
                  Text(
                    translations[LanguageManager().currentLanguage]!['emotional_wheel_question_3']!,
                    style: TextStyle(
                      color: const Color(0xFFE5A194),
                      fontFamily: 'JostMedium',
                      fontSize: 14 * fontHelper(context),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    // width: 150,
                    decoration:  BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFDEDEDF),
                        width: 1,

                      ),
                    ),
                    child: DropdownButton<String>(

                      // itemHeight: 1000,
                      // menuMaxHeight: 300,
                      alignment: Alignment.center,
                      iconEnabledColor: const Color(0xFF4D4D4D),
                      elevation: 0,
                      // isExpanded: true, // Allow the dropdown to expand to fit the parent
                      underline: const SizedBox(), // Remove the default underline
                      value: emotion3,
                      iconSize: 25,
                      isDense: true,
                      style: TextStyle(
                          fontSize: relFont * 12.0,
                          fontFamily: 'SFProMedium',
                          color: const Color(0xFF606060),
                          letterSpacing: 1.1),
                      items: emotionMap[emotion1]![emotion2]!.map<DropdownMenuItem<String>>(
                              (String value){
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Container(
                                width: 150,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Text(
                                    value,
                                  ),
                                ),
                              ),
                            );
                          }
                      ).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          emotion3 = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 200,),
                  Center(
                    child:
                    SizedBox(
                      height: (43/896)*screenHeight(context),
                      width: 261,
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
                          onPressed: () async {
                            var tokenBox = Hive.box("TokenBox");
                            await embox.put("inner_emotion",emotion2);
                            await embox.put("outer_emotion",emotion3);
                            var response = await http.post(
                                Uri.parse(appConfig["serverURL"]+'/api/em_test/'),
                                body: json.encode(  {
                                  "result": "$emotion1: $emotion2: $emotion3",
                                  "inner_wheel": emotion2,
                                  "outer_wheel": emotion3
                                }),
                                headers: {
                                  'Content-Type':'application/json',
                                  'Authorization':'Bearer ${await tokenBox.get('access_token')}'
                                }
                            );
                            if (response.statusCode == 201) widget.updateSubPage("default", true);
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           const SignUpSecond(),
                            //     ),
                            //   );
                          },
                          child: Text(
                            translations[LanguageManager()
                                .currentLanguage]!['submit']!,
                            style: TextStyle(
                              fontSize: 14*fontHelper(context),
                              fontFamily: "JostBold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
