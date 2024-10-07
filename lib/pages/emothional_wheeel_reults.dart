import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../custom_widgets.dart';
import '../language_manager.dart';
import '../palette.dart';
import '../translations.dart';
import '../globals.dart';

class EmotionalWheelResultsPage extends StatefulWidget {
  final Function() getPrevSubPage;
  final Function(String, [bool]) updateSubPage;
  final results;
  const EmotionalWheelResultsPage({
    super.key,
    required this.updateSubPage,
    required this.getPrevSubPage,
    required this.results
  });
  @override
  State<EmotionalWheelResultsPage> createState() => _EmotionalWheelResultsPageState();
}

class _EmotionalWheelResultsPageState extends State<EmotionalWheelResultsPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    //print(widget.results);
    double relFont = fontHelper(context);
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: screenHeight(context)*0.105,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFFFF2E3),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.of(context).pop();
            widget.updateSubPage(widget.getPrevSubPage());
          },
        ),
        title: Text(
          translations[LanguageManager().currentLanguage]!['emotional_wheel_title']!,
          style: TextStyle(
            fontSize: relFont * 17,
            fontFamily: 'SFProSemiBold',
            color: ColorOptions.darkblue,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight(context) * 0.13,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF2E3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFE0EFED),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth(context) * 0.15,
                          height: screenHeight(context) * 0.066,
                          // child: SvgPicture.asset(
                          //   'assets/svg/Icon-10.svg',
                          //   fit: BoxFit.contain,
                          // ),
                          child: Image.asset(
                            "assets/image/emo_wheel.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${translations[LanguageManager().currentLanguage]!['date']!}: ",
                                    style: TextStyle(
                                        fontSize: relFont * 15.0,
                                        fontFamily: 'SFProMedium',
                                        color: Color(0xFF323736),
                                        letterSpacing: 1.1),
                                    // textAlign: TextAlign.center,
                                  ),
                                  Text(
                                      (selectedIndex>=0)?DateFormat("dd MMM yyyy").format(DateTime.parse(widget.results[selectedIndex]['taken_at'])):translations[LanguageManager().currentLanguage]!['select_result']!,
                                    style: TextStyle(
                                        fontSize: relFont * 15.0,
                                        fontFamily: 'SFProMedium',
                                        color: Color(0xFF323736),
                                        letterSpacing: 1.1),
                                    // textAlign: TextAlign.center,
                                  ),

                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(
                                  translations[LanguageManager().currentLanguage]!['emotional_wheel_results']!,
                                style: TextStyle(
                                    fontSize: relFont * 15.0,
                                    fontFamily: 'SFProMedium',
                                    color: Color(0xFF323736),
                                    letterSpacing: 1.1),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        (selectedIndex>=0)?widget.results[selectedIndex]['result']:translations[LanguageManager().currentLanguage]![
                        'assessment-text']!,
                        style: TextStyle(
                            fontSize: relFont * 18.0,
                            fontFamily: 'SFProText',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF323736),
                            letterSpacing: 1.3
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: SizedBox(
                      height: screenHeight(context) * (38 / 895),
                      width: screenWidth(context) * (150 / 419),
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
                          //   Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>  EmotionalWheel(),
                          //   ),
                          // );
                            widget.updateSubPage('emotional_wheel_1');
                            },
                          child: Text(
                              (widget.results.length==0)?translations[LanguageManager().currentLanguage]!['proceed']! : translations[LanguageManager().currentLanguage]!['retake']!,
                            style: TextStyle(
                              fontSize: relFont * 14,
                              fontFamily: "JostBold",
                              color: Colors.white,
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
          // USE LIST VIEW BUILDER BY USING AN ARRAY OF DATA TO DISPLAY THE DATA INTO TILES LATER
          SizedBox(
            height: screenHeight(context)*0.49,
            width: screenWidth(context),
            child: ListView.builder(
                itemCount: widget.results.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index){
                  return Container(
                    child: ReusableTile(
                      title: translations[LanguageManager().currentLanguage]!['emotional_wheel_results']!,
                      author: 'By Dr. Robert Plutchik',
                      testDate:DateFormat("dd MMM yyyy").format(DateTime.parse(widget.results[index]['taken_at'])),
                      buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}

