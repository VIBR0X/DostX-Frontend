import 'package:flutter/material.dart';
import 'palette.dart';
import 'custom_widgets.dart';
import 'sign_up_second_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
class SignUpFirst extends StatefulWidget {
  const SignUpFirst({Key? key}) : super(key: key);

  @override
  State<SignUpFirst> createState() => _SignUpFirstState();
}

class _SignUpFirstState extends State<SignUpFirst> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: GradientOptions.backgroundGradient,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [Image.asset("assets/image/dostxbg2.png",fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
              Column(
                children: [
                  Container(
                    height: 380,
                    color: Colors.transparent,
                  ),
                  Container(
                    // color: Colors.amber,
                    width: double.infinity,

                    decoration: const BoxDecoration(
                      color: ColorOptions.skin,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          30,
                        ),
                        topRight: Radius.circular(
                          30,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                         Text(
                          translations[LanguageManager().currentLanguage]!['sign_up']!,
                          style: TextStyle(
                            fontFamily: 'JostBold',
                            fontSize: 28,
                            color: ColorOptions.darkblue,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         SizedBox(
                          width: 265.96,
                          height: 61,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager().currentLanguage]!['first_name']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JostMedium',
                                      fontSize: 13,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                height: 38,
                                child: TextField(
                                  inputFormatters: [],
                                  style: TextStyle(
                                    color: Color(
                                      0xFF707070,
                                    ),
                                    fontFamily: "JostMedium",
                                    fontSize: 18,
                                  ),
                                  cursorColor: Color(
                                    0xFF707070,
                                  ),
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 5),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         SizedBox(
                          width: 265.96,
                          height: 61,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager().currentLanguage]!['last_name']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JostMedium',
                                      fontSize: 13,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                height: 38,
                                child: TextField(
                                  inputFormatters: [],
                                  style: TextStyle(
                                    color: Color(
                                      0xFF707070,
                                    ),
                                    fontFamily: "JostMedium",
                                    fontSize: 18,
                                  ),
                                  cursorColor: Color(
                                    0xFF707070,
                                  ),
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 5),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 265.96,
                          height: 41,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Row(
                                children: [
                                  Text(
                                   translations[LanguageManager().currentLanguage]!['gender']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JostMedium',
                                      fontSize: 13,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 17,
                                child: Row(
                                  children: [
                                    CustomRadioButton(
                                      text: translations[LanguageManager().currentLanguage]!['male']!,
                                      value: 'Male',
                                      selected: selectedGender == 'Male',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'Male';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CustomRadioButton(
                                      text: translations[LanguageManager().currentLanguage]!['female']!,
                                      value: 'Female',
                                      selected: selectedGender == 'Female',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'Female';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CustomRadioButton(
                                      text: translations[LanguageManager().currentLanguage]!['others']!,
                                      value: 'Other',
                                      selected: selectedGender == 'Others',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'Others';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                         SizedBox(
                          width: 265.96,
                          height: 61,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                  translations[LanguageManager().currentLanguage]!['abha_id']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JostMedium',
                                      fontSize: 13,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                height: 38,
                                child: TextField(
                                  inputFormatters: [],
                                  style: TextStyle(
                                    color: Color(
                                      0xFF707070,
                                    ),
                                    fontFamily: "JostMedium",
                                    fontSize: 18,
                                  ),
                                  cursorColor: Color(
                                    0xFF707070,
                                  ),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 0, 0, 5),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          13,
                                        ),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 19,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpSecond(),
                                  ),
                                );
                              },
                              child: Text(
                                translations[LanguageManager().currentLanguage]!['submit']!,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
