import 'package:dostx/config.dart';
import 'package:dostx/pages/sign_up_first_page.dart';
import 'package:dostx/pages/sign_up_third_page.dart';
import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../custom_widgets.dart';
import '../language_manager.dart';
import '../palette.dart';
import 'cost_effective_analysis_page.dart';
import 'short12.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  final Function(int) updateHomeIndex;
  final Function() getPrevPageIndex;
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  final results;
  const ProfilePage({
    super.key,
    required this.updateHomeIndex,
    required this.getPrevPageIndex,
    required this.updateSubPage,
    required this.getPrevSubPage,
    required this.results

  });

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
    // TODO: implement initState
    super.initState();
    try{
      profile_pic_endpoint= profileBox.get('profile_pic')??"/no-image";
    }
    catch (e) {
      profile_pic_endpoint="/no-image";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 10),
        Text(
          "My Profile",
          style: TextStyle(
            fontFamily: 'JostBold',
            fontSize: 18,
            color: Color(0xff204267),
          ),
        ),
        SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 100,
            width: 100,
            child: Image.network(
                appConfig["serverURL"]+profile_pic_endpoint,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/profile.png");
              },

            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          profileBox.get('full_name')??'joe',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
              color: Color(0xff204267)),
        ),
        Text(
          profileBox.get('email')??'your.email@example.com',
          style: TextStyle(
              fontSize: 14, fontFamily: 'Poppins', color: Color(0xff204267)),
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
                _showSettings = selectedOption == 'Settings';
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
        padding: const EdgeInsets.fromLTRB(0, 15, 28.5, 0),
        child: RawScrollbar(
          thumbColor: Color(0xff1A3858),
          thickness: 19.78,
          thumbVisibility: true,
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
                  _buildSettingCard('Personal Details', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpFirst(),
                      ),
                    );
                  }),
                  _buildSettingCard('Client Details', () {
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
                  _buildSettingCard('Cost Effectiveness', () {
                    // Navigate to cost effectiveness page
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context)=>const CostEffectiveAnalysisPage())
                    // );
                    widget.updateSubPage("cost_effectiveness_analysis");
                  }),
                  _buildSettingCard('Medicine Reminders', () {
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
      decoration: BoxDecoration(
        color: Color(0xffFFF2E3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
        child: RawScrollbar(
          thumbColor: Color(0xff1A3858),
          thickness: 19.78,
          thumbVisibility: true,
          radius: Radius.circular(20),
          scrollbarOrientation: ScrollbarOrientation.right,
          interactive: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5,0,28,0),
            child: ListView.builder(
                itemCount: widget.results.length,
                itemBuilder: (context, index){
                  String type = widget.results[index]['type'];
                  var time =  widget.results[index]['updated_at']??widget.results[index]['created_at']??widget.results[index]['taken_at']??"-";
                  var result = widget.results[index]['score']??widget.results[index]['result']??widget.results[index]['cost_effectiveness']??"No Result Found";
                  late String resultAnchor;
                  if (widget.results[index].keys.contains('score')) {
                    resultAnchor = 'Score:';
                  } else if (widget.results[index].keys.contains('cost_effectiveness')) {
                    resultAnchor = 'Cost Effectiveness:';
                  } else if (widget.results[index].keys.contains('result')) {
                    resultAnchor = 'Result:';
                  } else {
                    resultAnchor = "";
                  }

                  return Container(
                    child: ReusableTile(
                      title: (type=='family_burden_scale')?'Family Burden Scale':(type == 'zarit_scale')?'Zarit Scale':(type=='emotional_wheel')?'The Emotional Wheel Scale':(type=='cost_effectiveness')?'Cost Effectiveness Analysis':'Brief-COPE',
                      author: 'By Dr. Someone Someone',
                      testDate:(time == "-")?"-":DateFormat("dd MMM yyyy").format(DateTime.parse(time)),
                      buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
                      onPressed: () {
                        print(widget.results[index]);
                        showDialog(context: context,
                            builder: (context)=> AlertDialog(
                              title: Text('$resultAnchor $result'),
                            )
                        );
                        // setState(() {
                        // });
                      },
                    ),
                  );
                }
            ),
            // ListView(
            //   children: [
            //
            //     Padding(
            //       padding: const EdgeInsets.fromLTRB(5,0,28,0),
            //       child: ReusableTile(
            //         title: 'Zarit Scale',
            //         author: 'By Dr. Someone Someone',
            //         testDate: '29 Aug 2022',
            //         buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
            //         onPressed: () {
            //
            //         },
            //       ),
            //     ),
            //   ],
            // ),
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
                    style: TextStyle(fontSize: 14, fontFamily: 'SFProText')),
              ],
            ),
            Row(
              children: [
                Text(date,
                    style: TextStyle(fontSize: 14, fontFamily: 'SFProText')),
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
                      child: Text(
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
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 14, fontFamily: 'SFProMedium'),
            ),
            SizedBox(height: 5),
            Text(
              "Click to Edit",
              style: TextStyle(
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
        _buildOption('Settings', _isProfileSelected),
        SizedBox(width: 2),
        _buildOption('Assessment', !_isProfileSelected),
      ],
    );
  }

  Widget _buildOption(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        widget.onOptionSelected(text);
        setState(() {
          _isProfileSelected = text == 'Settings';
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 41),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
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
