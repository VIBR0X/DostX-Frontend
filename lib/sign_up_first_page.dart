import 'package:flutter/material.dart';
import 'palette.dart';
import 'custom_widgets.dart';
import 'sign_up_second_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'globals.dart';

class SignUpFirst extends StatefulWidget {
  const SignUpFirst({Key? key}) : super(key: key);

  @override
  State<SignUpFirst> createState() => _SignUpFirstState();
}

class _SignUpFirstState extends State<SignUpFirst> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    // Get the screen width

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: ColorOptions.skin),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  children: [
                    Center(
                        child: SvgPicture.asset(
                      "assets/svg/logoa1.svg",

                    ),),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 0.3827232142857143 * screenHeight(context),
                      color: Colors.transparent,
                    ),
                    Container(
                      // color: Colors.amber,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height -
                          (0.3627232142857143) * screenHeight(context),

                      decoration: BoxDecoration(
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
                          SizedBox(
                            height: (35 / 896) * screenHeight(context),
                          ),
                          Text(
                            translations[LanguageManager().currentLanguage]![
                                'sign_up']!,
                            style: TextStyle(
                              fontFamily: 'JostBold',
                              fontSize: 28*fontHelper(context),
                              color: ColorOptions.skin,
                            ),
                          ),
                          SizedBox(
                            height: (10 / 896) * screenHeight(context),
                          ),
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
                            height: (15 / 896) * screenHeight(context),
                          ),
                          SizedBox(
                            width: 265.96,
                            height:( 61/ 896) * screenHeight(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager()
                                          .currentLanguage]!['first_name']!,
                                      style: TextStyle(
                                        color: ColorOptions.skin,
                                        fontFamily: 'JostMedium',
                                        fontSize: 13*fontHelper(context),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: (4 / 896) * screenHeight(context),
                                ),
                                SizedBox(
                                  height: (38/ 896) * screenHeight(context),
                                  child: TextField(
                                    inputFormatters: [],
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: "JostMedium",
                                      fontSize: 18*fontHelper(context),
                                    ),
                                    cursorColor: ColorOptions.skin,
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
                          SizedBox(
                            height: (20 / 896) * screenHeight(context),
                          ),
                          SizedBox(
                            width: 265.96,
                            height: (61/896)*screenHeight(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager()
                                          .currentLanguage]!['last_name']!,
                                      style: TextStyle(
                                        color: ColorOptions.skin,
                                        fontFamily: 'JostMedium',
                                        fontSize: 13*fontHelper(context),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: (4 / 896) * screenHeight(context),
                                ),
                                SizedBox(
                                  height: (38/896)*screenHeight(context),
                                  child: TextField(
                                    inputFormatters: [],
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: "JostMedium",
                                      fontSize: 18*fontHelper(context),
                                    ),
                                    cursorColor: ColorOptions.skin,
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
                          SizedBox(
                            height: (20 / 896) * screenHeight(context),
                          ),
                          SizedBox(
                            width: 265.96,
                            height: (41/896)*screenHeight(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager()
                                          .currentLanguage]!['gender']!,
                                      style: TextStyle(
                                        color: ColorOptions.skin,
                                        fontFamily: 'JostMedium',
                                        fontSize: 13*fontHelper(context),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: (5 / 896) * screenHeight(context),
                                ),
                                SizedBox(
                                  height: (17/896)*screenHeight(context),
                                  child: Row(
                                    children: [
                                      CustomRadioButton(
                                        text: translations[LanguageManager()
                                            .currentLanguage]!['male']!,
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
                                        text: translations[LanguageManager()
                                            .currentLanguage]!['female']!,
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
                                        text: translations[LanguageManager()
                                            .currentLanguage]!['others']!,
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
                          SizedBox(
                            height: (22 / 896) * screenHeight(context),
                          ),
                          SizedBox(
                            width: 265.96,
                            height:( 61/896)*screenHeight(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager()
                                          .currentLanguage]!['abha_id']!,
                                      style: TextStyle(
                                        color: ColorOptions.skin,
                                        fontFamily: 'JostMedium',
                                        fontSize: 13*fontHelper(context),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: (4 / 896) * screenHeight(context),
                                ),
                                SizedBox(
                                  height: (38/896)*screenHeight(context),
                                  child: TextField(
                                    inputFormatters: [],
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: "JostMedium",
                                      fontSize: 18*fontHelper(context),
                                    ),
                                    cursorColor: ColorOptions.skin,
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
                            height: (23/ 896) * screenHeight(context),
                          ),
                          SizedBox(
                            height: (43/896)*screenHeight(context),
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
                                      builder: (context) =>
                                          const SignUpSecond(),
                                    ),
                                  );
                                },
                                child: Text(
                                  translations[LanguageManager()
                                      .currentLanguage]!['submit']!,
                                  style: TextStyle(
                                    fontSize: 14*fontHelper(context),
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
