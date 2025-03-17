import 'dart:convert';
import 'dart:math';

import 'package:dostx/config.dart';
import 'package:dostx/language_manager.dart';
import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../globals.dart';
import '../palette.dart';

class CostEffectiveAnalysisPage extends StatefulWidget {
  final String imageUrl = "";
  final String description = "";
  final String title = "";
  final Function(String) updateSubPage;
  final Function() getPrevSubPage;
  const CostEffectiveAnalysisPage(
      {super.key, required this.updateSubPage, required this.getPrevSubPage});

  @override
  State<CostEffectiveAnalysisPage> createState() =>
      _CostEffectiveAnalysisPageState();
}

class _CostEffectiveAnalysisPageState extends State<CostEffectiveAnalysisPage> {
  var costEffectivenessBox = Hive.box('CostEffBox');
  final TextEditingController _mOPDController =
      TextEditingController(); // m for money
  final TextEditingController _nOPDController =
      TextEditingController(); // n for number or frequency
  final TextEditingController _mHospitalController = TextEditingController();
  final TextEditingController _nHospitalController = TextEditingController();
  final TextEditingController _mEmergencyController = TextEditingController();
  final TextEditingController _nEmergencyController = TextEditingController();
  final TextEditingController _mHomeCareController = TextEditingController();
  final TextEditingController _nHomeCareController = TextEditingController();

