import 'package:adv_basic/question_screen.dart';
import 'package:adv_basic/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionScreen(onSelectAnswer: chooseAnswer);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 106, 58, 189),
                Color.fromARGB(255, 136, 54, 180),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
