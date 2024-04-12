import 'package:dostx/brief_cope_results_page.dart';
import 'package:dostx/brief_cope_page.dart';
import 'package:dostx/cope.dart';
import 'package:dostx/emothional_wheeel_reults.dart';
import 'package:dostx/family_burden_results_page.dart';
import 'package:dostx/family_burden_scale_page.dart';
import 'package:dostx/globals.dart%20';
import 'package:dostx/svg_test.dart';
import 'package:dostx/zarit_burden_results_page.dart';
import 'package:dostx/zarit_scale_page.dart';
import 'package:flutter/material.dart';
import 'package:dostx/palette.dart';
import 'font_test.dart';
import 'short12.dart';
import 'emotional_wheel.dart';
class HomePageFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(color: Color(0xFFFEBEB1), width: double.maxFinite,
              child: Text(
                "How do you feel today?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF204267),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    SizedBox(
                      height: screenHeight(context) * 0.15,
                        child: _buildHorizontalScrollSection(context)
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Rescue Sessions",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF204267),
                          ),
                        ),
                        Spacer(),
                        Text("See All", style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                    SizedBox(height: 10),
                    _buildRescueSessions(),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Text(
                          "Consultation History",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF204267),
                          ),
                        ),
                        Spacer(),
                        Text("See All", style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildHorizontalScrollSection(BuildContext context) {
    List<void Function(BuildContext)> routes = [
          (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ZaritScalePage(),
            // builder: (context) => ZaritBurdenResultsPage(),
          ),
        );
      },
          (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FamilyBurdenScalePage(),
            // builder: (context) => FamilyBurdenResultsPage(),
          ),
        );
      },
          (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BriefCopePage(),
            // builder: (context) => BriefCopeResultsPage(),
          ),
        );
      },
          (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmotionalWheel(),
            // builder: (context) => EmotionalWheelResultsPage(),
          ),
        );
      },
    ];

    return Container(
      // height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1), // Change background color here
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RawScrollbar(
        thumbColor: Color(0xff1A3858),
        thickness: 10,
        radius: Radius.circular(10),
        child: ListView.builder(
          // padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: routes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => routes[index](context),
              child: Container(
                width: 100,
                margin: EdgeInsets.fromLTRB(10, 10, 0, 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff0000000A).withOpacity(0.01),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 65,
                        width: 65,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Image.asset(
                            "assets/image/Icon$index.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("Activities", style: TextStyle(color: Color(
                          0xff323736), fontFamily: "JostSemi"),),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildRescueSessions() {
  return Container(
    height: 230,
    child: RawScrollbar(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 200,

            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white, // Replace with your desired color
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [Center(
                child: Column(children: [Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Image.asset("assets/p2.png"),

                ), SizedBox(height: 5,),],),
              ),Padding(
                padding: const EdgeInsets.fromLTRB(90, 160, 0, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient:
                    GradientOptions.signInGradient,

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:  const Color(
                        0xFF204267,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    onPressed: (){
                      if(index == 0){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Short12Page(),
                        ),
                      );}
                      if(index == 1){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmotionalWheel(),
                        ),
                      );}
                      if(index == 2){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CopePage(),
                        ),
                      );}
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                      child: Text(
                        "Begin",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),],
            ),
          );
        },
      ),
    ),
  );
}

//   Widget _buildRescueSessions() {
//     return Column(
//       children: List.generate(
//         3,
//             (index) => Container(
//           margin: EdgeInsets.symmetric(vertical: 10),
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.blue, // Replace with your desired color
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Text(
//             "Rescue Session $index",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
