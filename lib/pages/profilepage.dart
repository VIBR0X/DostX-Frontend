import 'package:dostx/pages/sign_up_first_page.dart';
import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../custom_widgets.dart';
import '../language_manager.dart';
import '../palette.dart';

class ProfilePage extends StatefulWidget {
  final Function(int) updateHomeIndex;
  final Function() getPrevPageIndex;
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  final results;
  const ProfilePage(
      {super.key,
      required this.updateHomeIndex,
      required this.getPrevPageIndex,
      required this.updateSubPage,
      required this.getPrevSubPage,
      required this.results});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showSettings = true;
  var tokenBox = Hive.box('TokenBox');
  var profileBox = Hive.box('ProfileBox');
  String? profile_pic_endpoint;

  @override
  void initState() {
    super.initState();
    profile_pic_endpoint = "/no-image";
    // try {
    //   profile_pic_endpoint = profileBox.get('profile_pic') ?? "/no-image";
    // } catch (e) {
    //   profile_pic_endpoint = "/no-image";
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 10),
        Text(
          translations[LanguageManager().currentLanguage]!['my_profile']!,
          style: const TextStyle(
            fontFamily: 'JostBold',
            fontSize: 18,
            color: Color(0xff204267),
          ),
        ),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 100,
            width: 100,
            child: Image.asset("assets/profile.png"),
            // Image.network(
            //   appConfig["serverURL"] + profile_pic_endpoint,
            //   errorBuilder: (context, error, stackTrace) {
            //     return Image.asset("assets/profile.png");
            //   },
            // ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          profileBox.get('full_name') ?? 'joe',
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
              color: Color(0xff204267)),
        ),
        SizedBox(height: 20),
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: RoundedOptionsToggle(
            onOptionSelected: (selectedOption) {
              setState(() {
                _showSettings = selectedOption ==
                    translations[LanguageManager().currentLanguage]![
                        'settings']!;
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: _showSettings ? _buildSettings() : _buildHistory(),
        ),
      ],
    );
  }

  Widget _buildSettings() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffFFF2E3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2.5, 15, 2.5, 0),
        child: RawScrollbar(
          thumbColor: Color(0xff1A3858),
          thickness: 12,
          thumbVisibility: false,
          radius: Radius.circular(20),
          scrollbarOrientation: ScrollbarOrientation.right,
          interactive: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  _buildSettingCard(
                      translations[LanguageManager().currentLanguage]![
                          'personal_details']!, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SignUpFirst(isProfileEdit: true),
                      ),
                    );
                  }),
                  _buildSettingCard(
                      translations[LanguageManager().currentLanguage]![
                          'c_details']!, () {
                    // Navigate to client details page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SignUpFirst(),
                    //   ),
                    // );
                    // ;
                    widget.updateSubPage("client_details");
                  }),
                  _buildSettingCard(
                      translations[LanguageManager().currentLanguage]![
                          'cost_effect']!, () {
                    // Navigate to cost effectiveness page
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context)=>const CostEffectiveAnalysisPage())
                    // );
                    widget.updateSubPage("cost_effectiveness_analysis");
                  }),
                  _buildSettingCard(
                      translations[LanguageManager().currentLanguage]![
                          'coping_strategies']!, () {
                    // Navigate to medicine reminders page
                    widget.updateHomeIndex(2);
                  }),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHistory() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffFFF2E3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: RawScrollbar(
          thumbColor: Color(0xff1A3858),
          thickness: 12,
          thumbVisibility: true,
          radius: Radius.circular(20),
          scrollbarOrientation: ScrollbarOrientation.right,
          interactive: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: ListView.builder(
                itemCount: widget.results.length,
                itemBuilder: (context, index) {
                  String type = widget.results[index]['type'];
                  var time = widget.results[index]['updated_at'] ??
                      widget.results[index]['created_at'] ??
                      widget.results[index]['taken_at'] ??
                      "-";
                  var result = widget.results[index]['score'] ??
                      widget.results[index]['result'] ??
                      widget.results[index]['cost_effectiveness'] ??
                      "No Result Found";
                  late String resultAnchor;
                  if (widget.results[index].keys.contains('score')) {
                    resultAnchor = 'Score:';
                  } else if (widget.results[index].keys
                      .contains('cost_effectiveness')) {
                    resultAnchor = 'Cost Effectiveness:';
                  } else if (widget.results[index].keys.contains('result')) {
                    resultAnchor = 'Result:';
                  } else {
                    resultAnchor = "";
                  }

                  return Container(
                    child: ReusableTile(
                      title: translations[LanguageManager().currentLanguage]![
                          (type == 'family_burden_scale')
                              ? 'family_burden_scale_form_title'
                              : (type == 'zarit_scale')
                                  ? 'zarit_scale_form_title'
                                  : (type == 'emotional_wheel')
                                      ? 'emotional_wheel_form_title'
                                      : (type == 'cost_effectiveness')
                                          ? 'cost_effect'
                                          : 'brief_cope_form_title']!,
                      author: (type == 'family_burden_scale')
                          ? 'By Dr. Pai and Dr. Kapur'
                          : (type == 'zarit_scale')
                              ? 'By Dr. Zarit'
                              : (type == 'emotional_wheel')
                                  ? 'By Dr. Robert Plutchik'
                                  : (type == 'cost_effectiveness')
                                      ? ''
                                      : 'By Dr. Carver and Dr. Scheier',
                      testDate: (time == "-")
                          ? "-"
                          : DateFormat("dd MMM yyyy")
                              .format(DateTime.parse(time)),
                      buttonText: translations[
                          LanguageManager().currentLanguage]!['check-result']!,
                      onPressed: () {
                        //print(widget.results[index]);
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('$resultAnchor $result'),
                                ));
                        // setState(() {
                        // });
                      },
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryCard(
      String text, String doctor, String date, VoidCallback tap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 14, fontFamily: 'SFProMedium'),
                ),
              ],
            ),
            Row(
              children: [
                Text(doctor,
                    style:
                        const TextStyle(fontSize: 14, fontFamily: 'SFProText')),
              ],
            ),
            Row(
              children: [
                Text(date,
                    style:
                        const TextStyle(fontSize: 14, fontFamily: 'SFProText')),
                Spacer(),
                SizedBox(
                  height: 43,
                  width: 100,
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
                      onPressed: tap,
                      child: const Text(
                        "Check Result",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'SFProText'),
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

Widget _buildSettingCard(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 14, fontFamily: 'SFProMedium'),
            ),
            const SizedBox(height: 5),
            Text(
              translations[LanguageManager().currentLanguage]!['click_edit']!,
              style: const TextStyle(
                  fontSize: 12, color: Colors.grey, fontFamily: 'SFProText'),
            ),
          ],
        ),
      ),
    ),
  );
}

class RoundedOptionsToggle extends StatefulWidget {
  final Function(String) onOptionSelected;

  const RoundedOptionsToggle({Key? key, required this.onOptionSelected})
      : super(key: key);

  @override
  _RoundedOptionsToggleState createState() => _RoundedOptionsToggleState();
}

class _RoundedOptionsToggleState extends State<RoundedOptionsToggle> {
  bool _isProfileSelected = true; // Initially profile is selected

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOption(
            translations[LanguageManager().currentLanguage]!['settings']!,
            _isProfileSelected),
        const SizedBox(width: 2),
        _buildOption(
            translations[LanguageManager().currentLanguage]!['assessment']!,
            !_isProfileSelected),
      ],
    );
  }

  Widget _buildOption(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        widget.onOptionSelected(text);
        setState(() {
          _isProfileSelected = text ==
              translations[LanguageManager().currentLanguage]!['settings']!;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 41),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        decoration: BoxDecoration(
          gradient: isSelected ? GradientOptions.signInGradient : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
