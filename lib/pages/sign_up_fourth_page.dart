// import 'dart:html';
// import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dostx/CustomRouteBuilder.dart';
import 'package:dostx/config.dart';
import 'package:dostx/custom_widgets.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import '../navigator.dart';
import 'consent_page.dart';
import '../translations.dart';
import '../language_manager.dart';
import '../globals.dart ';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // For MediaType


class SignUpFourth extends StatefulWidget {
  final bool isProfileEdit;
  const SignUpFourth({super.key, this.isProfileEdit = false});

  @override
  State<SignUpFourth> createState() => _SignUpFourthState();
}

class _SignUpFourthState extends State<SignUpFourth> {
  String? jobLoss;
  String? income;
  String? status;
  String? diagnosis;

  void initState() {
    // TODO: implement initState
    var profileBox = Hive.box('ProfileBox');
    if (widget.isProfileEdit){
      jobLoss = profileBox.get('job_loss')?'Yes':'No';
      income = profileBox.get('percieved_income_loss');
      status = profileBox.get('status_of_person_with_disorder');
      diagnosis = profileBox.get('diagnosis');
      print(income);
    }
    super.initState();
  }

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
                                          .currentLanguage]!['job_loss']!,
                                  style: TextStyle(
                                    color: ColorOptions.skin,
                                    fontFamily: 'JostMedium',
                                    fontSize: fontHelper(context) * (14),
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
                                    font: fontHelper(context) * (14),
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
                                    font: fontHelper(context) * (14),
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
                                        fontSize: fontHelper(context) * (14)),
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
                                    font: fontHelper(context) * (14),
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
                                    font: fontHelper(context) * (14),
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
                        height: (5 / 869) * screenHeight(context),
                      ),
                      SizedBox(
                        width: 299,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 299,
                              height: (82 / 869) * screenHeight(context),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        translations[LanguageManager()
                                                    .currentLanguage]![
                                                'status_of_person']!,
                                        style: TextStyle(
                                            color: ColorOptions.skin,
                                            fontFamily: 'JostMedium',
                                            fontSize: fontHelper(context) * (14)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        (5 / 869) * screenHeight(context),
                                  ),
                                  SizedBox(
                                    height:
                                        (55 / 869) * screenHeight(context),
                                    width: 299,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CustomRadioButton(
                                              font: fontHelper(context) * (14),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'at_home']!,
                                              value: 'At Home',
                                              selected: status == 'At Home',
                                              onSelect: () {
                                                setState(() {
                                                  status = 'At Home';
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              width: 60,
                                            ),
                                            CustomRadioButton(
                                              font: fontHelper(context) * (14),
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
                                          height: (8 / 869) *
                                              screenHeight(context),
                                        ),
                                        Row(
                                          children: [
                                            CustomRadioButton(
                                              font: fontHelper(context) * (14),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'intermittent_institution']!,
                                              value:
                                                  'Intermittent Institution then at home',
                                              selected: status ==
                                                  'Intermittent Institution then at home',
                                              onSelect: () {
                                                setState(() {
                                                  status =
                                                      'Intermittent Institution then at home';
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
                      // SizedBox(
                      //   height: (3 / 869) * screenHeight(context),
                      // ),
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
                                                  'diagnosis_of_person']!,
                                          style: TextStyle(
                                              color: ColorOptions.skin,
                                              fontFamily: 'JostMedium',
                                              fontSize: fontHelper(context) * (14)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          (11 / 869) * screenHeight(context),
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
                                                        fontHelper(context) * (14),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'neurological_disorder']!,
                                                    value:
                                                        'Neurological Disorder',
                                                    selected: diagnosis ==
                                                        'Neurological Disorder',
                                                    onSelect: () {
                                                      setState(() {
                                                        diagnosis =
                                                            'Neurological Disorder';
                                                      });
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomRadioButton(
                                                    font:
                                                        fontHelper(context) * (14),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'substance_abuse']!,
                                                    value: 'Substance Abuse',
                                                    selected: diagnosis ==
                                                        'Substance Abuse',
                                                    onSelect: () {
                                                      setState(() {
                                                        diagnosis =
                                                            'Substance Abuse';
                                                      });
                                                    },
                                                  ),
                                                  const SizedBox(height: 5),
                                                  CustomRadioButton(
                                                    font:
                                                        fontHelper(context) * (14),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'multiple_disorders']!,
                                                    value:
                                                        'Multiple Disorders',
                                                    selected: diagnosis ==
                                                        'Multiple Disorders',
                                                    onSelect: () {
                                                      setState(() {
                                                        diagnosis =
                                                            'Multiple Disorders';
                                                      });
                                                    },
                                                  ),
                                                  const SizedBox(height: 5),
                                                  CustomRadioButton(
                                                    font:
                                                        fontHelper(context) * (14),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'chronic_physical_disorders']!,
                                                    value:
                                                        'Chronic Physical Disorders',
                                                    selected: diagnosis ==
                                                        'Chronic Physical Disorders',
                                                    onSelect: () {
                                                      setState(() {
                                                        diagnosis =
                                                            'Chronic Physical Disorders';
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
                                                        fontHelper(context) * (14),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'depression']!,
                                                    value: 'Depression',
                                                    selected: diagnosis ==
                                                        'Depression',
                                                    onSelect: () {
                                                      setState(() {
                                                        diagnosis =
                                                            'Depression';
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(height: 5),
                                                  CustomRadioButton(
                                                    font:
                                                        fontHelper(context) * (14),
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
                                                        fontHelper(context) * (14),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'bipolar_disorder']!,
                                                    value: 'Bipolar Disorder',
                                                    selected: diagnosis ==
                                                        'Bipolar Disorder',
                                                    onSelect: () {
                                                      setState(() {
                                                        diagnosis =
                                                            'Bipolar Disorder';
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
                            onPressed: () async {
                              var profileBox = Hive.box('ProfileBox');
                              var tokenBox = Hive.box('TokenBox');
                              profileBox.put("job_loss",jobLoss=="Yes"?true:false);
                              profileBox.put("diagnosis",diagnosis??"");
                              profileBox.put("percieved_income_loss",income??"");
                              profileBox.put("status_of_person_with_disorder", status??"");
                              String endPoint = (widget.isProfileEdit)?'/auth/user_profile/':'/auth/signup/';
                              var uri = Uri.parse(appConfig["serverURL"]+endPoint);
                              var request = http.MultipartRequest((widget.isProfileEdit)?'PUT':'POST', uri);
                              request.headers['Authorization'] = 'Bearer '+tokenBox.get("access_token");

                              request.fields['consent'] = true.toString();


                              if (profileBox != null) {
                                // //print("All data in 'profileBox':");
                                for (int i = 0; i < profileBox.length; i++) {
                                  String key = profileBox.keyAt(i);
                                  // //print('Key: ${key.toString()}, Value: ${profileBox.getAt(i)}');
                                  if (key !="abha_id" && key !="profile_pic_local_path"){
                                    request.fields[key.toString()] = profileBox.getAt(i).toString();
                                  }
                                  // request.fields[profileBox.keyA]
                                }
                              }
                              String image_path = profileBox.get('profile_pic_local_path');
                              request.fields['email'] = profileBox.get('email')??'mock_email@dostx.com';
                              if(image_path!="") {
                                final File file = File(image_path);
                                final Uint8List fileBytes = await file
                                    .readAsBytes();
                                request.files.add(
                                    http.MultipartFile.fromBytes(
                                      'profile_pic',
                                      fileBytes,
                                      filename: profileBox.get('phone_number') +
                                          '-' + profileBox.get('first_name') +
                                          ' ' + profileBox.get('last_name') +
                                          '.' + image_path
                                          .split('.')
                                          .last,
                                      contentType: MediaType(
                                          'image', 'jpeg'),));
                              }
                              else{
                                final Uint8List fileBytes = (await rootBundle.load("assets/profile.png")).buffer.asUint8List();

                                request.files.add(
                                    http.MultipartFile.fromBytes(
                                      'profile_pic',
                                      fileBytes,
                                      filename: profileBox.get('phone_number').toString() +
                                          '-' + profileBox.get('first_name') +
                                          ' ' + profileBox.get('last_name') +
                                          '.png',
                                      contentType: MediaType(
                                          'image', 'jpeg'),));

                              }

                              var response = await request.send();
                              var responseData = await response.stream.bytesToString();
                              var decodedResponse = jsonDecode(responseData);
                              // print(decodedResponse);

                              print(response.statusCode);
                              if (response.statusCode == 201 || response.statusCode == 200){
                                tokenBox.put('profile_available',true);
                                for (var entry in decodedResponse['user_profile']!.entries){
                                  profileBox.put(entry.key,entry.value);
                                }
                                Navigator.pushReplacement(
                                    context,
                                    createCustomPageRoute(const NavigationController(), context)
                                );
                              }

                            },
                            child: Text(
                              translations[LanguageManager()
                                  .currentLanguage]!['proceed']!,
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