  @override
  void initState() {
    _mOPDController.text = "";
    _nOPDController.text = "";
    _mHospitalController.text = "";
    _nHospitalController.text = "";
    _mEmergencyController.text = "";
    _nEmergencyController.text = "";
    _mHomeCareController.text = "";
    _nHomeCareController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: screenHeight(context) * 0.105,
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
            widget.updateSubPage(widget.getPrevSubPage());
          },
        ),

        title: Text(
          translations[LanguageManager().currentLanguage]![
              'cost_effective_title']!,
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
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    translations[LanguageManager().currentLanguage]![
                        'hospital_based_care']!,
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
                    translations[LanguageManager().currentLanguage]!["versus"]!,
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
                    translations[LanguageManager().currentLanguage]![
                        'hospicat_center_care']!,
                    style: TextStyle(
                      fontSize: relFont * 19,
                      fontFamily: 'JostBold',
                      color: const Color(0xFFE5A194),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 4,
                    width: 42,
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0xFFE5A194)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Text(
                      translations[LanguageManager().currentLanguage]![
                          'cost_effective_text']!,
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: screenWidth(context),
                    height: 90,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x0A000000),
                              offset: Offset(0, 2),
                              blurRadius: 48,
                              spreadRadius: 100)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.c,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: min(230, screenWidth(context) * 0.5),
                                child: Text(
                                  translations[LanguageManager()
                                      .currentLanguage]!['total_visits']!,
                                  style: TextStyle(
                                    fontSize: relFont * 13,
                                    fontFamily: 'JostMedium',
                                    color: const Color(0xFFE5A194),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: min(90, screenWidth(context) * 0.3),
                                  child: TextFormField(
                                    controller: _mOPDController,
                                    // maxLines: 1,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 2,
                                          horizontal:
                                              12), // Adjust internal padding
                                      // constraints: BoxConstraints(maxHeight: 0, minWidth: 0),
                                      // alignLabelWithHint: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),

                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(2, 0,0,0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      // LengthLimitingTextInputFormatter(9)
                                    ], // Only numbers can be entered
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: min(230, screenWidth(context) * 0.5),
                                child: Text(
                                  translations[
                                          LanguageManager().currentLanguage]![
                                      'frequency_of_visits']!,
                                  style: TextStyle(
                                    fontSize: relFont * 13,
                                    fontFamily: 'JostMedium',
                                    color: const Color(0xFFE5A194),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: min(90, screenWidth(context) * 0.3),
                                  child: TextFormField(
                                    controller: _nOPDController,
                                    // maxLines: 1,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 2,
                                          horizontal:
                                              12), // Adjust internal padding
                                      // constraints: BoxConstraints(maxHeight: 0, minWidth: 0),
                                      // alignLabelWithHint: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),

                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(2, 0,0,0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      // LengthLimitingTextInputFormatter(9)
                                    ], // Only numbers can be entered
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: screenWidth(context),
                    height: 90,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x0A000000),
                              offset: Offset(0, 2),
                              blurRadius: 48,
                              spreadRadius: 100)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.c,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: min(230, screenWidth(context) * 0.5),
                                child: Text(
                                  translations[LanguageManager()
                                      .currentLanguage]!['total_amount_spent']!,
                                  style: TextStyle(
                                    fontSize: relFont * 13,
                                    fontFamily: 'JostMedium',
                                    color: const Color(0xFFE5A194),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: min(90, screenWidth(context) * 0.3),
                                  child: TextFormField(
                                    controller: _mHospitalController,
                                    // maxLines: 1,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 2,
                                          horizontal:
                                              12), // Adjust internal padding
                                      // constraints: BoxConstraints(maxHeight: 0, minWidth: 0),
                                      // alignLabelWithHint: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),

                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(2, 0,0,0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      // LengthLimitingTextInputFormatter(9)
                                    ], // Only numbers can be entered
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: min(230, screenWidth(context) * 0.5),
                                child: Text(
                                  translations[
                                          LanguageManager().currentLanguage]![
                                      'frequency_of_visits']!,
                                  style: TextStyle(
                                    fontSize: relFont * 13,
                                    fontFamily: 'JostMedium',
                                    color: const Color(0xFFE5A194),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: min(90, screenWidth(context) * 0.3),
                                  child: TextFormField(
                                    controller: _nHospitalController,
                                    // maxLines: 1,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 2,
                                          horizontal:
                                              12), // Adjust internal padding
                                      // constraints: BoxConstraints(maxHeight: 0, minWidth: 0),
                                      // alignLabelWithHint: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),

                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(2, 0,0,0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      // LengthLimitingTextInputFormatter(9)
                                    ], // Only numbers can be entered
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: screenWidth(context),
                    height: 90,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x0A000000),
                              offset: Offset(0, 2),
                              blurRadius: 48,
                              spreadRadius: 100)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.c,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: min(230, screenWidth(context) * 0.5),
                                child: Text(
                                  translations[
                                          LanguageManager().currentLanguage]![
                                      'total_amount_spent_emg']!,
                                  style: TextStyle(
                                    fontSize: relFont * 13,
                                    fontFamily: 'JostMedium',
                                    color: const Color(0xFFE5A194),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: min(90, screenWidth(context) * 0.3),
                                  child: TextFormField(
                                    controller: _mEmergencyController,
                                    // maxLines: 1,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 2,
                                          horizontal:
                                              12), // Adjust internal padding
                                      // constraints: BoxConstraints(maxHeight: 0, minWidth: 0),
                                      // alignLabelWithHint: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),

                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(2, 0,0,0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      // LengthLimitingTextInputFormatter(9)
                                    ], // Only numbers can be entered
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: min(230, screenWidth(context) * 0.5),
                                child: Text(
                                  translations[
                                          LanguageManager().currentLanguage]![
                                      'frequency_of_visits']!,
                                  style: TextStyle(
                                    fontSize: relFont * 13,
                                    fontFamily: 'JostMedium',
                                    color: const Color(0xFFE5A194),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: min(90, screenWidth(context) * 0.3),
                                  child: TextFormField(
                                    controller: _nEmergencyController,
                                    // maxLines: 1,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 2,
                                          horizontal:
                                              12), // Adjust internal padding
                                      // constraints: BoxConstraints(maxHeight: 0, minWidth: 0),
                                      // alignLabelWithHint: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),

                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(2, 0,0,0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      // LengthLimitingTextInputFormatter(9)
                                    ], // Only numbers can be entered
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: screenWidth(context),
                    height: 90,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x0A000000),
                              offset: Offset(0, 2),
                              blurRadius: 48,
                              spreadRadius: 100)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.c,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: min(230, screenWidth(context) * 0.5),
                                child: Text(
                                  translations[
                                          LanguageManager().currentLanguage]![
                                      'total_amount_spent_homecare']!,
                                  style: TextStyle(
                                    fontSize: relFont * 13,
                                    fontFamily: 'JostMedium',
                                    color: const Color(0xFFE5A194),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: min(90, screenWidth(context) * 0.3),
                                  child: TextFormField(
                                    controller: _mHomeCareController,
                                    // maxLines: 1,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 2,
                                          horizontal:
                                              12), // Adjust internal padding
                                      // constraints: BoxConstraints(maxHeight: 0, minWidth: 0),
                                      // alignLabelWithHint: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),

                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(2, 0,0,0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      // LengthLimitingTextInputFormatter(9)
                                    ], // Only numbers can be entered
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: min(230, screenWidth(context) * 0.5),
                                child: Text(
                                  translations[
                                          LanguageManager().currentLanguage]![
                                      'frequency_of_visits']!,
                                  style: TextStyle(
                                    fontSize: relFont * 13,
                                    fontFamily: 'JostMedium',
                                    color: const Color(0xFFE5A194),
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: min(90, screenWidth(context) * 0.3),
                                  child: TextFormField(
                                    controller: _nHomeCareController,
                                    // maxLines: 1,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: relFont * 13,
                                      fontFamily: 'JostMedium',
                                      color: const Color(0xFFE5A194),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 2,
                                          horizontal:
                                              12), // Adjust internal padding
                                      // constraints: BoxConstraints(maxHeight: 0, minWidth: 0),
                                      // alignLabelWithHint: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDEDEDF),
                                          width: 1.2,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),

                                      // contentPadding:
                                      // EdgeInsets.fromLTRB(2, 0,0,0),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      // LengthLimitingTextInputFormatter(9)
                                    ], // Only numbers can be entered
                                  ))
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
                    width: screenWidth(context) * 0.68,
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
                          onPressed: () async {
                            var tokenBox = await Hive.box('TokenBox');
                            costEffectivenessBox.put(
                                'amount_for_one_OPD', _mOPDController.text);
                            costEffectivenessBox.put(
                                'amount_for_one_Hospitalisation',
                                _nOPDController.text);
                            costEffectivenessBox.put('amount_for_emergency',
                                _mHospitalController.text);
                            costEffectivenessBox.put('amount_for_home_care',
                                _nHospitalController.text);
                            costEffectivenessBox.put(
                                'no_of_OPD', _mEmergencyController.text);
                            costEffectivenessBox.put('no_of_Hospitalisation',
                                _nEmergencyController.text);
                            costEffectivenessBox.put(
                                'no_of_emergency', _mHomeCareController.text);
                            costEffectivenessBox.put(
                                'no_of_home_care', _nHomeCareController.text);

                            var body = json.encode({
                              "amount_for_one_OPD":
                                  int.parse(_mOPDController.text),
                              "no_of_OPD": int.parse(_nOPDController.text),
                              "amount_for_one_Hospitalisation":
                                  int.parse(_mHospitalController.text),
                              "no_of_Hospitalisation":
                                  int.parse(_nHospitalController.text),
                              "amount_for_emergency":
                                  int.parse(_mEmergencyController.text),
                              "no_of_emergency":
                                  int.parse(_nEmergencyController.text),
                              "amount_for_home_care":
                                  int.parse(_mHomeCareController.text),
                              "no_of_home_care":
                                  int.parse(_nHomeCareController.text),
                            });

                            var response = await http.post(
                                Uri.parse(appConfig['serverURL'] +
                                    '/api/cost_effectiveness_study/'),
                                headers: {
                                  'Content-Type': 'application/json',
                                  'Authorization': 'Bearer ' +
                                      await tokenBox.get("access_token")
                                },
                                body: body);
                            if (response.statusCode == 201) {
                              widget.updateSubPage('default');
                            }
                          },
                          child: Text(
                            translations[LanguageManager().currentLanguage]![
                                'submit']!,
                            maxLines: 1, // Limiting to 1 line
                            overflow: TextOverflow
                                .ellipsis, // Using ellipsis for overflow
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
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
