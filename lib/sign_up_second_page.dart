import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'palette.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'sign_up_third_page.dart';
import 'dart:io';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
import 'globals.dart';

class SignUpSecond extends StatefulWidget {
  const SignUpSecond({super.key});

  @override
  State<SignUpSecond> createState() => _SignUpSecondState();
}

class _SignUpSecondState extends State<SignUpSecond> {
  late File? _pickedImage = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: ColorOptions.skin),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Center(
                  child: SvgPicture.asset(
                    "assets/svg/grandfather.svg",
                    height: 0.3827232142857143 * screenHeight(context),
                  )),
              Column(
                children: [
                  Container(
                    height: 0.3627232142857143 * screenHeight(context),
                    color: Colors.transparent,
                  ),
                  Container(
                    // color: Colors.amber,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height -
                        (0.3627232142857143) * screenHeight(context),

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: (11 / 896) * screenHeight(context),
                        ),
                        Center(
                          child: SizedBox(
                            width: 250,
                            height: (55/ 896) * screenHeight(context),
                            child: Row(
                              children: [
                                SizedBox(
                                  height:( 32/ 896) * screenHeight(context),
                                  width: 170,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: GradientOptions.signInGradient,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: null,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        final imagePicker = ImagePicker();
                                        final pickedFile =
                                            await imagePicker.pickImage(
                                          source: ImageSource.gallery,
                                        );

                                        if (pickedFile != null) {
                                          setState(() {
                                            _pickedImage =
                                                File(pickedFile.path);
                                          });
                                        } else {}
                                      },
                                      child: Text(
                                        translations[LanguageManager()
                                            .currentLanguage]!['upload_image']!,
                                        style: TextStyle(
                                          fontSize: 10*fontHelper(context),
                                          fontFamily: "JostBold",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: (18 / 896) * screenHeight(context),
                                ),
                                Container(
                                  height: (55/ 896) * screenHeight(context),
                                  width: 62,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: _pickedImage != null
                                      ? Image.file(_pickedImage!,
                                          fit: BoxFit.cover)
                                      : const SizedBox(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context) * (14 / 896),
                        ),
                        Center(
                          child: SizedBox(
                            width: 269.91,
                            height: (103/ 896) * screenHeight(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager()
                                              .currentLanguage]!['address']! +
                                          ":",
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
                                  height: (2 / 896) * screenHeight(context),
                                ),
                                SizedBox(
                                  height: (82/ 896) * screenHeight(context),
                                  child: TextField(
                                    maxLines: 5,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: "JostMedium",
                                      fontSize: 14*fontHelper(context),
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
                        ),
                        SizedBox(
                          height: (15 / 896) * screenHeight(context),
                        ),
                        Center(
                          child: SizedBox(
                            height:( 47/ 896) * screenHeight(context),
                            width: 269.91,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager()
                                                  .currentLanguage]![
                                              'postal_code']! +
                                          ":",
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
                                  height: (2 / 896) * screenHeight(context),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height:( 26/ 896) * screenHeight(context),
                                          width: 94.91,
                                          child: TextField(
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  6),
                                            ],
                                            style: TextStyle(
                                              color: ColorOptions.skin,
                                              fontFamily: "JostMedium",
                                              fontSize: 14*fontHelper(context),
                                            ),
                                            cursorColor: ColorOptions.skin,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              filled: true,
                                              fillColor: Colors.white,
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
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: (10 / 896) * screenHeight(context),
                        ),
                        Center(
                          child: SizedBox(
                            width: 267.91,
                            height: (61/ 896) * screenHeight(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager()
                                              .currentLanguage]!['state']! +
                                          ":",
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
                        ),
                        SizedBox(
                          height: (10 / 869) * screenHeight(context),
                        ),
                        Center(
                          child: SizedBox(
                            width: 269.91,
                            height: (61/ 896) * screenHeight(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager()
                                              .currentLanguage]!['country']! +
                                          ":",
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
                                  height: (4/ 896) * screenHeight(context),
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
                        ),
                        SizedBox(
                          height: (25 / 869) * screenHeight(context),
                        ),
                        Center(
                          child: SizedBox(
                            height: (43 / 869) * screenHeight(context),
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
                                      builder: (context) => const SignUpThird(),
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
