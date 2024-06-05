import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import '../CustomRouteBuilder.dart';
import '../palette.dart';
import '../custom_widgets.dart';
import 'sign_up_fourth_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
import '../globals.dart';

class SignUpThird extends StatefulWidget {
  final bool isProfileEdit;
  const SignUpThird({super.key, this.isProfileEdit = false});

  @override
  State<SignUpThird> createState() => _SignUpThirdState();
}

class _SignUpThirdState extends State<SignUpThird> {
  String? maritalStatus;
  String? relation;
  final TextEditingController _illnessDurationController = TextEditingController();
  final TextEditingController _hoursSpentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    var profileBox = Hive.box('ProfileBox');
    if (widget.isProfileEdit){
      _hoursSpentController.text = profileBox.get('mean_duration_of_care');
      _illnessDurationController.text = profileBox.get('mean_duration_of_illness');
      maritalStatus = profileBox.get('marital_status');
      relation = profileBox.get('cater_client_relationship');
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                    height: (0.36) * screenHeight(context),
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
                        SizedBox(
                          height: (39 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 299,
                          height: (77 / 896) * screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager()
                                                .currentLanguage]![
                                            'marital_status']! +
                                        ":",
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 14 * fontHelper(context),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (8 / 896) * screenHeight(context),
                              ),
                              SizedBox(
                                height: (47 / 896) * screenHeight(context),
                                // width: 280,
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomRadioButton(
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'married']!,
                                              font: 14 * fontHelper(context),
                                              value: 'Married',
                                              selected:
                                                  maritalStatus == 'Married',
                                              onSelect: () {
                                                setState(() {
                                                  maritalStatus = 'Married';
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            CustomRadioButton(
                                              font: 14 * fontHelper(context),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'widowed']!,
                                              value: 'Widowed',
                                              selected:
                                                  maritalStatus == 'Widowed',
                                              onSelect: () {
                                                setState(() {
                                                  maritalStatus = 'Widowed';
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomRadioButton(
                                              font: 14 * fontHelper(context),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'unmarried']!,
                                              value: 'Unmarried',
                                              selected:
                                                  maritalStatus == 'Unmarried',
                                              onSelect: () {
                                                setState(() {
                                                  maritalStatus = 'Unmarried';
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            CustomRadioButton(
                                              font: 14 * fontHelper(context),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'cohabitant']!,
                                              value: 'Co-habitant',
                                              selected: maritalStatus ==
                                                  'Co-habitant',
                                              onSelect: () {
                                                setState(() {
                                                  maritalStatus = 'Co-habitant';
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomRadioButton(
                                              font: 14 * fontHelper(context),
                                              text: translations[
                                                      LanguageManager()
                                                          .currentLanguage]![
                                                  'separated']!,
                                              value: 'Seperated',
                                              selected:
                                                  maritalStatus == 'Seperated',
                                              onSelect: () {
                                                setState(() {
                                                  maritalStatus = 'Seperated';
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   // height: (5 / 896) * screenHeight(context),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (12 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 299,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 247,
                                height: (110 / 896) * screenHeight(context),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          translations[LanguageManager()
                                                      .currentLanguage]![
                                                  'relation_of_carer']! +
                                              ":",
                                          style: TextStyle(
                                            color: ColorOptions.skin,
                                            fontFamily: 'JostMedium',
                                            fontSize: 14 * fontHelper(context),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          (8 / 896) * screenHeight(context),
                                    ),
                                    SizedBox(
                                      height:
                                          (80 / 896) * screenHeight(context),
                                      width: 247,
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
                                                    font: 13 *
                                                        fontHelper(context),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'either_parents']!,
                                                    value: 'Either Parent',
                                                    selected: relation ==
                                                        'Either Parent',
                                                    onSelect: () {
                                                      setState(() {
                                                        relation =
                                                            'Either Parent';
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomRadioButton(
                                                    font: 13 *
                                                        fontHelper(context),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'spouse']!,
                                                    value: 'Spouse',
                                                    selected:
                                                        relation == 'Spouse',
                                                    onSelect: () {
                                                      setState(() {
                                                        relation = 'Spouse';
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomRadioButton(
                                                    font: 13 *
                                                        fontHelper(context),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'sibling']!,
                                                    value: 'Sibling',
                                                    selected:
                                                        relation == 'Sibling',
                                                    onSelect: () {
                                                      setState(() {
                                                        relation = 'Sibling';
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: screenWidth(context) *
                                                    30 /
                                                    414,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomRadioButton(
                                                    font: 13 *
                                                        fontHelper(context),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'relative']!,
                                                    value: 'Relative',
                                                    selected:
                                                        relation == 'Relative',
                                                    onSelect: () {
                                                      setState(() {
                                                        relation = 'Relative';
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomRadioButton(
                                                    font: 13 *
                                                        fontHelper(context),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'friend']!,
                                                    value: 'Friend',
                                                    selected:
                                                        relation == 'Friend',
                                                    onSelect: () {
                                                      setState(() {
                                                        relation = 'Friend';
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  CustomRadioButton(
                                                    font: 13 *
                                                        fontHelper(context),
                                                    text: translations[
                                                            LanguageManager()
                                                                .currentLanguage]![
                                                        'non_relation']!,
                                                    value: 'Non Relative',
                                                    selected: relation ==
                                                        'Non Relative',
                                                    onSelect: () {
                                                      setState(() {
                                                        relation =
                                                            'Non Relative';
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
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
                        SizedBox(
                          height: (8 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 299,
                          height: (72 / 896) * screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[
                                            LanguageManager().currentLanguage]![
                                        'mean_duration_of_illness']!,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 14 * fontHelper(context),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (4 / 896) * screenHeight(context),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: (26 / 896) * screenHeight(context),
                                    width: 94.91,
                                    child: TextField(
                                      controller: _illnessDurationController,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      style: TextStyle(
                                        color: Color(
                                          0xFF707070,
                                        ),
                                        fontFamily: "JostMedium",
                                        fontSize: 14 * fontHelper(context),
                                      ),
                                      cursorColor: Color(
                                        0xFF707070,
                                      ),
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (11 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 299,
                          height: (72 / 896) * screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager()
                                        .currentLanguage]!['mean_hours_spent']!,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 14 * fontHelper(context),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (5 / 896) * screenHeight(context),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: (26 / 896) * screenHeight(context),
                                    width: 94.91,
                                    child: TextField(
                                      controller: _hoursSpentController,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      style: TextStyle(
                                        color: Color(
                                          0xFF707070,
                                        ),
                                        fontFamily: "JostMedium",
                                        fontSize: 14 * fontHelper(context),
                                      ),
                                      cursorColor: Color(
                                        0xFF707070,
                                      ),
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (40 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          height: (43 / 896) * screenHeight(context),
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
                                var profileBox = Hive.box("ProfileBox");
                                profileBox.put("mean_duration_of_care", _hoursSpentController.text??"");
                                profileBox.put("mean_duration_of_illness", _illnessDurationController.text??"");
                                profileBox.put("marital_status",maritalStatus??"");
                                profileBox.put("cater_client_relationship", relation??"");

                                Navigator.push(
                                  context,
                                  createCustomPageRoute(SignUpFourth(isProfileEdit: widget.isProfileEdit,), context, transitionType: 'slide-in-left')

                                );
                              },
                              child: Text(
                                translations[LanguageManager()
                                    .currentLanguage]!['proceed']!,
                                style: TextStyle(
                                  fontSize: 14 * fontHelper(context),
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
