import 'package:dostx/pages/coping_strategies_page.dart';
import 'package:dostx/pages/homePage.dart';
import 'package:dostx/pages/medical_reminder.dart';
import 'package:flutter/material.dart';
import 'package:dostx/palette.dart';
import 'package:flutter/services.dart';
import 'profilepage.dart';
import '../language_manager.dart';
import '../globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  int _previousIndex = 1;

  void _updateNavigation(int index){
    _previousIndex = _selectedIndex;
    setState(() {
      _selectedIndex=index;
    });
  }
  int _getPrevIndex(){
    return _previousIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  _selectedIndex != 0
          ? const Color(
        0xFFFEBEB1,
      )
          : const Color(0xffFFF2E3),
      appBar: (_selectedIndex==0 || _selectedIndex==1)?AppBar(
        toolbarHeight: screenHeight(context)*0.105,
        centerTitle: true,
        // scrolledUnderElevation: 0,
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
        leading:  Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
              child: SvgPicture.asset(
                'assets/svg/lang.svg',
                width: 41,
              ),
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
                              setState(() {

                              });
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
                    color: Colors.black, // Optionally customize the color
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: (_selectedIndex==1)?[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle bell icon tap
            },
          ),
        ]:null,
      ):null,
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
        onPopInvoked:(bool didPop){
          if (didPop){
            return;
          }
          if(_selectedIndex == 1){
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            return;
          }
          else if(_previousIndex == 1 || _previousIndex ==0){
            _updateNavigation(_previousIndex);
            return;
          }else if(_selectedIndex == 0){
            _updateNavigation(1);
            return;
          }
        } ,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            // gradient: GradientOptions.backgroundGradient,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(
                  0xFFFFFFFF,
                ),
                Color(
                  0xFFFEBEB1,
                ),
              ],
            ),
          ),
          child: Center(
            child: _buildBodyContent(_selectedIndex),
          ),
        ),
      ),
    );
  }

  // Method to create IconButton with specified index
  Widget _buildIconButton(IconData icon, int index) {
    return IconButton(
      onPressed: () {
        // if(index == 3){
        //               Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) =>  MedicalReminderPage(),
        //       ),
        //     );
        //               return;
        // }
        // setState(() {
        //   _selectedIndex = index;
        // });
        _updateNavigation(index);
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
  Widget _buildBodyContent(int index) {
    switch (index) {
      case 0:
        return HomePageFirst(
          updateHomeIndex: _updateNavigation,
          getPrevPageIndex: _getPrevIndex,
        );
      case 1:
        return ProfilePage();
      case 2:
        return CopingStrategiesPage(
          updateHomeIndex: _updateNavigation,
          getPrevPageIndex: _getPrevIndex,
        );//Text('Messenger Page Content');
      case 3:
        return MedicalReminderPage(
          updateHomeIndex: _updateNavigation,
          getPrevPageIndex: _getPrevIndex,
        );//Text('Calendar Page Content');
      default:
        return Container();
    }
  }
}
