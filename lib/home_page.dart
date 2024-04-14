import 'package:dostx/homePage.dart';
import 'package:flutter/material.dart';
import 'package:dostx/palette.dart';
import 'profilepage.dart';
import 'language_manager.dart';
import 'globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight(context) * 0.07), // specify the height here
        child: AppBar(backgroundColor: Color(
          0xFFFEBEB1,
        ),
          title:Center(
              child: Image.asset('assets/image/logo.png',width: 100,)
          ),
          leading:Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
                child: Transform.scale(
                  scale: 2.0, // Adjust the scale factor as needed
                  child: SvgPicture.asset(
                    'assets/svg/lang.svg',
                    width: 160,  // Set the original width
                    height: 160, // Set the original height
                  ),
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
                                  // Update UI if necessary
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

          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle bell icon tap
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(

        decoration: BoxDecoration(color:Colors.white,boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 48,
          offset: Offset(0, 2),
        ),]),

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
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
    );
  }

  // Method to create IconButton with specified index
  Widget _buildIconButton(IconData icon, int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      icon: Icon(
        icon,
        size: 30,
        color: _selectedIndex == index ? ColorOptions.skin : ColorOptions.darkblue,
      ),
    );
  }

  // Method to build body content based on selected index
  Widget _buildBodyContent(int index) {
    switch (index) {
      case 0:
        return HomePageFirst();
      case 1:
        return ProfilePage();
      case 2:
        return Text('Messenger Page Content');
      case 3:
        return Text('Calendar Page Content');
      default:
        return Container();
    }
  }
}
