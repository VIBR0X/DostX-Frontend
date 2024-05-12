import 'package:dostx/family_burden_scale_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_widgets.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'translations.dart';
import 'globals.dart';


class FamilyBurdenResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Navigator.of(context).pop();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.19,
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
                                Text(
                                  "${translations[LanguageManager().currentLanguage]!['about']!} :",
                                  style: TextStyle(
                                      fontSize: relFont * 15,
                                      fontFamily: 'SFProMedium',
                                      color: Color(0xFF323736),
                                      letterSpacing: 1.1),
                                  // textAlign: TextAlign.center,
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
                          translations[LanguageManager().currentLanguage]![
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
                            onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  FamilyBurdenScalePage(),
                              ),
                            );},
                            child: Text(
                              translations[LanguageManager().currentLanguage]![
                              'retake']!,
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


            // USE LIST VIEW BUILDER BY USING AN ARRAY OF DATA TO DISPLAY THE DATA INTO TILES LATER

            ReusableTile(
              title: 'Family Burden Scale',
              author: 'By Dr. Someone Someone',
              testDate: 'Test taken on 29 Aug 2022',
              buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
              onPressed: () {

              },
            ),
            ReusableTile(
              title: 'Family Burden Scale',
              author: 'By Dr. Someone Someone',
              testDate: 'Test taken on 29 Aug 2022',
              buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
              onPressed: () {

              },
            ),
            ReusableTile(
              title: 'Family Burden Scale',
              author: 'By Dr. Someone Someone',
              testDate: 'Test taken on 29 Aug 2022',
              buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
              onPressed: () {

              },
            ),
            ReusableTile(
              title: ' Family Burden Scale',
              author: 'By Dr. Someone Someone',
              testDate: 'Test taken on 29 Aug 2022',
              buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

