import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'translations.dart';
import 'globals.dart';

class PsychoEducationPage extends StatefulWidget {
  const PsychoEducationPage({super.key});

  @override
  State<PsychoEducationPage> createState() => _PsychoEducationPageState();
}

class _PsychoEducationPageState extends State<PsychoEducationPage> {
  int modeIndex = 0;
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
          'Psychoeducation',
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
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.08,
              width: screenWidth(context),
              decoration: const BoxDecoration(
                color: Color(0xFFFFF2E3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                  width: screenWidth(context)*0.91,
                  height: screenHeight(context) * 0.06,
                  decoration: BoxDecoration(
                      color: const Color(0xFFDBA497),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(6.0),
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
                )
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: screenHeight(context)*0.765 - 15,
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: PsychoEducationEntry(
                        title:"Dr. Druid Wensleydale",
                        description: "Etiam iaculis suscipit lec…",
                        // imageUrl: 'assets/image/med (2).png',
                        // tickVisible: false,
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
    );
  }
}

class PsychoEducationEntry extends StatefulWidget {
  final String? imageUrl;
  final String title;
  final String description;
  final bool tickVisible;
  final bool tickBlue;
  const PsychoEducationEntry({
    super.key,
    this.imageUrl,
    required this.title,
    required this.description,
    this.tickVisible=true,
    this.tickBlue=true,
  });

  @override
  State<PsychoEducationEntry> createState() => _PsychoEducationEntryState();
}

class _PsychoEducationEntryState extends State<PsychoEducationEntry> {
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
                  width: screenWidth(context) * 0.18,
                  height: screenWidth(context) * 0.18,
                  child:Container(
                  decoration: BoxDecoration(
                    color:  Color(widget.imageUrl != null?0xFFFFFFFF:0xFFE0EFED),
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: const Color(0xFFE0EFED),
                      // width: 1
                    )
                  ),
                  child: (widget.imageUrl!=null)?Image.asset(
                    widget.imageUrl!,
                    fit: BoxFit.contain,
                  ):null,
                ),),
                const SizedBox(width: 16.0),
                Expanded(
                  flex: 3,
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
                        widget.description,
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
                const SizedBox(width: 3,),
                Expanded(
                  flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/Icon tick.svg",
                          height: widget.tickVisible?12:0,//0.02 * screenHeight(context),
                          width: widget.tickVisible?12:0,
                          colorFilter: ColorFilter.mode(Color(widget.tickBlue?0xFFFFFFFF:0x22000000), BlendMode.modulate),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "09:00 PM",
                          style: TextStyle(
                            color: const Color(0xFFD8DCDC),
                            fontSize: relFont * 11.0,
                            fontFamily: 'SFProMedium',
                            letterSpacing: 1.1,
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}
