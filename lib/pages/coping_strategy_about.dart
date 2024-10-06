import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../config.dart';
import '../language_manager.dart';
import '../palette.dart';
import '../translations.dart';
import '../globals.dart';

class CopingStrategyAboutPage extends StatelessWidget {
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  const CopingStrategyAboutPage({
    super.key,
    required this.updateSubPage, required this.getPrevSubPage

  });

  @override
  Widget build(BuildContext context) {
    var copeBox = Hive.box('CopeStrategyStateManagementBox');
    String lang = LanguageManager().currentLanguage;
    String description = copeBox.get(lang);
    String title = copeBox.get('title');
    String imageUrl = copeBox.get('imageUrl');
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
            // Navigator.of(context).pop();
            updateSubPage(getPrevSubPage());
          },
        ),
        title: Text(
          translations[LanguageManager().currentLanguage]!['coping_strategies']!,
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
                    Image.network(
                      appConfig["serverURL"]+'/'+imageUrl,
                      width: screenWidth(context)*0.17,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/image/coping (2).png", width: screenWidth(context)*0.17,
                        );
                      },
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
                    padding: const EdgeInsets.fromLTRB(38.0,38.0,20,38.0),
                    child: Column(
                      children: [
                        Container(
                          height: screenHeight(context)*0.4,
                          width: screenWidth(context),
                          child: RawScrollbar(
                            thumbColor: Color(0xff1A3858),
                            thickness: 8,
                            // thumbVisibility: true,
                            radius: Radius.circular(20),
                            scrollbarOrientation: ScrollbarOrientation.right,
                            interactive: true,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: SingleChildScrollView(
                                child: Text(
                                    description,
                                  style: TextStyle(
                                      fontSize: relFont * 12.0,
                                      fontFamily: 'SFProMedium',
                                      color: const Color(0xFF323736),
                                      letterSpacing: 1.1,
                                  ),
                                ),
                              ),
                            ),
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
                                onPressed: (){
                                  // Navigator.pop(context);
                                  this.updateSubPage(this.getPrevSubPage());
                                },
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
    );
  }
}