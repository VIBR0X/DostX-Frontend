import 'package:dostx/custom_widgets.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'consent_page.dart';
import '../translations.dart';
import '../language_manager.dart';
import '../globals.dart ';

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
    final fontSize = (screenHeight(context) / 896) * 13;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorOptions.skin,
        ),
        child: Stack(
          children: [
            Column(
              children: [SizedBox(height: (0.03+0.011)* screenHeight(context,),),
                Center(
                  child: SvgPicture.asset(
                    "assets/svg/grandfather.svg",
                    height: 0.33 * screenHeight(context),
                  ),),
              ],
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
                      (0.36) * screenHeight(context),
                  decoration: const BoxDecoration(
                    color: ColorOptions.whitish,
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
                      SizedBox(height: (39 / 869) * screenHeight(context)),
                      SizedBox(
                        width: 299,
                        height: (47 / 869) * screenHeight(context),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  translations[LanguageManager()
                                          .currentLanguage]!['job_loss']! +
                                      ":",
                                  style: TextStyle(
                                    color: ColorOptions.skin,
                                    fontFamily: 'JostMedium',
                                    fontSize: fontSize*(14 / 13),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: (8 / 869) * screenHeight(context),
                            ),
                            SizedBox(
                              height: (17 / 869) * screenHeight(context),
                              width: 299,
                              child: Row(
                                children: [
                                  CustomRadioButton(
                                    font: fontSize * (14 / 13),
                                    text: translations[LanguageManager()
                                        .currentLanguage]!['yes']!,
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
                                    font: fontSize * (14 / 13),
                                    text: translations[LanguageManager()
                                        .currentLanguage]!['no']!,
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
                      SizedBox(
                        height: (15 / 869) * screenHeight(context),
                      ),
                      SizedBox(
                        width: 299,
                        height: (64 / 869) * screenHeight(context),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 299,
                                  child: Text(
                                    translations[LanguageManager()
                                                .currentLanguage]![
                                            'income_inadequacy']!,
                                    style: TextStyle(
                                        color: ColorOptions.skin,
                                        fontFamily: 'JostMedium',
                                        fontSize: fontSize*(14 / 13)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: (5 / 869) * screenHeight(context),
                            ),
                            SizedBox(
                              height: (17 / 869) * screenHeight(context),
                              width: 299,
                              child: Row(
                                children: [
                                  CustomRadioButton(
                                    font: fontSize * (14 / 13),
                                    text: translations[LanguageManager()
                                        .currentLanguage]!['yes']!,
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
                                    font: fontSize * (14 / 13),
                                    text: translations[LanguageManager()
                                        .currentLanguage]!['no']!,
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
                      SizedBox(
                        height: (11 / 869) * screenHeight(context),
                      ),
                      SizedBox(
                        width: 299,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 299,
                              height: (91 / 869) * screenHeight(context),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        translations[LanguageManager()
                                                    .currentLanguage]![
                                                'status_of_person']! +
                                            ":",
                                        style: TextStyle(
                                            color: ColorOptions.skin,
                                            fontFamily: 'JostMedium',
                                            fontSize: fontSize*(14 / 13)),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        (11 / 869) * screenHeight(context),
                                  ),
                                  SizedBox(
                                    height:
                                        (60 / 869) * screenHeight(context),
                                    width: 299,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CustomRadioButton(
                                              font: fontSize * (14 / 13),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'at_home']!,
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
                                              font: fontSize * (14 / 13),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'institution']!,
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
                                        SizedBox(
                                          height: (10 / 869) *
                                              screenHeight(context),
                                        ),
                                        Row(
                                          children: [
                                            CustomRadioButton(
                                              font: fontSize * (14 / 13),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'intermittent_institution']!,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: (3 / 869) * screenHeight(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: SizedBox(
                          width: 325,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 325,
                                height: (160 / 869) * screenHeight(context),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          translations[LanguageManager()
                                                      .currentLanguage]![
                                                  'diagnosis_of_person']! +
                                              ":",
                                          style: TextStyle(
                                              color: ColorOptions.skin,
                                              fontFamily: 'JostMedium',
                                              fontSize: fontSize*(14 / 13)),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          (14 / 869) * screenHeight(context),
                                    ),
                                    SizedBox(
                                      height:
                                          (125 / 869) * screenHeight(context),
                                      width: 325,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomRadioButton(
                                                    font:
                                                        fontSize * (14 / 13),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'neurological_disorder']!,
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
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomRadioButton(
                                                    font:
                                                        fontSize * (14 / 13),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'substance_abuse']!,
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
                                                  SizedBox(height: 5),
                                                  CustomRadioButton(
                                                    font:
                                                        fontSize * (14 / 13),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'multiple_disorders']!,
                                                    value:
                                                        'Multiple disorders',
                                                    selected: diagnosis ==
                                                        'Multiple disorders',
                                                    onSelect: () {
                                                      setState(() {
                                                        diagnosis =
                                                            'Multiple disorders';
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(height: 5),
                                                  CustomRadioButton(
                                                    font:
                                                        fontSize * (14 / 13),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'chronic_physical_disorders']!,
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
                                                ],
                                              ),
                                              SizedBox(
                                                width: 3 /
                                                    414 *
                                                    screenWidth(context),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomRadioButton(
                                                    font:
                                                        fontSize * (14 / 13),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'depression']!,
                                                    value: 'depression',
                                                    selected: diagnosis ==
                                                        'depression',
                                                    onSelect: () {
                                                      setState(() {
                                                        diagnosis =
                                                            'depression';
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(height: 5),
                                                  CustomRadioButton(
                                                    font:
                                                        fontSize * (14 / 13),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'schizophrenia']!,
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
                                                  SizedBox(height: 5),
                                                  CustomRadioButton(
                                                    font:
                                                        fontSize * (14 / 13),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'bipolar_disorder']!,
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
                                            ],
                                          ),
                                          SizedBox(
                                            height: (20 / 869) *
                                                screenHeight(context),
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
                      ),SizedBox(height:(10/ 869) * screenHeight(context),),
                      SizedBox(
                        height: (43/ 869) * screenHeight(context),
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
                            child: Text(
                              translations[LanguageManager()
                                  .currentLanguage]!['submit']!,
                              style: TextStyle(
                                fontSize: (fontSize / 13) * 14,
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
            ),Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 25, 0, 0),
                  child: SvgPicture.asset(
                    'assets/svg/lang.svg',
                    height: 94,
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
