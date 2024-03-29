import 'package:flutter/material.dart';
import 'palette.dart';
import 'custom_widgets.dart';
import 'sign_up_fourth_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
class SignUpThird extends StatefulWidget {
  const SignUpThird({super.key});

  @override
  State<SignUpThird> createState() => _SignUpThirdState();
}

class _SignUpThirdState extends State<SignUpThird> {
  String? maritalStatus;
  String? relation;
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
                          height: 29,
                        ),
                        SizedBox(
                          width: 299,
                          height: 77,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Row(
                                children: [
                                  Text(
                                    translations[LanguageManager().currentLanguage]!['marital_status']! + ":",
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
                                height: 11,
                              ),
                              SizedBox(
                                height: 47,
                                width: 299,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CustomRadioButton(
                                          text: translations[LanguageManager().currentLanguage]!['married']!,
                                          value: 'Married',
                                          selected: maritalStatus == 'Married',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Married';
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        CustomRadioButton(
                                          text: translations[LanguageManager().currentLanguage]!['unmarried']!,
                                          value: 'Unmarried',
                                          selected:
                                              maritalStatus == 'Unmarried',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Unmarried';
                                            });
                                          },
                                        ),
                                        const Spacer(),
                                        CustomRadioButton(
                                          text: translations[LanguageManager().currentLanguage]!['separated']!,
                                          value: 'Seperated',
                                          selected:
                                              maritalStatus == 'Seperated',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Seperated';
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        CustomRadioButton(
                                          text: translations[LanguageManager().currentLanguage]!['widowed']!,
                                          value: 'Widowed',
                                          selected: maritalStatus == 'Widowed',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Widowed';
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CustomRadioButton(
                                          text: translations[LanguageManager().currentLanguage]!['cohabitant']!,
                                          value: 'Co-habitant',
                                          selected:
                                              maritalStatus == 'Co-habitant',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Co-habitant';
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 299,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 247,
                                height: 110,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     Row(
                                      children: [
                                        Text(
                                          translations[LanguageManager().currentLanguage]!['relation_of_carer']! + ":",
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
                                      height: 11,
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: 247,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CustomRadioButton(
                                                text: translations[LanguageManager().currentLanguage]!['either_parents']!,
                                                value: 'Either parent',
                                                selected:
                                                    relation == 'Either parent',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Either parent';
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 24,
                                              ),
                                              CustomRadioButton(
                                                text: translations[LanguageManager().currentLanguage]!['relative']!,
                                                value: 'Relative',
                                                selected:
                                                    relation == 'Relative',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Relative';
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              CustomRadioButton(
                                                text: translations[LanguageManager().currentLanguage]!['spouse']!,
                                                value: 'Spouse',
                                                selected: relation == 'Spouse',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Spouse';
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 60,
                                              ),
                                              CustomRadioButton(
                                                text: translations[LanguageManager().currentLanguage]!['friend']!,
                                                value: 'Friend',
                                                selected: relation == 'Friend',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Friend';
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              CustomRadioButton(
                                                text: translations[LanguageManager().currentLanguage]!['sibling']!,
                                                value: 'Sibling',
                                                selected: relation == 'Sibling',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Sibling';
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 62,
                                              ),
                                              CustomRadioButton(
                                                text: translations[LanguageManager().currentLanguage]!['non_relation']!,
                                                value: 'Non relations',
                                                selected:
                                                    relation == 'Non relations',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Non relations';
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                         SizedBox(
                          width: 299,
                          height: 72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager().currentLanguage]!['mean_duration_of_illness']!,
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
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 26,
                                    width: 94.91,
                                    child: TextField(
                                      inputFormatters: [],
                                      style: TextStyle(
                                        color: Color(
                                          0xFF707070,
                                        ),
                                        fontFamily: "JostMedium",
                                        fontSize: 14,
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
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                         SizedBox(
                          width: 299,
                          height: 72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager().currentLanguage]!['mean_hours_spent']!,
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
                                height: 8,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 26,
                                    width: 94.91,
                                    child: TextField(
                                      inputFormatters: [],
                                      style: TextStyle(
                                        color: Color(
                                          0xFF707070,
                                        ),
                                        fontFamily: "JostMedium",
                                        fontSize: 14,
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
                            ],
                          ),
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpFourth(),
                                  ),
                                );
                              },
                              child:  Text(
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
