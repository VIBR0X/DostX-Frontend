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
            child: Container(
              color: Color(0xFFFEBEB1), width: double.maxFinite,
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
            color: Color(0xFFF6F6F6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: _buildHorizontalScrollSection(context),
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
          ),
        );
      },
          (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FamilyBurdenScalePage(),
          ),
        );
      },
          (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BriefCopePage(),
          ),
        );
      },
          (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmotionalWheel(),
          ),
        );
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: routes.map((route) {
          int index = routes.indexOf(route);
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: GestureDetector(
                onTap: () => route(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenWidth(context) * (65/414),
                          // width: screenWidth(context) * 0.18,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Image.asset(
                              "assets/image/Icon$index.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                          child: Text(
                            "Activities",
                            style: TextStyle(
                              color: Color(0xff323736),
                              fontFamily: "JostSemi",
                              fontSize: fontHelper(context) * 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
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
