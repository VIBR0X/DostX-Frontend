import 'package:flutter/material.dart';
import 'palette.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'sign_up_third_page.dart';
import 'dart:io';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 11,
                        ),
                        Center(
                          child: SizedBox(
                            width: 250,
                            height: 55,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 32,
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
                                      child:  Text(
                                        translations[LanguageManager().currentLanguage]!['upload_image']!,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: "JostBold",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Container(
                                  height: 55,
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
                        const SizedBox(
                          height: 14,
                        ),
                         Center(
                          child: SizedBox(
                            width: 269.91,
                            height: 103,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                     translations[LanguageManager().currentLanguage]!['address']! + ":",
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
                                  height: 2,
                                ),
                                SizedBox(
                                  height: 82,
                                  child: TextField(
                                    maxLines: 5,
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
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: SizedBox(
                            height: 47,
                            width: 269.91,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager().currentLanguage]!['postal_code']! + ":",
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
                                  height: 2,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 26,
                                          width: 94.91,
                                          child: TextField(
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  6),
                                            ],
                                            style: const TextStyle(
                                              color: Color(
                                                0xFF707070,
                                              ),
                                              fontFamily: "JostMedium",
                                              fontSize: 14,
                                            ),
                                            cursorColor: const Color(
                                              0xFF707070,
                                            ),
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
                          height: 10,
                        ),
                         Center(
                          child: SizedBox(
                            width: 267.91,
                            height: 61,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager().currentLanguage]!['state']! + ":",
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Center(
                          child: SizedBox(
                            width: 269.91,
                            height: 61,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translations[LanguageManager().currentLanguage]!['country']! + ":",
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
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: SizedBox(
                            height: 40,
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
