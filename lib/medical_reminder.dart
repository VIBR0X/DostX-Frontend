import 'package:flutter/material.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'translations.dart';
import 'globals.dart';

class MedicalReminderPage extends StatefulWidget {
  final Function() getPrevPageIndex;
  final Function(int) updateHomeIndex;
  const MedicalReminderPage({
    super.key,
    required this.updateHomeIndex,
    required this.getPrevPageIndex,
  });

  @override
  State<MedicalReminderPage> createState() => _MedicalReminderPageState();
}

class _MedicalReminderPageState extends State<MedicalReminderPage> {
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
            //Navigator.of(context).pop();
            widget.updateHomeIndex(widget.getPrevPageIndex());
          },
        ),
        title: Text(
          'Medical Reminders',
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
                    padding: EdgeInsets.all(6.0),
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
            Container(
              height: screenHeight(context)*0.765 - 62,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0EFED),
                          borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x0A000000),
                                  offset: Offset(0,2),
                                  blurRadius: 48,
                                  spreadRadius: 10
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
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: MedicalEntry(
                        title: "ABC Syrup - 10 ml",
                        doctor: "Suresh",
                        dayx:2,
                        imageUrl: "assets/image/med (2).png",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: MedicalEntry(
                        title: "ABC Syrup - 10 ml",
                        doctor: "Suresh",
                        dayx:2,
                        imageUrl: "assets/image/med (2).png",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: MedicalEntry(
                        title: "ABC Syrup - 10 ml",
                        doctor: "Suresh",
                        dayx:2,
                        imageUrl: "assets/image/med (2).png",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: MedicalEntry(
                        title: "ABC Syrup - 10 ml",
                        doctor: "Suresh",
                        dayx:2,
                        imageUrl: "assets/image/med (2).png",
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

class MedicalEntry extends StatefulWidget {
  final String title;
  final String? doctor;
  final int dayx;
  final String imageUrl;
  const MedicalEntry({
    super.key,
    required this.title,
    this.doctor,
    required this.dayx,
    required this.imageUrl,
  });

  @override
  State<MedicalEntry> createState() => _MedicalEntryState();
}

class _MedicalEntryState extends State<MedicalEntry> {
  String dayCategory = "Morning";
  TimeOfDay time1 = TimeOfDay.now();
  TimeOfDay time2 = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked1 = await showTimePicker(
      // barrierLabel: "Hi",
      initialEntryMode: TimePickerEntryMode.inputOnly,
      context: context,
      initialTime: time1,
      helpText: "Select start time"
    )??time1;

    final TimeOfDay picked2 = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.inputOnly,
        context: context,
        initialTime: time2,
        helpText: "Select end time"
    )??time2;

      setState(() {
        time1 = picked1;
        time2 =(picked2.hour+picked2.minute/60.0 > picked1.hour+picked2.minute/60.0)?picked2:time1;
        });
  }

  bool imagePickerOn = false;

  // String medicineName = widget.title;

  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
                        onPressed: (){
                          setState(() {
                            imagePickerOn = !imagePickerOn;

                          });
                        },
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
                            "By Dr. ${widget.doctor??"_________"}",
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
                                  borderRadius: BorderRadius.circular(18)

                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: DropdownButton<String>(

                                  // itemHeight: 1000,
                                  // menuMaxHeight: 300,
                                  // alignment: Alignment.bottomCenter,
                                  iconEnabledColor: Color(0xFF4D4D4D),
                                  elevation: 0,
                                  // isExpanded: true, // Allow the dropdown to expand to fit the parent
                                  underline: null, // Remove the default underline
                                  value: dayCategory,
                                  iconSize: 25,
                                  isDense: true,
                                  style: TextStyle(
                                      fontSize: relFont * 12.0,
                                      fontFamily: 'SFProMedium',
                                      color: const Color(0xFF606060),
                                      letterSpacing: 1.1),
                                  items: ["Morning","Afternoon","Evenining"].map<DropdownMenuItem<String>>(
                                      (String value){
                                        return DropdownMenuItem<String>(

                                          value: value,
                                          child: Text(
                                              value,
                                          ),
                                        );
                                      }
                                  ).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dayCategory = value!;
                                    });
                                  },
                                ),
                              )
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: (){
                              _selectTime(context);
                            },
                            child: Text(
                              "${time1.format(context).replaceAll(RegExp('[A-Z]'),'')} - ${time2.format(context)}",
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
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF8FBFB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                      child: Center(
                        child: Text(
                          "Day x${widget.dayx}",
                          style: TextStyle(
                              fontSize: relFont * 12.0,
                              fontFamily: 'SFProMedium',
                              color: const Color(0xFF606060),
                              letterSpacing: 1.1),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
        imagePickerOn?
        Positioned(
          top: -40,
          left: 30,
          child: Container(
            // height: 80,
            // width: screenWidth(context) * 0.15,
            decoration: BoxDecoration(
                color: Colors.white,
              border: Border.all(color: const Color(0xFF707070), width: 1),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                      onPressed: (){
                        imagePickerOn = true;
                      },
                      child: Image.asset(
                        "assets/image/med (1).png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
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
                      onPressed: (){
                        imagePickerOn = true;
                      },
                      child: Image.asset(
                        "assets/image/med (2).png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
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
                      onPressed: (){
                        imagePickerOn = true;
                      },
                      child: Image.asset(
                        "assets/image/med (3).png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
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
                      onPressed: (){
                        imagePickerOn = true;
                      },
                      child: Image.asset(
                        "assets/image/med (4).png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            :Container()
      ],
    );
  }
}
