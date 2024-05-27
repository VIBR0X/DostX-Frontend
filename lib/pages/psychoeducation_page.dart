import 'package:dostx/config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../language_manager.dart';
import '../palette.dart';
import '../translations.dart';
import '../globals.dart';
import 'package:intl/intl.dart';

class PsychoEducationPage extends StatefulWidget {
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  final websiteList;
  const PsychoEducationPage({
    super.key,
    required this.updateSubPage,
    required this.getPrevSubPage,
    required this.websiteList,

  });

  @override
  State<PsychoEducationPage> createState() => _PsychoEducationPageState();
}

class _PsychoEducationPageState extends State<PsychoEducationPage> {
  int modeIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.websiteList);

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
            widget.updateSubPage(widget.getPrevSubPage());
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
                                        color: modeIndex==0?Color(0xFFFFFFFF):Colors.transparent,
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
                                        color: modeIndex==1?Color(0xFFFFFFFF):Colors.transparent,
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
            const SizedBox(height: 15),
            SizedBox(
              height: screenHeight(context)*0.765 - 80,
              child: ListView.builder(
                itemCount: widget.websiteList.length,
                  itemBuilder: (context, index){
                    return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(50, 30),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft
                                ),
                                onPressed: () async {
                                  final url = widget.websiteList[index]['url'];  // URL to open
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url),  mode: LaunchMode.platformDefault);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: PsychoEducationEntry(
                                  title:widget.websiteList[index]['title'],
                                  description:DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.parse(widget.websiteList[index]['date_added'])),
                                  imageUrl: appConfig["serverURL"]+widget.websiteList[index]['image'],
                                  tickVisible: widget.websiteList[index]['availability'],
                                ),
                              ),
                            );
                  }
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
                  child: (widget.imageUrl!=null)?Image.network(
                    widget.imageUrl!,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(decoration: BoxDecoration(
                        color: const Color(0xFFE0EFED),
                        borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                      color: const Color(0xFFE0EFED),),));},
                    fit: BoxFit.fill,
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
