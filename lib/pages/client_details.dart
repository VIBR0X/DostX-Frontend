import 'dart:convert';

import 'package:dostx/config.dart';
import 'package:dostx/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import '../palette.dart';
import '../custom_widgets.dart';
import 'sign_up_second_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../globals.dart';
import 'package:http/http.dart' as http;

class ClientDetailsPage extends StatefulWidget {
  final Function(String, [bool]) updateSubPage;
  final Function() getPrevSubPage;
  const ClientDetailsPage({
    super.key,
    required this.updateSubPage, required this.getPrevSubPage
  });
  @override
  State<ClientDetailsPage> createState() => _ClientDetailsPageState();
}

class _ClientDetailsPageState extends State<ClientDetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _abhaIdController = TextEditingController();
  var clientProfileBox = Hive.box('ClientProfileBox');
  String? selectedGender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedGender = clientProfileBox.get('gender');
    _nameController.text = clientProfileBox.get('name')??"";
    _ageController.text = clientProfileBox.get('age')??"";
    _phoneController.text = clientProfileBox.get('phone_number')??"";
    _abhaIdController.text = clientProfileBox.get('ABHA_ID')??"";

  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: ColorOptions.skin),
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 0.36 * screenHeight(context),
                    color: Colors.transparent,
                  ),
                  Container(
                    // color: Colors.amber,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height -
                        (0.36) * screenHeight(context)-64,
              
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
                              'client_details']!,
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
                                        .currentLanguage]!['name_optional']!,
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
                                height: (37/ 896) * screenHeight(context),
                                child: TextField(
                                  controller: _nameController,
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
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          translations[LanguageManager()
                                              .currentLanguage]!['phone_number']!,
                                          style: TextStyle(
                                            color: ColorOptions.skin,
                                            fontFamily: 'JostMedium',
                                            fontSize: 13*fontHelper(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: (4 / 896) * screenHeight(context),
                                    ),
                                    SizedBox(
                                      height: (37/896)*screenHeight(context),
                                      child: TextField(
                                        controller: _phoneController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly,
                                        ],
                                        style: TextStyle(
                                          color: ColorOptions.skin,
                                          fontFamily: "JostMedium",
                                          fontSize: 18*fontHelper(context),
                                        ),
                                        cursorColor: ColorOptions.skin,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          prefix: Text('(+91) ',
                                            style: TextStyle(
                                              color: ColorOptions.skin,
                                              fontFamily: "JostMedium",
                                              fontSize: 18*fontHelper(context),
                                            ),),
                                          contentPadding:
                                              EdgeInsets.fromLTRB(10, 0, 0, 5),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintMaxLines: 1,
                                          border: const OutlineInputBorder(
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
                                          enabledBorder: const OutlineInputBorder(
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
                                          focusedBorder: const OutlineInputBorder(
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
                              Spacer(),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          translations[LanguageManager()
                                              .currentLanguage]!['age']!,
                                          style: TextStyle(
                                            color: ColorOptions.skin,
                                            fontFamily: 'JostMedium',
                                            fontSize: 13*fontHelper(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: (4 / 896) * screenHeight(context),
                                    ),
                                    SizedBox(
                                      height: (37/896)*screenHeight(context),
                                      child: TextField(
                                        controller: _ageController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly,
                                        ],
                                        style: TextStyle(
                                          color: ColorOptions.skin,
                                          fontFamily: "JostMedium",
                                          fontSize: 18*fontHelper(context),
                                        ),
                                        cursorColor: ColorOptions.skin,
                                        keyboardType: TextInputType.number,
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
                                height: (16/896)*screenHeight(context),
                                child: Row(
                                  children: [
                                    CustomRadioButton(
                                      text: translations[LanguageManager()
                                          .currentLanguage]!['male']!,
                                      value: 'M',
                                      selected: selectedGender == 'M',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'M';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CustomRadioButton(
                                      text: translations[LanguageManager()
                                          .currentLanguage]!['female']!,
                                      value: 'F',
                                      selected: selectedGender == 'F',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'F';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CustomRadioButton(
                                      text: translations[LanguageManager()
                                          .currentLanguage]!['others']!,
                                      value: 'O',
                                      selected: selectedGender == 'O',
                                      onSelect: () {
                                        setState(() {
                                          selectedGender = 'O';
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
                                height: (37/896)*screenHeight(context),
                                child: TextField(
                                  controller: _abhaIdController,
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
                              onPressed: () async {
                                var tokenBox = await Hive.box("TokenBox");
                                await clientProfileBox.put('name', _nameController.text);
                                await clientProfileBox.put('age',_ageController.text);
                                await clientProfileBox.put('phone_number',_phoneController.text);
                                await clientProfileBox.put('ABHA_ID', _abhaIdController.text);
                                await clientProfileBox.put('gender',selectedGender);
                                var uri = Uri.parse(appConfig['serverURL']+'/auth/client_signup/');
                                final response = await http.post(
                                  uri,
                                  headers: {
                                    'Content-Type':'application/json',
                                    'Authorization': 'Bearer '+await tokenBox.get("access_token")
                                  },
                                  body: json.encode({
                                    "name": _nameController.text,
                                    "phone_number": _phoneController.text,
                                    "age": int.parse(_ageController.text),
                                    "ABHA_ID": _abhaIdController.text,
                                  }),
                                );
                                print(response.statusCode);
                                if (response.statusCode == 400){
                                  final response = await http.post(
                                    uri,
                                    headers: {
                                      'Content-Type':'application/json',
                                      'Authorization': 'Bearer '+await tokenBox.get("access_token")
                                    },
                                    body: json.encode({
                                      "name": _nameController.text,
                                      "phone_number": _phoneController.text,
                                      "age": int.parse(_ageController.text),
                                      "ABHA_ID": _abhaIdController.text,
                                    }),
                                  );
                                  print(response.statusCode);
                                }
                                widget.updateSubPage("default", true);

                              //

                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           const SignUpSecond(),
                              //     ),
                              //   );
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
      );
  }
}
