import 'package:dostx/pages/family_burden_scale_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../custom_widgets.dart';
import '../language_manager.dart';
import '../palette.dart';
import '../translations.dart';
import '../globals.dart';

class FamilyBurdenResultsPage extends StatefulWidget {
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  final results;
  const FamilyBurdenResultsPage({
    super.key,
    required this.updateSubPage, required this.getPrevSubPage, required this.results
  });
  @override
  State<FamilyBurdenResultsPage> createState() => _FamilyBurdenResultsPageState();
}

class _FamilyBurdenResultsPageState extends State<FamilyBurdenResultsPage> {
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
          'Family Burden Scale Results',
          style: TextStyle(
            fontSize: relFont * 15,
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
                          width: screenWidth(context) * 0.19,
                          // height: screenHeight(context) * 0.066,
                          // child: SvgPicture.asset(
                          //   "assets/svg/Image-1.svg",
                          //   fit: BoxFit.contain,
                          // ),
                          child: Image.asset(
                            "assets/image/Image-1.png",
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
                                    "${translations[LanguageManager().currentLanguage]!['date']!} :",
                                    style: TextStyle(
                                        fontSize: relFont * 15,
                                        fontFamily: 'SFProMedium',
                                        color: Color(0xFF323736),
                                        letterSpacing: 1.1),
                                    // textAlign: TextAlign.center,
                                  ),
                                  Text((selectedIndex>=0)?DateFormat("dd MMM yyyy").format(DateTime.parse(widget.results[selectedIndex]['updated_at'])):"Please select a result",
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
                                translations[LanguageManager().currentLanguage]!['family_burden_results']!,
                                style: TextStyle(
                                    fontSize: relFont * 15,
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
                        (selectedIndex>=0)?"Your Score: ${widget.results[selectedIndex]['score']}":translations[LanguageManager().currentLanguage]![
                        'assessment-text']!,
                        style: TextStyle(
                            fontSize: relFont * 20,
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
                            widget.updateSubPage("family_burden_1");
                            },
                          child: Text(
                            (widget.results.length==0)?translations[LanguageManager().currentLanguage]!['proceed']! : translations[LanguageManager().currentLanguage]!['retake']!,
                            style: TextStyle(
                              fontSize: relFont * 12,
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
          SizedBox(
            height: screenHeight(context)*0.47,
            width: screenWidth(context),
            child: ListView.builder(
                itemCount: widget.results.length,
                itemBuilder: (context, index){
                  return Container(
                    child: ReusableTile(
                      title: 'Family Burden Scale',
                      author: 'By Dr. Someone Someone',
                      testDate:DateFormat("dd MMM yyyy").format(DateTime.parse(widget.results[index]['updated_at'])),
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

