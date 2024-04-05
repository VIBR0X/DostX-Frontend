import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_widgets.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'translations.dart';
import 'globals.dart';


class BriefCopeResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
        title: const Text(
          'Brief-COPE Results',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'SFProSemiBold',
            color: ColorOptions.darkblue,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        centerTitle: true,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                            child: SizedBox(
                              width: screenWidth(context) * 0.19,
                              // height: screenHeight(context) * 0.066,
                              child: Image.asset(
                                "assets/image/Image-12.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${translations[LanguageManager().currentLanguage]!['date']!} :",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'SFProMedium',
                                      color: Color(0xFF323736),
                                      letterSpacing: 1.1),
                                  // textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  translations[LanguageManager().currentLanguage]!['zarit-burden']!,
                                  style: TextStyle(
                                      fontSize: 15.0,
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
                              fontSize: 18.0,
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
                        height: 43,
                        width: screenWidth(context) * 0.4,
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
                            onPressed: () {},
                            child: Text(
                              translations[LanguageManager().currentLanguage]![
                              'retake']!,
                              style: TextStyle(
                                fontSize: 14,
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
              title: 'Brief-COPE',
              author: 'By Dr. Someone Someone',
              testDate: 'Test taken on 29 Aug 2022',
              buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
              onPressed: () {

              },
            ),
            ReusableTile(
              title: 'Brief-COPE',
              author: 'By Dr. Someone Someone',
              testDate: 'Test taken on 29 Aug 2022',
              buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
              onPressed: () {

              },
            ),
            ReusableTile(
              title: 'Brief-COPE',
              author: 'By Dr. Someone Someone',
              testDate: 'Test taken on 29 Aug 2022',
              buttonText: translations[LanguageManager().currentLanguage]!['check-result']!,
              onPressed: () {

              },
            ),
            ReusableTile(
              title: 'Brief-COPE',
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

