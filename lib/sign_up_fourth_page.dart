import 'package:dostx/custom_widgets.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/material.dart';
import 'consent_page.dart';
import 'translations.dart';
import 'language_manager.dart';
class SignUpFourth extends StatefulWidget {
  const SignUpFourth({super.key});

  @override
  State<SignUpFourth> createState() => _SignUpFourthState();
}

class _SignUpFourthState extends State<SignUpFourth> {
  String? jobLoss;
  String? income;
  String? status;
  String? diagnosis;
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
                          height: 22,
                        ),
                        SizedBox(
                          width: 299,
                          height: 47,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Row(
                                children: [
                                  Text(
                                    translations[LanguageManager().currentLanguage]!['job_loss']! + ":",
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
                                height: 17,
                                width: 299,
                                child: Row(
                                  children: [
                                    CustomRadioButton(
                                      text: translations[LanguageManager().currentLanguage]!['yes']!,
                                      value: 'Yes',
                                      selected: jobLoss == 'Yes',
                                      onSelect: () {
                                        setState(() {
                                          jobLoss = 'Yes';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CustomRadioButton(
                                      text: translations[LanguageManager().currentLanguage]!['no']!,
                                      value: 'No',
                                      selected: jobLoss == 'No',
                                      onSelect: () {
                                        setState(() {
                                          jobLoss = 'No';
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
                          height: 15,
                        ),
                        SizedBox(
                          width: 299,
                          height: 47,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Row(
                                children: [
                                  Text(
                                    translations[LanguageManager().currentLanguage]!['income_inadequacy']! + ":",
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
                                height: 17,
                                width: 299,
                                child: Row(
                                  children: [
                                    CustomRadioButton(
                                      text: translations[LanguageManager().currentLanguage]!['yes']!,
                                      value: 'Yes',
                                      selected: income == 'Yes',
                                      onSelect: () {
                                        setState(() {
                                          income = 'Yes';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    CustomRadioButton(
                                      text: translations[LanguageManager().currentLanguage]!['no']!,
                                      value: 'No',
                                      selected: income == 'No',
                                      onSelect: () {
                                        setState(() {
                                          income = 'No';
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
                          height: 15,
                        ),
                        SizedBox(
                          width: 299,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 299,
                                height: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     Row(
                                      children: [
                                        Text(
                                          translations[LanguageManager().currentLanguage]!['status_of_person']! + ":",
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
                                      height: 60,
                                      width: 299,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CustomRadioButton(
                                                text: translations[LanguageManager().currentLanguage]!['at_home']!,
                                                value: 'At home',
                                                selected: status == 'At home',
                                                onSelect: () {
                                                  setState(() {
                                                    status = 'At home';
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 60,
                                              ),
                                              CustomRadioButton(
                                                text: translations[LanguageManager().currentLanguage]!['institution']!,
                                                value: 'Institution',
                                                selected:
                                                    status == 'Institution',
                                                onSelect: () {
                                                  setState(() {
                                                    status = 'Institution';
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
                                                text:
                                                    translations[LanguageManager().currentLanguage]!['intermittent_institution']!,
                                                value:
                                                    'Intermittent Institution and then at home',
                                                selected: status ==
                                                    'Intermittent Institution and then at home',
                                                onSelect: () {
                                                  setState(() {
                                                    status =
                                                        'Intermittent Institution and then at home';
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
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
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: SizedBox(
                            width: 325,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 325,
                                  height: 160,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                       Row(
                                        children: [
                                          Text(
                                            translations[LanguageManager().currentLanguage]!['diagnosis_of_person']! + ":",
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
                                        height: 14,
                                      ),
                                      SizedBox(
                                        height: 127,
                                        width: 325,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                CustomRadioButton(
                                                  text: translations[LanguageManager().currentLanguage]!['neurological_disorder']!,
                                                  value:
                                                      'Neurological disorder',
                                                  selected: diagnosis ==
                                                      'Neurological disorder',
                                                  onSelect: () {
                                                    setState(() {
                                                      diagnosis =
                                                          'Neurological disorder';
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                CustomRadioButton(
                                                  text: translations[LanguageManager().currentLanguage]!['depression']!,
                                                  value: 'depression',
                                                  selected:
                                                      diagnosis == 'depression',
                                                  onSelect: () {
                                                    setState(() {
                                                      diagnosis = 'depression';
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
                                                  text: translations[LanguageManager().currentLanguage]!['substance_abuse']!,
                                                  value: 'Substance abuse',
                                                  selected: diagnosis ==
                                                      'Substance abuse',
                                                  onSelect: () {
                                                    setState(() {
                                                      diagnosis =
                                                          'Substance abuse';
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 49,
                                                ),
                                                CustomRadioButton(
                                                  text: translations[LanguageManager().currentLanguage]!['schizophrenia']!,
                                                  value: 'Schizophrenia',
                                                  selected: diagnosis ==
                                                      'Schizophrenia',
                                                  onSelect: () {
                                                    setState(() {
                                                      diagnosis =
                                                          'Schizophrenia';
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
                                                  text: translations[LanguageManager().currentLanguage]!['multiple_disorders']!,
                                                  value: 'Multiple disorders',
                                                  selected: diagnosis ==
                                                      'Multiple disorders',
                                                  onSelect: () {
                                                    setState(() {
                                                      diagnosis =
                                                          'Multiple disorders';
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 40,
                                                ),
                                                CustomRadioButton(
                                                  text: translations[LanguageManager().currentLanguage]!['bipolar_disorder']!,
                                                  value: 'Bipolar disorder',
                                                  selected: diagnosis ==
                                                      'Bipolar disorder',
                                                  onSelect: () {
                                                    setState(() {
                                                      diagnosis =
                                                          'Bipolar disorder';
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
                                                  text:
                                                      translations[LanguageManager().currentLanguage]!['chronic_physical_disorders']!,
                                                  value:
                                                      'Chronic Physical disorders',
                                                  selected: diagnosis ==
                                                      'Chronic Physical disorders',
                                                  onSelect: () {
                                                    setState(() {
                                                      diagnosis =
                                                          'Chronic Physical disorders';
                                                    });
                                                  },
                                                ),
                                                const Spacer()
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
                        ),
                        const SizedBox(
                          height: 46,
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
                                    builder: (context) => const ConsentForm(),
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
