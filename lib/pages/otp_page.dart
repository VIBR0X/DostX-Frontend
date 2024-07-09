import 'package:dostx/globals.dart';
import 'package:dostx/pages/consent_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import '../config.dart';
import '../navigator.dart';
import '../palette.dart';
import 'package:flutter/services.dart';
import 'package:dostx/bloc/bloc_provider.dart';
import 'package:dostx/request/signInRequest.dart';
import 'dart:convert';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
import 'package:http/http.dart' as http;
class OtpPage extends StatefulWidget {
  final String number;
  const OtpPage({
    super.key,
    required this.number
  });
  @override
  State<OtpPage> createState() => _OtpPageState();
}

bool isvalidOTP(String input) {
  return input.length == 6;
}

class _OtpPageState extends State<OtpPage> {
  bool validOTP = false;
  final TextEditingController _phoneController = TextEditingController();
  int phoneColor = 0xFFBABABA;

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  String otp = '';

  @override
  void dispose() {
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _onOTPChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
        // Optionally, you can perform an action when all fields are filled
        otp = _controllers.map((controller) => controller.text).join();
        //print("Entered OTP: $otp");
        setState(() {
          validOTP = isvalidOTP(otp);
        });
      }
    }
  }

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
                width: screenWidth(context),
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
                                  color: Colors.white,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      "  +91 ${widget.number}",
                                      style: TextStyle(
                                            color: Color(
                                              phoneColor,
                                            ),
                                            fontFamily: "Quicksand",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 18,
                                          ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.phone_enabled,
                                            weight: 500,
                                            color: Color(phoneColor),
                                            size: 19,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
          
                                // alignment: Alignment.topCenter,
                                // constraints: BoxConstraints(minWidth: 0, minHeight: 10),
                                // child: TextField(
                                //   textAlignVertical: TextAlignVertical.top,
                                //   onTap: () {
                                //     setState(() {
                                //       phoneColor = 0xFF707070;
                                //     //   if (_phoneController.text.isEmpty) {
                                //     //     _phoneController.text = "+91";
                                //     //   }
                                //     });
                                //   },
                                //   controller: _phoneController,
                                //   onChanged: (value) {
                                //     setState(
                                //       () {
                                //         validOTP = isvalidOTP(value);
                                //       },
                                //     );
                                //   },
                                //   enableInteractiveSelection: false,
                                //   inputFormatters: [
                                //     LengthLimitingTextInputFormatter(10),
                                //   ],
                                //   style: TextStyle(
                                //     color: Color(
                                //       phoneColor,
                                //     ),
                                //     fontFamily: "Quicksand",
                                //     fontWeight: FontWeight.w300,
                                //     fontSize: 18,
                                //   ),
                                //
                                //   cursorColor: const Color(
                                //     0xFF707070,
                                //   ),
                                //   keyboardType: const TextInputType.numberWithOptions(),
                                //   decoration: InputDecoration(
                                //     floatingLabelAlignment: FloatingLabelAlignment.center,
                                //     // alignLabelWithHint: false,
                                //     // isDense:true,
                                //     prefixIcon:  Text(
                                //       '  +91 ',
                                //       style: TextStyle(
                                //
                                //         color: Color(
                                //           phoneColor
                                //         ),
                                //         fontFamily: "Quicksand",
                                //         fontWeight: FontWeight.w300,
                                //         fontSize: 18,
                                //       ),
                                //     ),
                                //     // constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                                //     prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 29),
                                //
                                //     suffixIcon: Icon(
                                //         Icons.phone_enabled,
                                //       weight: 500,
                                //       color: Color(phoneColor),
                                //       size: 19,
                                //     ) ,
                                //     filled: true,
                                //     fillColor: Colors.white,
                                //     hintMaxLines: 1,
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //       borderSide: const BorderSide(
                                //         color: Colors.transparent,
                                //
                                //       ),
                                //       gapPadding: 4,
                                //
                                //     ),
                                //     enabledBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //       borderSide: const BorderSide(
                                //         color: Colors.transparent
                                //       ),
                                //       gapPadding: 4,
                                //
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //       borderSide: const BorderSide(
                                //         color: Color(
                                //           0xFFDEDEDF,
                                //         ),
                                //       ),
                                //       gapPadding: 4,
                                //
                                //     ),
                                //     // hintText: translations[LanguageManager().currentLanguage]!['phone_number']!,
                                //     // hintStyle: const TextStyle(
                                //     //   color: Color.fromRGBO(112, 112, 112, 0.33),
                                //     //   fontFamily: 'JostMedium',
                                //     //   fontSize: 13,
                                //     // ),
                                //   ),
                                // ),
                              ),
                              const SizedBox(height: 8,),
                              Container(
                                width: 265.96,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    translations[LanguageManager().currentLanguage]!['otp']!,
                                    style: const TextStyle(
                                      fontFamily: 'JostMedium',
                                      color:  Color(0xFFE5A194),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                width: 265.96,
          
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(6, (index) {
                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(0,0,8,0),
                                        child: SizedBox(
                                          width: 14,
                                          child: TextFormField(
                                            style: const TextStyle(
                                              fontFamily: 'JostMedium',
                                              color:  Color(0xFFE5A194),
                                              fontSize: 14,
                                            ),
                                            controller: _controllers[index],
                                            focusNode: _focusNodes[index],
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            maxLength: 1,
                                            decoration: const InputDecoration(
                                              counterText: '',
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xFFE5A194), width: 1.4),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                              ),
                                            ),
                                            onChanged: (value) => _onOTPChanged(value, index),
                                          ),
                                        ),
                                      );
                                    }),
                                ) ,
                              ),
                              ),
                              // SizedBox(height: ,),
                              Container(
                                width: 265.96,
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextButton(
                                    onPressed: () async {
                                      var body = json.encode( {
                                        "phone_number":int.parse(widget.number)
                                      });
                                      final url=appConfig["serverURL"]+'/auth/register_phone/';
                                      final uri = Uri.parse(url);
                                      final response = await http.post(
                                        uri,
                                        headers: {"Content-Type": "application/json"},
                                        body: body,
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      elevation: 0
          
                                    ),
                                    child: Text(
                                      translations[LanguageManager().currentLanguage]!['resend_otp']!,
                                      style: const TextStyle(
                                        fontFamily: 'JostMedium',
                                        color: const Color(0xFFE5A194),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              SizedBox(
                                height: 40,
                                width: 261,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: validOTP
                                        ? GradientOptions.signInGradient
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: validOTP
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
                                    onPressed: validOTP
                                        ? () async {
                                            // SignInRequest fakeSignInRequest = SignInRequest(
                                            //  phoneNumber: _phoneController.text.substring(3)
                                            //     );
                                            //
                                            // String jsonRepresentation = jsonEncode(fakeSignInRequest);
                                            // //print(jsonRepresentation);
                                            // // bloc.signInBloc(fakeSignInRequest);
                                            var body = json.encode( {
                                              "phone_number":int.parse(widget.number),
                                              "otp":otp
                                            });
                                            final url=appConfig["serverURL"]+'/auth/verify_otp/';
                                            final uri = Uri.parse(url);
                                            final response = await http.post(
                                              uri,
                                              headers: {"Content-Type": "application/json"},
                                              body: body,
                                            );
                                            if (response.statusCode == 200){
                                              final responseBody = jsonDecode(response.body);
                                              // //print(responseBody);
                                              final access_token = responseBody['data']['access'];
                                              // //print(access_token);
                                              final refresh_token = responseBody['data']['refresh'];
                                              final profile_available = responseBody['data']['user_profile']!=null;
                                              final Map<String,dynamic>? user_profile = responseBody['data']['user_profile'];
                                              var tokenBox = Hive.box('TokenBox');

                                              tokenBox.put('access_token', access_token);
                                              tokenBox.put('refresh_token', refresh_token);

                                              tokenBox.put('profile_available', profile_available);
                                              var profileBox = Hive.box('ProfileBox');
                                              if (profile_available){
                                                for (var entry in user_profile!.entries){
                                                  profileBox.put(entry.key,entry.value);
                                                }
                                              }else{
                                                profileBox.put('phone_number',widget.number);
                                              }


                                              Navigator.pushReplacement(
                                                context,
                                                // createCustomPageRoute(const ConsentForm(), context)
                                                MaterialPageRoute(
                                                  builder: (context) =>   profile_available?const NavigationController(): const ConsentForm(),
                                                ),
                                              );
                                            }
                                          }
                                        : () {},
          
                                    child: Text(
                                      translations[LanguageManager().currentLanguage]!['submit']!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "JostBold",
                                        color: validOTP
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



