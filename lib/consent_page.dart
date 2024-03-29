import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'palette.dart';
import 'custom_widgets.dart';
import 'short12.dart';
import 'translations.dart';
import 'language_manager.dart';
import 'package:dostx/home_page.dart';
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
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: GradientOptions.backgroundGradient,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Center(
                  child: Text(
                    "DostX",
                    style: TextStyle(
                      fontFamily: 'JostBold',
                      fontSize: 28,
                      color: ColorOptions.darkblue,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Center(
                  child: SizedBox(
                    height: 56,
                    child: Text(
                      "Consent Form",
                      style: TextStyle(
                        fontFamily: 'JostBold',
                        fontSize: 25,
                        color: ColorOptions.lightblue,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                height: 470,
                width: 286,
                child:  Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    translations[LanguageManager().currentLanguage]![
                        'consent_text']!,
                    style: TextStyle(
                      color: Color(
                        0xFF707070,
                      ),
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Center(
                child: SizedBox(
                  width: 320,
                  height: 31,
                  child: Row(children: [
                    CustomRadioButton(
                      font: 11,
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
                height: 8,
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
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
