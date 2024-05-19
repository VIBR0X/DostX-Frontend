import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../globals.dart ';
import '../palette.dart';
import '../custom_widgets.dart';
import 'sign_up_second_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';

class EmotionalWheel extends StatefulWidget {
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  const EmotionalWheel({
    super.key,
    required this.updateSubPage, required this.getPrevSubPage,
  });
  @override
  State<EmotionalWheel> createState() => _EmotionalWheelState();
}

class _EmotionalWheelState extends State<EmotionalWheel> {
  String? emotion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5A194) ,
      body: Container(
        decoration: const BoxDecoration(
          color: ColorOptions.skin,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [

              Column(
                children: [
                  SizedBox(height: (0.03+0.011)*screenHeight(context),),
                  Center(
                  child: Image.asset(
                    "assets/image/emo_wheel.png",
                    height: 0.40 * screenHeight(context),
                  ),),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 0.33 * screenHeight(context),
                    color: Colors.transparent,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height -
                        (0.33) * screenHeight(context)-64,
                    decoration: const BoxDecoration(
                      color: ColorOptions.whitish,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30,),
                        topRight: Radius.circular(30,),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                        height: 35,
                      ),
                        Text(
                          translations[LanguageManager().currentLanguage]!['emotional_wheel_form_title']!,
                        style: TextStyle(
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
                        SizedBox(
                          width: (345 / 414) * MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              // Additional text
                              Text(
                                translations[LanguageManager().currentLanguage]!['emotional_wheel_intro']!,
                                style: TextStyle(
                                  color: const Color(0xFF204267),
                                  fontSize: fontHelper(context) * 13,
                                  fontFamily: 'SFProMedium',
                                  letterSpacing: 0.7,
                                ),
                              ),
      
                              QuestionWithEmotions(question: translations[LanguageManager().currentLanguage]!['emotional_wheel_question_1']!,)
      
                            ],
                          ),
                        ),
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
                                widget.updateSubPage("emotional_wheel_2");
                              },
                              child:  Text(
                                translations[LanguageManager().currentLanguage]!['submit']!,
                                style: TextStyle(
                                  fontSize:(fontHelper(context)*14),
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
