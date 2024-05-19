import 'package:dostx/pages/cope.dart';
import 'package:dostx/custom_widgets.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../translations.dart';
import '../language_manager.dart';
import '../globals.dart ';


class BriefCopePage extends StatefulWidget {
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  const BriefCopePage({
    super.key,
    required this.updateSubPage, required this.getPrevSubPage
  });
  @override
  State<BriefCopePage> createState() => _BriefCopePageState();
}

class _BriefCopePageState extends State<BriefCopePage> {
  @override
  Widget build(BuildContext context) {final fontSize =(screenHeight(context)/896)*13;
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        color: ColorOptions.skin,
      ),
      child: Stack(
        children: [
          Image.asset(
            "assets/image/Image-12.png",
            // height: 0.33 * screenHeight(context),
            width: screenWidth(context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.e,
            children: [
              // Container(
              //   height: 0.33 * screenHeight(context),
              //   color: Colors.transparent,
              // ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height -
                    (0.33) * screenHeight(context),
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
                          translations[LanguageManager().currentLanguage]!['brief_cope_form_title']!,
                          style: TextStyle(
                            color: ColorOptions.skin,
                            fontFamily: 'JostBold',
                            fontSize: fontHelper(context) * 28,
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
                        translations[LanguageManager().currentLanguage]!['brief_cope_intro']!,
                        style: TextStyle(
                          color: const Color(0xFF204267),
                          fontSize: fontHelper(context) * 13,
                          fontFamily: 'SFProMedium',
                          letterSpacing: 0.7,
                        ),
                      ),
                    ),
                    SizedBox(height: (30/869)*screenHeight(context),),
                    QuestionsWithFourOptions4Lines(
                        question: translations[LanguageManager().currentLanguage]!['brief_cope_question_1']!,
                      textColor: ColorOptions.skin,
                    ),
                    SizedBox(height: (30/869)*screenHeight(context),),

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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>  CopePage(),
                            //   ),
                            // );
                            widget.updateSubPage("brief_cope_2");
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
  );
  }
}