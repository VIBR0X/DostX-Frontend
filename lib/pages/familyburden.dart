import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../config.dart';
import '../globals.dart';
import 'family_burden_results_page.dart';
import '../palette.dart';
import '../custom_widgets.dart';
import 'package:flutter/material.dart';
import '../translations.dart';
import '../language_manager.dart';

class familyBurden extends StatefulWidget {
  final Function(String, [bool]) updateSubPage;
  final Function() getPrevSubPage;
  const familyBurden({
    super.key,
    required this.updateSubPage,
    required this.getPrevSubPage
  });
  @override
  State<familyBurden> createState() => _SignUpThirdState();
}

class _SignUpThirdState extends State<familyBurden> {
  String? maritalStatus;
  String? relation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(
        0xFFE5A194,
      ),
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
                      title: Text('Select Language'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('English'),
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
                            title: Text('Hindi'),
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
                            title: Text('Marathi'),
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
                decoration: ShapeDecoration(
                  color: Colors.transparent,
                  shape: CircleBorder(),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 0,
                  color: Colors.transparent,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorOptions.whitish,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30),
                    )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 29,
                      ),

                      FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]!['family_burden_scale_question_3']!,
                        fieldName: 'family_burden_scale_question_3',
                      ),
                       const SizedBox(
                        height: 14,
                      ),
                      FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'family_burden_scale_question_4']!,
                        fieldName: 'family_burden_scale_question_4',
                      ),

                      const SizedBox(
                        height: 14,
                      ),
                        FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'family_burden_scale_question_5']!,
                          fieldName: 'family_burden_scale_question_5',
                        ),
                      const SizedBox(
                        height: 14,
                      ),
                        FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'family_burden_scale_question_6']!,
                          fieldName: 'family_burden_scale_question_6',
                        ),
                      const SizedBox(
                        height: 14,
                      ),
                        FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'family_burden_scale_question_7']!,
                          fieldName: 'family_burden_scale_question_7',
                        ),
                      const SizedBox(
                        height: 14,
                      ),

                        FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'family_burden_scale_question_8']!,
                          fieldName: 'family_burden_scale_question_8',
                        ),
                      const SizedBox(
                        height: 14,
                      ),
                        FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'family_burden_scale_question_9']!,
                          fieldName: 'family_burden_scale_question_9',
                        ),
                      const SizedBox(
                        height: 14,
                      ),
                        FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'family_burden_scale_question_10']!,
                          fieldName: 'family_burden_scale_question_10',
                        ),
                      const SizedBox(
                        height: 14,
                      ),
                        FamilyBurdenQuestions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'family_burden_scale_question_11']!,
                          fieldName: 'family_burden_scale_question_11',
                        ),
                      const SizedBox(
                        height: 26,
                      ),
                      SizedBox(
                        height: 43,
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
                                    var familyBurdenBox = Hive.box('FamilyBurdenBox');
                                    var tokenBox = Hive.box('TokenBox');
                                    Map data = familyBurdenBox.toMap();
                                    var uri = Uri.parse(appConfig['serverURL'] + '/api/family_burden_scale/');
                                    final response = await http.post(
                                      uri,
                                      headers: {
                                        'Content-Type': 'application/json',
                                        'Authorization':'Bearer ' + await tokenBox.get("access_token")
                                      },
                                      body: json.encode(data),
                                    );
                                    if (response.statusCode ==201){
                                      // print(data);
                                      // print(response.body);
                                    widget.updateSubPage("family_burden_results", true);
                                    }
                                  },
                            child:  Text(
                              translations[LanguageManager().currentLanguage]![
                              'submit']!,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "JostBold",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
