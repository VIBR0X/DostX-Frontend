import 'package:dostx/coping_strategy_about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'translations.dart';
import 'globals.dart';
import 'zarit_scale_page.dart';

class CopingStrategiesPage extends StatefulWidget {
  const CopingStrategiesPage({super.key});

  @override
  State<CopingStrategiesPage> createState() => _CopingStrategiesPageState();
}

class _CopingStrategiesPageState extends State<CopingStrategiesPage> {
  int modeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
            fontSize: relFont * 18,
            fontFamily: 'SFProSemiBold',
            color: ColorOptions.darkblue,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: screenHeight(context) * 0.1,
                width: screenWidth(context),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF2E3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: screenWidth(context)*0.91,
                    height: screenHeight(context) * 0.06,
                    decoration: BoxDecoration(
                        color: const Color(0xFFDBA497),
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: modeIndex==0?Color(0xFFFFFFFF):Colors.transparent,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(
                                            child: TextButton(
                                              child: Text(
                                                translations[LanguageManager().currentLanguage]!['upcoming']!,
                                                style: TextStyle(
                                                    fontSize: relFont * 12.0,
                                                    fontFamily: 'SFProMedium',
                                                    color: const Color(0xFF323736),
                                                    letterSpacing: 1.1),
                                              ),
                                              onPressed: (){
                                                setState(() {
                                                  modeIndex=0;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                  )
                              )
                          ),
                          Expanded(
                              child: Container(
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: modeIndex==1?Color(0xFFFFFFFF):Colors.transparent,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(
                                            child: TextButton(
                                              child: Text(
                                                translations[LanguageManager().currentLanguage]!['available']!,
                                                style: TextStyle(
                                                    fontSize: relFont * 12.0,
                                                    fontFamily: 'SFProMedium',
                                                    color: const Color(0xFF323736),
                                                    letterSpacing: 1.1),
                                              ),
                                              onPressed: (){setState(() {
                                                modeIndex=1;
                                              });},
                                            ),
                                          ),
                                        ),
                                      )
                                  )
                              )
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Container(
                height: screenHeight(context)*0.80 - 15,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: StrategyEntry(
                          imageUrl: "assets/image/coping (1).png",
                          title:"Grounding yourself",
                          authorName: "Dr. Vinni",
                          dateField: "Coming Soon",
                          readDurationMins: "13",
                          navigationPage: CopingStrategyAboutPage(
                            title: "The Art of Self-Love",
                            imageUrl: "assets/image/coping (2).png",
                            description: "Embracing Yourself Fully:\n Self-love is a journey that many of us embark on but few of us fully understand. It’s about more than just treating yourself or indulging in self-care rituals; it’s about developing a deep, nurturing relationship with yourself that allows you to thrive in all areas of life. Here’s how to cultivate self-love, with insights gathered from various experts and sources.\n\n Understanding Self-Love:\n Self-love is the regard for one’s own well-being and happiness. It is not merely a state of feeling good but is a state of appreciation for oneself that grows from actions supporting our physical, psychological, and spiritual growth (Good Therapy). When you love yourself, you are better equipped to make healthier choices, engage in more fulfilling relationships, and navigate the challenges of life with resilience and grace.",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: StrategyEntry(
                          imageUrl: "assets/image/coping (2).png",
                          title:"Take a break!",
                          authorName: "Dr. Gulati, MBBS",
                          dateField: "22 Aug 2022",
                          readDurationMins: "5",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: StrategyEntry(
                          imageUrl: "assets/image/coping (2).png",
                          title:"Take a break!",
                          authorName: "Dr. Gulati, MBBS",
                          dateField: "22 Aug 2022",
                          readDurationMins: "5",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: StrategyEntry(
                          imageUrl: "assets/image/coping (2).png",
                          title:"Take a break!",
                          authorName: "Dr. Gulati, MBBS",
                          dateField: "22 Aug 2022",
                          readDurationMins: "5",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: StrategyEntry(
                          imageUrl: "assets/image/coping (2).png",
                          title:"Take a break!",
                          authorName: "Dr. Gulati, MBBS",
                          dateField: "22 Aug 2022",
                          readDurationMins: "5",
                        ),
                      )


                      // USE LIST VIEW BUILDER BY USING AN ARRAY OF DATA TO DISPLAY THE DATA INTO TILES LATER


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StrategyEntry extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String authorName;
  final String dateField;
  final String readDurationMins;
  final navigationPage;
   StrategyEntry({
     super.key,
     required this.imageUrl,
     required this.title,
     required this.authorName,
     required this.dateField,
     required this.readDurationMins,
     this.navigationPage,
   });
  @override
  State<StrategyEntry> createState() => _StrategyEntryState();
}

class _StrategyEntryState extends State<StrategyEntry> {
  Color bgColor = const Color(0xFFFFFFFF);
  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return GestureDetector(
      onTapDown: (var1){
        setState(() {
          bgColor=const Color(0xFFE0EFED);
        });
      },
      onTapUp: (var1){
        setState(() {
          bgColor=const Color(0xFFFFFFFF);
        });
      },
      onTapCancel: (){
        setState(() {
          bgColor=const Color(0xFFFFFFFF);
        });
      },
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
            ),
          backgroundColor: Colors.transparent,
          elevation: 0,),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  widget.navigationPage,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: bgColor,
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          widget.imageUrl,
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
                            widget.title,
                            style: TextStyle(
                                fontSize: relFont * 15.0,
                                fontFamily: 'SFProMedium',
                                color: const Color(0xFF323736),
                                letterSpacing: 1.1),
                            // textAlign: TextAlign.center,
                          ),
                          // const SizedBox(height: 10,),
                          Text(
                            "By ${widget.authorName}",
                            style: TextStyle(
                                fontSize: relFont * 12.0,
                                fontFamily: 'SFProMedium',
                                color: const Color(0xFF9FA4A4),
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
                    width: screenWidth(context)*0.65,
                    decoration: BoxDecoration(
                      color: Color(0xFFF8FBFB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              widget.dateField,
                              style: TextStyle(
                                  fontSize: relFont * 12.0,
                                  fontFamily: 'SFProMedium',
                                  color: const Color(0xFF9FA4A4),
                                  letterSpacing: 1.1),
                              // textAlign: TextAlign.center,
                            ),
                            Text(
                              "${widget.readDurationMins} mins read",
                              style: TextStyle(
                                  fontSize: relFont * 12.0,
                                  fontFamily: 'SFProMedium',
                                  color: const Color(0xFF9FA4A4),
                                  letterSpacing: 1.1),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FBFB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 11),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: const Color(0xFFD4D4D5) )
                        ),
                        child: const SizedBox(height: 20, width: 20,),
                      )
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
