import 'package:dostx/homePage.dart';
import 'package:flutter/material.dart';
import 'package:dostx/palette.dart';
import 'profilepage.dart';
import 'language_manager.dart';
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
      appBar: AppBar(backgroundColor: Color(
        0xFFFEBEB1,
      ),
        title: Center(
          child: Text("DostX"), // Replace 'assets/logo.png' with your logo path
        ),
        leading: IconButton(
          icon: Icon(Icons.language),
          onPressed: () {
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
                        // Update UI if necessary
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

                        });
                        // Update UI if necessary

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

                        });
                        // Update UI if necessary

                      },
                    ),
                  ],
                ),
              );
            },);
          },
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
      bottomNavigationBar: Container(
        color: Colors.white,
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
        size: 35,
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
