import 'dart:convert';

import 'package:dostx/config.dart';
import 'package:dostx/pages/brief_cope_page.dart';
import 'package:dostx/pages/brief_cope_results_page.dart';
import 'package:dostx/pages/client_details.dart';
import 'package:dostx/pages/cope.dart';
import 'package:dostx/pages/coping_strategies_page.dart';
import 'package:dostx/pages/coping_strategy_about.dart';
import 'package:dostx/pages/cost_effective_analysis_page.dart';
import 'package:dostx/pages/emothional_wheeel_reults.dart';
import 'package:dostx/pages/emotional_wheel.dart';
import 'package:dostx/pages/emotional_wheel_2.dart';
import 'package:dostx/pages/family_burden_results_page.dart';
import 'package:dostx/pages/family_burden_scale_page.dart';
import 'package:dostx/pages/familyburden.dart';
import 'package:dostx/pages/homePage.dart';
import 'package:dostx/pages/medical_reminder.dart';
import 'package:dostx/pages/psychoeducation_page.dart';
import 'package:dostx/pages/short12.dart';
import 'package:dostx/pages/zarit_burden_results_page.dart';
import 'package:dostx/pages/zarit_scale_page.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import 'globals.dart';
import 'language_manager.dart';
import 'pages/profilepage.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int _selectedIndex = 0;
  int _previousIndex = 1;
  String _selectedSubPage = "default";
  String _previousSubPage = "default";
  List<String> _previousSubPageTrack = ["default"];
  var tokenBox = Hive.box('TokenBox');

  void _refreshToken() async {
    DateTime? lastRefreshTime = await tokenBox.get('last_access_refresh_time');
    if (lastRefreshTime == null ||
        (DateTime.now().difference(lastRefreshTime).inMinutes >= 30)) {
      //print('token is refreshed');
      var response = await http.post(
          Uri.parse(appConfig["serverURL"] + '/auth/tokenrefresh/'),
          body: json.encode({"refresh": tokenBox.get('refresh_token')}),
          headers: {
            'Content-Type': 'application/json',
          });
      var data = jsonDecode(response.body);
      var accessToken = data['access'];
      //print(accessToken);
      await tokenBox.put('access_token', accessToken);
      await tokenBox.put('last_access_refresh_time', DateTime.now());
    }
  }

  void _updateNavigation(int index) async {
    _refreshToken();
    _previousIndex = _selectedIndex;
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateSubPage(String pageName, [bool overrideTrack = false]) {
    _refreshToken();
    if (overrideTrack) {
      _previousSubPageTrack = <String>["default"];
      _previousSubPage = "default";
      setState(() {
        _selectedSubPage = pageName;
      });
    } else {
      if (_previousSubPageTrack.isEmpty) {
        _previousSubPageTrack.add("default");
      }

      if (pageName != _previousSubPage) {
        _previousSubPage = _selectedSubPage;
        _previousSubPageTrack.add(_previousSubPage);
        setState(() {
          _selectedSubPage = pageName;
        });
      } else {
        if (_previousSubPageTrack.length > 1) {
          _previousSubPageTrack.removeLast();
        }
        _previousSubPage = _previousSubPageTrack.last;
        setState(() {
          _selectedSubPage = pageName;
        });
      }
    }
  }

  int _getPrevIndex() {
    return _previousIndex;
  }

  String _getPrevSubPage() {
    return _previousSubPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex != 0
          ? const Color(
              0xFFFEBEB1,
            )
          : const Color(0xffFFF2E3),
      appBar: (_selectedIndex == 0 || _selectedIndex == 1) &&
              (_selectedSubPage == "default")
          ? AppBar(
              toolbarHeight: screenHeight(context) * 0.105,
              centerTitle: true,
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: _selectedIndex != 0
                  ? const Color(
                      0xFFFEBEB1,
                    )
                  : const Color(0xffFFF2E3),
              title: Image.asset(
                'assets/image/logo.png',
                width: 78,
                // height: 27,
                // height: 80,
              ),
              leadingWidth: 100,
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/lang.svg',
                      width: 41,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Select Language'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text('English'),
                                    onTap: () {
                                      // Set English language
                                      LanguageManager().setLanguage('en');
                                      // Close the dialog
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                  ),
                                  ListTile(
                                    title: Text('Hindi'),
                                    onTap: () {
                                      // Set Hindi language
                                      LanguageManager().setLanguage('hi');
                                      // Close the dialog
                                      Navigator.pop(context);
                                      setState(() {
                                        // Update UI if necessary
                                      });
                                    },
                                  ),
                                  ListTile(
                                    title: Text('Marathi'),
                                    onTap: () {
                                      // Set Marathi language
                                      LanguageManager().setLanguage('mr');
                                      // Close the dialog
                                      Navigator.pop(context);
                                      setState(() {
                                        // Update UI if necessary
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Ink(
                        decoration: ShapeDecoration(
                          color: Colors.transparent,
                          shape: CircleBorder(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/language_icon.svg',
                            width: 24,
                            height: 24,
                            color:
                                Colors.black, // Optionally customize the color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: (_selectedIndex == 1)
                  ? [
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: "Feature Coming Soon",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: const Color(0xAA444444),
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        },
                      ),
                    ]
                  : null,
            )
          : null,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 48,
            offset: Offset(0, 2),
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildIconButton(Icons.home, 0),
              Spacer(),
              _buildIconButton(Icons.person, 1),
              Spacer(),
              _buildIconButton(Icons.messenger_rounded, 2),
              Spacer(),
              _buildIconButton(Icons.calendar_today, 3),
            ],
          ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          if (_selectedSubPage == "default") {
            if (_selectedIndex == 1) {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              return;
            } else if (_previousIndex == 1 || _previousIndex == 0) {
              _updateNavigation(_previousIndex);
              return;
            } else if (_selectedIndex == 0) {
              _updateNavigation(1);
              return;
            }
          } else {
            _updateSubPage(_previousSubPage);
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // gradient: GradientOptions.backgroundGradient,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(
                  (_selectedIndex != 0) ? 0xFFFFFFFF : 0xffFFF2E3,
                ),
                Color(
                  (_selectedIndex != 0) ? 0xFFFEBEB1 : 0xffFFF2E3,
                ),
              ],
            ),
          ),
          child: Center(
            child: _buildBodyContent(_selectedIndex, _selectedSubPage),
          ),
        ),
      ),
    );
  }

  // Method to create IconButton with specified index
  Widget _buildIconButton(IconData icon, int index) {
    return IconButton(
      onPressed: () {
        _updateNavigation(index);
        _updateSubPage("default");
      },
      icon: Icon(
        icon,
        size: 30,
        color:
            _selectedIndex == index ? ColorOptions.skin : ColorOptions.darkblue,
      ),
    );
  }

  // Method to build body content based on selected index
  Widget _buildBodyContent(int index, String subPage) {
    Future<List<dynamic>> fetchPsychoEducationData() async {
      String url = appConfig["serverURL"] + "/api/websites/";
      var header = {'Authorization': 'Bearer ' + tokenBox.get("access_token")};
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    Future<List<dynamic>> fetchMedicalReminderData() async {
      String url = appConfig["serverURL"] + "/api/notifications/";
      var header = {
        'Authorization': 'Bearer ' + await tokenBox.get("access_token")
      };
      final response = await http.get(Uri.parse(url), headers: header);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        //print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    Future<List<dynamic>> fetchEMWheelData() async {
      String url = appConfig["serverURL"] + "/api/em_test";
      var header = {'Authorization': 'Bearer ' + tokenBox.get("access_token")};
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    Future<List<dynamic>> fetchBriefCopeData() async {
      String url = appConfig["serverURL"] + "/api/brief_cope_test_full/";
      var header = {'Authorization': 'Bearer ' + tokenBox.get("access_token")};
      final response = await http.get(Uri.parse(url), headers: header);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    Future<List<dynamic>> fetchZaritData() async {
      String url = appConfig["serverURL"] + "/api/zaritscale/";
      var header = {'Authorization': 'Bearer ' + tokenBox.get("access_token")};
      final response = await http.get(Uri.parse(url), headers: header);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    Future<List<dynamic>> fetchFamilyBurdenData() async {
      String url = appConfig["serverURL"] + "/api/family_burden_scale/";
      var header = {'Authorization': 'Bearer ' + tokenBox.get("access_token")};
      final response = await http.get(Uri.parse(url), headers: header);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    Future<List<dynamic>> fetchRecentResultsData() async {
      String url = appConfig["serverURL"] + "/api/combined_results/";

      var header = {'Authorization': 'Bearer ' + tokenBox.get("access_token")};
      final response = await http.get(Uri.parse(url), headers: header);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        //print(data.keys);
        List<dynamic> finalData = [];
        for (var key in data.keys) {
          for (var item in data[key]) {
            item['type'] = key;
            finalData.add(item);
          }
        }
        return finalData;
      } else {
        throw Exception('Failed to load data');
      }
    }

    Future<List<dynamic>> fetchCopingStrategies() async {
      String url = appConfig["serverURL"] + "/api/coping_strategies/";

      var header = {'Authorization': 'Bearer ' + tokenBox.get("access_token")};
      final response = await http.get(Uri.parse(url), headers: header);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    Future<List<dynamic>> fetchHomePageData() async {
      String url = appConfig["serverURL"] + "/api/coping_strategies/";

      var header = {'Authorization': 'Bearer ' + tokenBox.get("access_token")};
      final response = await http.get(Uri.parse(url), headers: header);
      //print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    }

    switch (index) {
      case 0:
        switch (subPage) {
          case "psycho_education":
            return FutureBuilder<List<dynamic>>(
              future: fetchPsychoEducationData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return PsychoEducationPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    websiteList: const [], // Pass the data to the page
                  );
                } else if (snapshot.hasData) {
                  return PsychoEducationPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    websiteList: snapshot.data!, // Pass the data to the page
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to fetch data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return PsychoEducationPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    websiteList: const [], // Pass the data to the page
                  );
                }
              },
            );

          case "zarit_burden_results":
            return FutureBuilder<List<dynamic>>(
              future: fetchZaritData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return ZaritBurdenResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                } else if (snapshot.hasData) {
                  return ZaritBurdenResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: snapshot.data!, // Pass the data to the page
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to fetch data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return ZaritBurdenResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                }
              },
            );

          case "zarit_scale_1":
            return ZaritScalePage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "zarit_scale_2":
            return Short12Page(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "emotional_wheel_results":
            return FutureBuilder<List<dynamic>>(
              future: fetchEMWheelData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return EmotionalWheelResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                } else if (snapshot.hasData) {
                  return EmotionalWheelResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: snapshot.data!, // Pass the data to the page
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to fetch data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return EmotionalWheelResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                }
              },
            );

          case "emotional_wheel_1":
            return EmotionalWheel(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "emotional_wheel_2":
            return EmotionalWheel2(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "family_burden_results":
            return FutureBuilder<List<dynamic>>(
              future: fetchFamilyBurdenData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return FamilyBurdenResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                } else if (snapshot.hasData) {
                  return FamilyBurdenResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: snapshot.data!, // Pass the data to the page
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to fetch data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return FamilyBurdenResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                }
              },
            );

          case "family_burden_1":
            return FamilyBurdenScalePage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );
          case "family_burden_2":
            return familyBurden(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "brief_cope_results":
            return FutureBuilder<List<dynamic>>(
              future: fetchBriefCopeData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return BriefCopeResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                } else if (snapshot.hasData) {
                  return BriefCopeResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: snapshot.data!, // Pass the data to the page
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to fetch data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return BriefCopeResultsPage(
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                }
              },
            );

          case "brief_cope_1":
            return BriefCopePage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "brief_cope_2":
            return CopePage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "individual_cope_strategy_page":
            return CopingStrategyAboutPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "default":
            return FutureBuilder<List<dynamic>>(
              future: fetchHomePageData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return HomePageFirst(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    copingStrategies: const [], // Pass the data to the page
                  );
                } else if (snapshot.hasData) {
                  return HomePageFirst(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    copingStrategies:
                        snapshot.data!, // Pass the data to the page
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to fetch data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return HomePageFirst(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    copingStrategies: const [], // Pass the data to the page
                  );
                }
              },
            );

          default:
            return Center(
              child: Text("404: Page Not Found!"),
            );
        }
      case 1:
        switch (subPage) {
          case "cost_effectiveness_analysis":
            return CostEffectiveAnalysisPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "client_details":
            return ClientDetailsPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );

          case "profile_page":
            return ProfilePage(
              updateHomeIndex: _updateNavigation,
              getPrevPageIndex: _getPrevIndex,
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
              results: const [], // Pass the data to the page
            );

          default:
            return FutureBuilder<List<dynamic>>(
              future: fetchRecentResultsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return ProfilePage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                } else if (snapshot.hasData) {
                  return ProfilePage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: snapshot.data!, // Pass the data to the page
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to fetch data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return ProfilePage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                }
              },
            );
        }
      case 2:
        switch (subPage) {
          case "individual_cope_strategy_page":
            return CopingStrategyAboutPage(
              updateSubPage: _updateSubPage,
              getPrevSubPage: _getPrevSubPage,
            );
          default:
            return FutureBuilder<List<dynamic>>(
              future: fetchCopingStrategies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return CopingStrategiesPage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                } else if (snapshot.hasData) {
                  return CopingStrategiesPage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: snapshot.data!, // Pass the data to the page
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to fetch data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return CopingStrategiesPage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    updateSubPage: _updateSubPage,
                    getPrevSubPage: _getPrevSubPage,
                    results: const [], // Pass the data to the page
                  );
                }
              },
            );
        }
      case 3:
        switch (subPage) {
          default:
            return FutureBuilder<List<dynamic>>(
              future: fetchMedicalReminderData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return MedicalReminderPage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    reminderList: const [],
                  );
                } else if (snapshot.hasData) {
                  return MedicalReminderPage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    reminderList: snapshot.data!,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Unable to connect to server",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color(0xAA444444),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  return MedicalReminderPage(
                    updateHomeIndex: _updateNavigation,
                    getPrevPageIndex: _getPrevIndex,
                    reminderList: const [],
                  );
                }
              },
            );
        } // Text('Calendar Page Content');
      default:
        return Container();
    }
  }
}
