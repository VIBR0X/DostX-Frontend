import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../config.dart';
import '../language_manager.dart';
import '../palette.dart';
import '../translations.dart';
import '../globals.dart';

class CopingStrategiesPage extends StatefulWidget {
  final Function() getPrevPageIndex;
  final Function(int) updateHomeIndex;
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  final results;
  const CopingStrategiesPage({
    super.key,
    required this.updateHomeIndex,
    required this.getPrevPageIndex, required this.updateSubPage, required this.getPrevSubPage, required this.results
  });

  @override
  State<CopingStrategiesPage> createState() => _CopingStrategiesPageState();
}

class _CopingStrategiesPageState extends State<CopingStrategiesPage> {
  int modeIndex = 1;
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
            // Navigator.of(context).pop();
            widget.updateHomeIndex(widget.getPrevPageIndex());

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
                    // height: relFont * 20,
                    decoration: BoxDecoration(
                        color: const Color(0xFFDBA497),
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Center(
                                child: TextButton(
                                  onPressed: (){setState(() {
                                    modeIndex=0;
                                  });},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: modeIndex==0?const Color(0xFFFFFFFF):Colors.transparent,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          translations[LanguageManager().currentLanguage]!['upcoming']!,
                                          style: TextStyle(
                                              fontSize: relFont * 12.0,
                                              fontFamily: 'SFProMedium',
                                              color: const Color(0xFF323736),
                                              letterSpacing: 1.1),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: Center(
                                child: TextButton(
                                  onPressed: (){setState(() {
                                    modeIndex=1;
                                  });},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: modeIndex==1?const Color(0xFFFFFFFF):Colors.transparent,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          translations[LanguageManager().currentLanguage]!['available']!,
                                          style: TextStyle(
                                              fontSize: relFont * 12.0,
                                              fontFamily: 'SFProMedium',
                                              color: const Color(0xFF323736),
                                              letterSpacing: 1.1),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),            ),
            const SizedBox(height: 15),
            SizedBox(
              height: screenHeight(context)*0.765 - 62,
              child: ListView.builder(
                  itemCount: widget.results.length,
                  itemBuilder: (context, index){
                    bool availabile = widget.results[index]['availability'];
                    return (modeIndex==0 && !availabile)||(modeIndex==1 && availabile)?Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: StrategyEntry(
                        updateSubPage: widget.updateSubPage,
                        getPrevSubPage: widget.getPrevSubPage,
                        imageUrl: widget.results[index]['image'],
                        title:widget.results[index]['title'],
                        readDurationMins:widget.results[index]['expected_time_to_read'],
                        // authorName: "Dr. Gulati, MBBS",
                        dateField: DateFormat("dd MMM yyyy").format(DateTime.parse(widget.results[index]['date_added'])),
                        content_english: widget.results[index]['content_english']?? '',
                        content_hindi:widget.results[index]['content_hindi']?? '',
                        content_marathi:widget.results[index]['content_marathi']?? '',
                        navigationPage: 'individual_cope_strategy_page',
                      ),
                    ):Container();
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StrategyEntry extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String? authorName;
  final String dateField;
  final int readDurationMins;
  final String? navigationPage;
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  final String content_hindi;
  final String content_english;
  final String content_marathi;

   StrategyEntry({
     super.key,
     required this.imageUrl,
     required this.title,
     this.authorName,
     required this.dateField,
     required this.readDurationMins,
     this.navigationPage, required this.updateSubPage, required this.getPrevSubPage, required this.content_english, required this.content_hindi, required this.content_marathi
   });
  @override
  State<StrategyEntry> createState() => _StrategyEntryState();
}

class _StrategyEntryState extends State<StrategyEntry> {
  var copeBox = Hive.box('CopeStrategyStateManagementBox');
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
          borderRadius: BorderRadius.circular(20),
            ),
          backgroundColor: Colors.transparent,
          elevation: 0,),
        onPressed: ()async {
            await copeBox.put('title',widget.title);
            await copeBox.put('imageUrl',widget.imageUrl);
            await copeBox.put('hi',widget.content_hindi);
            await copeBox.put('en',widget.content_english);
            await copeBox.put('mr',widget.content_marathi);
            if (widget.navigationPage != null){
              widget.updateSubPage(widget.navigationPage!);
            }
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
                        child:
                        Image.network(
                          appConfig["serverURL"]+'/'+widget.imageUrl,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset("assets/image/coping (2).png",fit: BoxFit.contain,
                            );
                          },
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
                          (widget.authorName!=null)?Text(
                            "By ${widget.authorName}",
                            style: TextStyle(
                                fontSize: relFont * 12.0,
                                fontFamily: 'SFProMedium',
                                color: const Color(0xFF9FA4A4),
                                letterSpacing: 1.1),
                            // textAlign: TextAlign.center,
                          ):Container(),
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
                      color: const Color(0xFFF8FBFB),
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
