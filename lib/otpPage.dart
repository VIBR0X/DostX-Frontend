import 'package:dostx/request/otpVer.dart';
import 'package:dostx/response/otpResponse.dart';
import 'package:flutter/material.dart';
import 'palette.dart';
import 'package:flutter/services.dart';
import 'sign_up_first_page.dart';
import 'package:dostx/bloc/bloc_provider.dart';
import 'package:dostx/request/signUpRequest.dart';
import 'package:dostx/request/signInRequest.dart';
import 'dart:convert';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
class otpPage extends StatefulWidget {
  otpPage({super.key, required this.number});
  String number;
  @override
  State<otpPage> createState() => _otpPageState();
}

bool isValidNumber(String input) {
  return input.length == 6;
}

class _otpPageState extends State<otpPage> {
  bool validNumber = false;
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of(context)!.bloc;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
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
                    Image.asset("assets/image/dostxbg.png",fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
                     Text(
                      translations[LanguageManager().currentLanguage]!['app_name']!,
                      style: TextStyle(
                        color: ColorOptions.darkblue,
                        fontSize: 28,
                        fontFamily: 'JostSemi',
                      ),
                    ),
                     Text(
                      translations[LanguageManager().currentLanguage]!['slogan']!,
                      style: TextStyle(
                        color: ColorOptions.darkblue,
                        fontSize: 15,
                        fontFamily: 'JostLightItalic',
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

                          });
                        },
                        controller: _otpController,
                        onChanged: (value) {
                          setState(
                                () {
                              validNumber = isValidNumber(value);
                            },
                          );
                        },
                        enableInteractiveSelection: false,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
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
                          hintText: translations[LanguageManager().currentLanguage]!['verify_otp']!,
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
                              ? () async {
                            otpVerRequest fakeOtpRequest =
                            otpVerRequest(
                                phoneNumber: widget.number,
otp: _otpController.text,
                            );

                            String jsonRepresentation = jsonEncode(fakeOtpRequest);
                            print(jsonRepresentation);
                            
                             otpResponse res = await bloc.otpBloc(fakeOtpRequest);
                             print(res.key);
                             if(res.key??false){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => const SignUpFirst(),
                                 ),
                               );
                             }




                          }
                              : () {},
                          child: Text(
                            translations[LanguageManager().currentLanguage]!['verify_otp']!,
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
        ),
      ),
    );
  }
}
