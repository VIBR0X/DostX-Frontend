import 'package:dostx/custom_widgets.dart';
import 'package:dostx/pages/familyburden.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../translations.dart';
import '../language_manager.dart';
import '../globals.dart ';


class FamilyBurdenScalePage extends StatefulWidget {
  final Function(String, [bool]) updateSubPage;
  final Function() getPrevSubPage;
  const FamilyBurdenScalePage({
    super.key,
    required this.updateSubPage,
    required this.getPrevSubPage
  });
  @override
  State<FamilyBurdenScalePage> createState() => _FamilyBurdenScalePageState();
}

class _FamilyBurdenScalePageState extends State<FamilyBurdenScalePage> {
  @override
  Widget build(BuildContext context) {final fontSize =(screenHeight(context)/896)*13;
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        color: ColorOptions.skin,
      ),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [ 
            Image.asset(
              "assets/image/02-square.png",
              // height: 0.33 * screenHeight(context),
              width: screenWidth(context),
            ),
            Column(
              children: [
                Container(
                  height: 0.36 * screenHeight(context),
                  color: Colors.transparent,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height -
                      (0.36) * screenHeight(context)-64,
                  decoration: const BoxDecoration(
                    color: ColorOptions.whitish,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30,),
                      topRight: Radius.circular(30,),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: (30/869)*screenHeight(context)),
                      Center(
                          child: Text(
                            translations[LanguageManager().currentLanguage]!['family_burden_scale_form_title']!,
                            style: TextStyle(
                              color: ColorOptions.skin,
                              fontFamily: 'JostBold',
                              fontSize: fontSize*2,
                            ),
                          )
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
                      SizedBox(height: (20/869)*screenHeight(context),),
                      SizedBox(
                        width: (345 / 414) * MediaQuery.of(context).size.width,
                        child: Text(
                          translations[LanguageManager().currentLanguage]!['family_burden_scale_intro']!,
                          style: TextStyle(
                            color: const Color(0xFF204267),
                            fontSize: fontHelper(context) * 13,
                            fontFamily: 'SFProMedium',
                            letterSpacing: 0.7,
                          ),
                        ),
                      ),
                      SizedBox(height: (35/869)*screenHeight(context),),
                      QuestionsWithThreeNumberedOptions(question: translations[LanguageManager().currentLanguage]!['family_burden_scale_question_1']!),
                      SizedBox(height: (25/869)*screenHeight(context),),
                      QuestionsWithThreeNumberedOptions(question: translations[LanguageManager().currentLanguage]!['family_burden_scale_question_2']!),
                      SizedBox(height: (15/869)*screenHeight(context),),
                      // QuestionsWithThreeNumberedOptions(question: translations[LanguageManager().currentLanguage]!['family_burden_scale_question_3']!),
                      SizedBox(height: (35/869)*screenHeight(context),),
                      SizedBox(
                        height:(43/869)*screenHeight(context),
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
                            onPressed: () {
                              widget.updateSubPage("family_burden_2");
                              //  Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>  familyBurden(),
                              //   ),
                              // );
                            },
                            child:  Text(
                              translations[LanguageManager().currentLanguage]!['proceed']!,
                              style: TextStyle(
                                fontSize:(fontSize/13)*14,
                                fontFamily: "JostBold",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 25, 0, 0),
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
                      padding: EdgeInsets.fromLTRB(18,25,0,0),
                      child: SvgPicture.asset(
                        'assets/icons/language_icon.svg',
                        width: 65,
                        height: 65,
                        // color: Colors.black, // Optionally customize the color
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    ),
  );
  }
}