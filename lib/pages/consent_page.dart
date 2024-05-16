import 'package:dostx/globals.dart%20';
import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../palette.dart';
import '../custom_widgets.dart';
import 'short12.dart';
import '../translations.dart';
import '../language_manager.dart';
import 'package:dostx/pages/home_page.dart';
class ConsentForm extends StatefulWidget {
  const ConsentForm({super.key});

  @override
  State<ConsentForm> createState() => _ConsentFormState();
}

class _ConsentFormState extends State<ConsentForm> {
  List<bool> isSelected = [false];
  String? consent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: GradientOptions.consentBackgroundGradient,
        ),
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.fromLTRB(0, 75, 0, 45),
              child: Center(
                child: Image.asset(
                    'assets/image/logo.png',
                  height: screenHeight(context)*0.06,
                )
              ),
            ),
            const Text(
              "Consent Form",
              style: TextStyle(
                fontFamily: 'JostBold',
                fontSize: 25,
                color: ColorOptions.skin,
              ),
            ),
            SizedBox(
              height: (10 / 896) * screenHeight(context),
            ),
            Container(
              width: 50,
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
              height: (20 / 896) * screenHeight(context),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20,),
                ),
              ),
              width: screenWidth(context) * 0.72,
              height: screenHeight(context) * 0.46,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translations[LanguageManager().currentLanguage]![
                            'consent_text']!,
                            style: TextStyle(
                              color: Color(
                                0xFF707070,
                              ),
                              fontSize: 10 * fontHelper(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: (25/896)*screenHeight(context),
            ),
            Center(
              child: SizedBox(
                width: 320,
                height: (31/896)*screenHeight(context),
                child: Row(children: [
                  CustomRadioButton(
                    font: 11*fontHelper(context),
                    color: ColorOptions.darkblue,
                    text:
                        translations[LanguageManager().currentLanguage]![
                            'accept_terms']!,
                    value:
                        'By accepting you are agreeing to all terms and conditions',
                    selected: isSelected[0],
                    onSelect: () {
                      setState(() {
                        isSelected[0] = !isSelected[0];
                        consent = isSelected[0] ? '1' : null;
                      });
                    },
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 40,
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
                  onPressed: () {
                    if(isSelected[0]){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );}
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

          ],
        ),
      ),
    );
  }
}
