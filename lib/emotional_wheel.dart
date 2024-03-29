import 'package:flutter/material.dart';
import 'palette.dart';
import 'custom_widgets.dart';
import 'sign_up_second_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';

class EmotionalWheel extends StatefulWidget {
  const EmotionalWheel({Key? key}) : super(key: key);

  @override
  State<EmotionalWheel> createState() => _EmotionalWheelState();
}

class _EmotionalWheelState extends State<EmotionalWheel> {
  String? emotion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffE5A194),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Container(color: Color(0xffE5A194),
                child: Image.asset(
                  "assets/image/emo_wheel.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 380,
                    color: Colors.transparent,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffFFF2E3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [ const SizedBox(
                        height: 35,
                      ),Text(
                        "Emotional Wheel",
                        style: TextStyle(
                          fontFamily: 'JostBold',
                          fontSize: 28,
                          color: Color(0xffE5A194),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              const SizedBox(
                                height: 20,
                              ),
                              // Additional text
                              Text(
                                "The following is a list of statements that reflect how people sometimes feel when taking care of another person. After reading each statement, indicate how often you experience the feelings listed by circling the number that best corresponds to the frequency of these feelings.",
                                style: TextStyle(

                                  fontFamily: 'JostMedium',
                                  fontSize: 13,
                              ),

                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // "How are you feeling today?" text
                              Text(
                                "How are you feeling today?",
                                style: TextStyle(
                                  color: Color(0xffE5A194),
                                  fontFamily: 'JostMedium',
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 17,
                                child: Row(
                                  children: [
                                    CustomRadioButtonb(
                                      text: "Happy",
                                      value: 'Happy',
                                      selected: emotion == 'Happy',
                                      onSelect: () {
                                        setState(() {
                                          emotion = 'Happy';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CustomRadioButtonb(
                                      text: "Surprise",
                                      value: 'Surprise',
                                      selected: emotion == 'Surprise',
                                      onSelect: () {
                                        setState(() {
                                          emotion = 'Surprise';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CustomRadioButtonb(
                                      text: "Anxious",
                                      value: 'Anxious',
                                      selected: emotion == 'Anxious',
                                      onSelect: () {
                                        setState(() {
                                          emotion = 'Anxious';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),


                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(children: [ CustomRadioButtonb(
                                text: "Angry",
                                value: 'Angry',
                                selected: emotion == 'Angry',
                                onSelect: () {
                                  setState(() {
                                    emotion = 'Angry';
                                  });
                                },
                              ),
                                const SizedBox(
                                  width: 16,
                                ),
                                CustomRadioButtonb(
                                text: "Disgusted",
                                value: 'Disgusted',
                                selected: emotion == 'Disgusted',
                                onSelect: () {
                                  setState(() {
                                    emotion = 'Disgusted';
                                  });
                                },
                              ),
                                const SizedBox(
                                  width: 16,
                                ),
                                CustomRadioButtonb(
                                  text: "Bad",
                                  value: 'Bad',
                                  selected: emotion == 'Bad',
                                  onSelect: () {
                                    setState(() {
                                      emotion = 'Bad';
                                    });
                                  },
                                ),],),
                              const SizedBox(
                                height: 10,
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              // "What emotion are you feeling from wheel 2?" text
                              Text(
                                "What emotion are you feeling from wheel 2?",
                                style: TextStyle(
                                  color: Color(0xffE5A194),
                                  fontFamily: 'JostMedium',
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Dropdown for selecting emotion from wheel 2
                              DropdownButton<String>(
                                value: null, // Set initial value or handle state accordingly
                                onChanged: (newValue) {
                                  // Handle dropdown value change
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: "Option 1",
                                    child: Text("Option 1"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Option 2",
                                    child: Text("Option 2"),
                                  ),
                                  // Add more options as needed
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Text fields for first name, last name, gender, and Abha ID
                              Text(
                                "What emotion are you feeling from wheel 3?",
                                style: TextStyle(
                                  color: Color(0xffE5A194),
                                  fontFamily: 'JostMedium',
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Dropdown for selecting emotion from wheel 2
                              DropdownButton<String>(
                                value: null, // Set initial value or handle state accordingly
                                onChanged: (newValue) {
                                  // Handle dropdown value change
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: "Option 1",
                                    child: Text("Option 1"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Option 2",
                                    child: Text("Option 2"),
                                  ),
                                  // Add more options as needed
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          width: 261,
                          height: 43,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: GradientOptions.signInGradient,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpSecond(),
                                  ),
                                );
                              },
                              child: Text(
                                translations[LanguageManager().currentLanguage]!['submit']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "JostBold",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        )],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
