import 'package:dostx/globals.dart';
import 'package:dostx/pages/otpPage.dart';
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
  return input.length == 13;
}

class _SignInState extends State<SignIn> {
  bool validNumber = false;
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of(context)!.bloc;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE5A194),
        body: SafeArea(
          minimum: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: GradientOptions.backgroundGradient,
            ),
            child: SingleChildScrollView(
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
                         height: screenHeight(context)*0.04,
                       ),
                       Text(
                        translations[LanguageManager().currentLanguage]!['slogan']!,
                        style: TextStyle(
                          color: const Color(0xFF204267),
                          fontSize: 15,
                          fontFamily: 'JostMedium',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Container(
                        height: 25,
                      ),
                      SizedBox(
                        height: 42,
                        width: 265.96,
                        child: TextField(
                          onTap: () {
                            setState(() {
                              if (_phoneController.text.isEmpty) {
                                _phoneController.text = "+91";
                              }
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
                            LengthLimitingTextInputFormatter(13),
                          ],
                          style: const TextStyle(
                            color: Color(
                              0xFF707070,
                            ),
                            fontFamily: "JostMedium",
                            fontSize: 18,
                          ),
                          cursorColor: const Color(
                            0xFF707070,
                          ),
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintMaxLines: 1,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(
                                  0xFFDEDEDF,
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(
                                  0xFFDEDEDF,
                                ),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                color: Color(
                                  0xFFDEDEDF,
                                ),
                              ),
                            ),
                            hintText: translations[LanguageManager().currentLanguage]!['phone_number']!,
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 0.33),
                              fontFamily: 'JostMedium',
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 21,
                      ),
                      SizedBox(
                        height: 43,
                        width: 175,
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
                                      MaterialPageRoute(
                                        builder: (context) =>  otpPage(number: _phoneController.text.substring(3),),
                                      ),
                                    );
                                  }
                                : () {},

                            child: Text(
                              translations[LanguageManager().currentLanguage]!['sign_in']!,
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
                      IconButton(
                        icon: Icon(Icons.language),
                        onPressed: () {
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
                                        // Update UI if necessary
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

                                        });
                                        // Update UI if necessary

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

                                        });
                                        // Update UI if necessary

                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



