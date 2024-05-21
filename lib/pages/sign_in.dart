import 'package:dostx/CustomRouteBuilder.dart';
import 'package:dostx/globals.dart';
import 'package:dostx/pages/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../palette.dart';
import 'package:flutter/services.dart';
import 'sign_up_first_page.dart';
import 'package:dostx/bloc/bloc_provider.dart';
import 'package:dostx/request/signUpRequest.dart';
import 'package:dostx/request/signInRequest.dart';
import 'dart:convert';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

bool isValidNumber(String input) {
  return input.length == 10;
}

class _SignInState extends State<SignIn> {
  bool validNumber = false;
  final TextEditingController _phoneController = TextEditingController();
  int phoneColor = 0xFFBABABA;
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of(context)!.bloc;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFFF8EA),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                // width: double.maxFinite,
                height: screenHeight(context),
                decoration: const BoxDecoration(
                  gradient: GradientOptions.backgroundGradient,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Center(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                      "assets/image/02-image.png",
                                    fit: BoxFit.fitHeight,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Positioned(
                                    left: MediaQuery.of(context).size.width/2-62.5,
                                    top: 27,
                                    child: Image.asset(
                                      'assets/image/logo.png',
                                      width: 123,
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(
                                 height: screenHeight(context)*0.027,
                               ),
                               Text(
                                translations[LanguageManager().currentLanguage]!['slogan']!,
                                style: const TextStyle(
                                  color: Color(0xFF204267),
                                  fontSize: 15,
                                  fontFamily: 'JostMedium',
                                  fontStyle: FontStyle.italic,
          
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Container(
                                width: 265.96,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                      translations[LanguageManager().currentLanguage]!['phone_number']!,
                                    style: const TextStyle(
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 42,
                                width: 265.96,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  // color: Colors.white,
                                ),
                                // alignment: Alignment.topCenter,
                                // constraints: BoxConstraints(minWidth: 0, minHeight: 10),
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.top,
                                  onTap: () {
                                    setState(() {
                                      phoneColor = 0xFF707070;
                                    //   if (_phoneController.text.isEmpty) {
                                    //     _phoneController.text = "+91";
                                    //   }
                                    });
                                  },
                                  controller: _phoneController,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        validNumber = isValidNumber(value);
                                      },
                                    );
                                  },
                                  enableInteractiveSelection: false,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  style: TextStyle(
                                    color: Color(
                                      phoneColor,
                                    ),
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                  ),
          
                                  cursorColor: const Color(
                                    0xFF707070,
                                  ),
                                  keyboardType: const TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    floatingLabelAlignment: FloatingLabelAlignment.center,
                                    // alignLabelWithHint: false,
                                    // isDense:true,
                                    prefixIcon:  Text(
                                      '  +91 ',
                                      style: TextStyle(
          
                                        color: Color(
                                          phoneColor
                                        ),
                                        fontFamily: "Quicksand",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                                    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 29),
          
                                    suffixIcon: Icon(
                                        Icons.phone_enabled,
                                      weight: 500,
                                      color: Color(phoneColor),
                                      size: 19,
                                    ) ,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
          
                                      ),
                                      gapPadding: 4,
          
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent
                                      ),
                                      gapPadding: 4,
          
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Color(
                                          0xFFDEDEDF,
                                        ),
                                      ),
                                      gapPadding: 4,
          
                                    ),
                                    // hintText: translations[LanguageManager().currentLanguage]!['phone_number']!,
                                    // hintStyle: const TextStyle(
                                    //   color: Color.fromRGBO(112, 112, 112, 0.33),
                                    //   fontFamily: 'JostMedium',
                                    //   fontSize: 13,
                                    // ),
                                  ),
                                ),
                              ),
          
                              const SizedBox(
                                height: 100,
                              ),
                              SizedBox(
                                height: 40,
                                width: 261,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: validNumber
                                        ? GradientOptions.signInGradient
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: validNumber
                                          ? null
                                          : const Color(
                                              0xFFFBFBFB,
                                            ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                      ),
                                    ),
                                    onPressed: validNumber
                                        ? () {
                                            SignInRequest fakeSignInRequest = SignInRequest(
                                             phoneNumber: _phoneController.text.substring(3)
                                                );
          
                                            String jsonRepresentation = jsonEncode(fakeSignInRequest);
                                            print(jsonRepresentation);
                                            // bloc.signInBloc(fakeSignInRequest);
                                            Navigator.push(
                                              context,
                                              createCustomPageRoute(OtpPage(number: _phoneController.text,), context, transitionType: 'no-animation'),
                                              // MaterialPageRoute(
                                              //
                                              //   builder: (context) =>  OtpPage(number: _phoneController.text,),
                                              // ),
                                            );
                                          }
                                        : () {},
          
                                    child: Text(
                                      translations[LanguageManager().currentLanguage]!['submit']!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "JostBold",
                                        color: validNumber
                                            ? const Color(
                                                0xFFFBFBFB,
                                              )
                                            : ColorOptions.lightblue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
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
      ),
    );
  }
}



