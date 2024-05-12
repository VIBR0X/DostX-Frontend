import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'translations.dart';
import 'globals.dart';

class CostEffectiveAnalysisPage extends StatefulWidget {
  final String imageUrl="";
  final String description="";
  final String title="";
  const CostEffectiveAnalysisPage({
    super.key,
  });

  @override
  State<CostEffectiveAnalysisPage> createState() => _CostEffectiveAnalysisPageState();
}

class _CostEffectiveAnalysisPageState extends State<CostEffectiveAnalysisPage> {
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
          'Cost Effective Analysis',
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
                const SizedBox(height: 40,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Hospital based Home care service",
                    style: TextStyle(
                      fontSize: relFont * 19,
                      fontFamily: 'JostBold',
                      color: const Color(0xFFE5A194),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "versus",
                    style: TextStyle(
                      fontSize: relFont * 19,
                      fontFamily: 'JostBold',
                      color: const Color(0xFFE5A194),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Hospital centered care",
                    style: TextStyle(
                      fontSize: relFont * 19,
                      fontFamily: 'JostBold',
                      color: const Color(0xFFE5A194),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment:Alignment.center,
                  child: SizedBox(
                    height: 4,
                    width: 42,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFE5A194)
                      ),
                    ),
                  ) ,
                ),
                const SizedBox(height: 40,),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Text(
                      "Cost-effectiveness in healthcare is a measure used to evaluate the efficiency of different healthcare interventions and services, comparing their costs to their health outcomes, typically measured in terms of quality-adjusted life years (QALYs), life years gained, or other health improvements.",
                      style: TextStyle(
                        fontSize: relFont * 13,
                        fontFamily: 'SFProTextMedium',
                        color: const Color(0xFF204267),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: screenWidth(context),
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(color: Color(0x0A000000), offset: Offset(0,2), blurRadius: 48, spreadRadius: 100)
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,25,0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.c,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total amount spent for one OPD visit",
                                style: TextStyle(
                                  fontSize: relFont * 13,
                                  fontFamily: 'JostMedium',
                                  color: const Color(0xFFE5A194),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              SizedBox(
                                width: 61,
                                height: 22.5,
                                child:Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    border: Border.all(color: const Color(0xFFDEDEDF), width: 1.2)
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(10, 0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly

                                    ], // Only numbers can be entered
                                  ),
                                )
                              )
                            ],
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "No. frequency of visits",
                                style: TextStyle(
                                  fontSize: relFont * 13,
                                  fontFamily: 'JostMedium',
                                  color: const Color(0xFFE5A194),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              SizedBox(
                                  width: 61,
                                  height: 22.5,
                                  child:Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(color: const Color(0xFFDEDEDF), width: 1.2)
                                    ),
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: relFont * 13,
                                        fontFamily: 'JostMedium',
                                        color: const Color(0xFFE5A194),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.4,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        // contentPadding:
                                        // EdgeInsets.fromLTRB(10, 0),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly

                                      ], // Only numbers can be entered
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: screenWidth(context),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(color: Color(0x0A000000), offset: Offset(0,2), blurRadius: 48, spreadRadius: 100)
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,25,0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.c,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total amount spent for one Hospitalisation",
                                style: TextStyle(
                                  fontSize: relFont * 13,
                                  fontFamily: 'JostMedium',
                                  color: const Color(0xFFE5A194),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              SizedBox(
                                  width: 61,
                                  height: 22.5,
                                  child:Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(color: const Color(0xFFDEDEDF), width: 1.2)
                                    ),
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: relFont * 13,
                                        fontFamily: 'JostMedium',
                                        color: const Color(0xFFE5A194),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.4,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        // contentPadding:
                                        // EdgeInsets.fromLTRB(10, 0),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly

                                      ], // Only numbers can be entered
                                    ),
                                  )
                              )
                            ],
                          ),
                          const SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "No. frequency of visits",
                                style: TextStyle(
                                  fontSize: relFont * 13,
                                  fontFamily: 'JostMedium',
                                  color: const Color(0xFFE5A194),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                ),
                              ),
                              SizedBox(
                                  width: 61,
                                  height: 22.5,
                                  child:Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(color: const Color(0xFFDEDEDF), width: 1.2)
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: relFont * 13,
                                        fontFamily: 'JostMedium',
                                        color: const Color(0xFFE5A194),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.4,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ], // Only numbers can be entered
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: SizedBox(
                    height: screenHeight(context) * 0.04,
                    width: screenWidth(context)*0.68,

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: GradientOptions.signInGradient,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: null,
                          ),
                          onPressed: (){},
                          child: Text(
                            "SUBMIT",
                            maxLines: 1, // Limiting to 1 line
                            overflow: TextOverflow.ellipsis, // Using ellipsis for overflow
                            style: TextStyle(
                              fontSize: fontHelper(context) * 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'JostBold',

                            ),
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
      ),
    );
  }
}