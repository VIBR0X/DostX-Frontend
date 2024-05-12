import 'package:flutter/material.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'translations.dart';
import 'globals.dart';

class CopingStrategyAboutPage extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String title;
  const CopingStrategyAboutPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: screenHeight(context)*0.105,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFFFF2E3),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Coping Strategies',
          style: TextStyle(
            fontSize: relFont * 17,
            fontFamily: 'SFProSemiBold',
            color: ColorOptions.darkblue,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFAFAFA),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    children: [
                      Image.asset(
                          imageUrl,
                        width: screenWidth(context)*0.17,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Text(
                            "About:\n$title",
                          style: TextStyle(
                              fontSize: relFont * 17.0,
                              fontFamily: 'SFProMedium',
                              color: const Color(0xFF323736),
                              letterSpacing: 1.1),
                          // textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6C7BA),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                        color: Color(0x0A000000),
                        offset: Offset(0,2),
                          blurRadius: 48,
                          spreadRadius: 10,
                      )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Column(
                        children: [
                          Text(
                              description,
                            style: TextStyle(
                                fontSize: relFont * 12.0,
                                fontFamily: 'SFProMedium',
                                color: const Color(0xFF323736),
                                letterSpacing: 1.1,
                            ),
                          ),
                          SizedBox(height: screenHeight(context)*0.04,),
                          Container(
                            height: screenHeight(context) * 0.04,
                            width: screenWidth(context)*0.4,

                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: GradientOptions.signInGradient,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: null,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: Text(
                                    "PROCEED",
                                    maxLines: 1, // Limiting to 1 line
                                    overflow: TextOverflow.ellipsis, // Using ellipsis for overflow
                                    style: TextStyle(
                                      fontSize: fontHelper(context) * 11,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontFamily: 'SFProText',

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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MedicalEntry extends StatefulWidget {
  const MedicalEntry({super.key});

  @override
  State<MedicalEntry> createState() => _MedicalEntryState();
}

class _MedicalEntryState extends State<MedicalEntry> {
  String dayCategory = "Morning";
  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFFFFFFFF),
          boxShadow: const [
            BoxShadow(
                color: Color(0x0A000000),
                offset: Offset(0,2),
                blurRadius: 48,
                spreadRadius: 7
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth(context) * 0.13,
                  // height: screenHeight(context) * 0.09,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFF707070), width: 1),

                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,

                    ),
                    onPressed: (){},
                    child: Image.asset(
                      "assets/image/med (1).png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  // child: Image.asset(
                  //   "assets/image/emo_wheel.png",
                  //   fit: BoxFit.contain,
                  // ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Click to add medicine",
                        style: TextStyle(
                            fontSize: relFont * 15.0,
                            fontFamily: 'SFProMedium',
                            color: const Color(0xFF323736),
                            letterSpacing: 1.1),
                        // textAlign: TextAlign.center,
                      ),
                      // const SizedBox(height: 10,),
                      Text(
                        "By Dr._________",
                        style: TextStyle(
                            fontSize: relFont * 12.0,
                            fontFamily: 'SFProMedium',
                            color: const Color(0xFF606060),
                            letterSpacing: 1.1),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8FBFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Container(
                          decoration:  BoxDecoration(
                              color: const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(12)

                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "Morning",
                                  style: TextStyle(
                                      fontSize: relFont * 12.0,
                                      fontFamily: 'SFProMedium',
                                      color: const Color(0xFF606060),
                                      letterSpacing: 1.1),
                                  // textAlign: TextAlign.center,
                                ),
                                SizedBox(width: screenWidth(context)*0.05,),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          child: Text(
                            "01:00 - 02:30 PM",
                            style: TextStyle(
                                fontSize: relFont * 12.0,
                                fontFamily: 'SFProMedium',
                                color: const Color(0xFF606060),
                                letterSpacing: 1.1),
                            // textAlign: TextAlign.center,
                          ),
                        )
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8FBFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11),
                  child: Text(
                    "Day x0",
                    style: TextStyle(
                        fontSize: relFont * 12.0,
                        fontFamily: 'SFProMedium',
                        color: const Color(0xFF606060),
                        letterSpacing: 1.1),
                    // textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
