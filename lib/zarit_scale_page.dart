import 'package:dostx/custom_widgets.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'consent_page.dart';
import 'translations.dart';
import 'language_manager.dart';
import 'globals.dart ';
class ZaritScalePage extends StatefulWidget {
  const ZaritScalePage({super.key});

  @override
  State<ZaritScalePage> createState() => _ZaritScalePageState();
}

class _ZaritScalePageState extends State<ZaritScalePage> {
  String? stressed;
  String? embarrassed;
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
          children: [ Column(
            children: [SizedBox(height: (15/896)* screenHeight(context,),),
              Center(
                child: SvgPicture.asset(
                  "assets/svg/grandfather.svg",
                  height: 0.3827232142857143 * screenHeight(context),
                ),),
            ],
          ),
            Column(
              children: [
                Container(
                  height: 0.3627232142857143 * screenHeight(context)-10,
                  color: Colors.transparent,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height -
                      (0.3627232142857143) * screenHeight(context)+10,
                  decoration: const BoxDecoration(
                    color: ColorOptions.whitish,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30,),
                      topRight: Radius.circular(30,),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: (22/869)*screenHeight(context)),
                      Center(
                        child: Text(
                          "Zarit Scale",
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
                      SizedBox(height: (15/869)*screenHeight(context),),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          translations[LanguageManager().currentLanguage]!['zarit_scale_intro_text']!,
                          style: TextStyle(
                            color: const Color(0xFF204267),
                            fontSize: fontSize * (14 / 13),
                            fontFamily: 'SFProText',
                            letterSpacing: 0.7,
                          ),
                        ),
                      ),
                      SizedBox(height: (25/869)*screenHeight(context),),
                      QuestionWithFiveOptionsSingleLine(question: translations[LanguageManager().currentLanguage]!['feel_stressed_about_responsibilities']!),
                      SizedBox(height: (15/869)*screenHeight(context),),
                      QuestionWithFiveOptionsSingleLine(question: translations[LanguageManager().currentLanguage]!['feel_embarrassed_of_relative_behavior']!),
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
          ],
        ),
      ),
    ),
  );
  }
}