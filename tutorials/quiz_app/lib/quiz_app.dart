import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import '../screens/main_screen.dart';

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp>{
  //Answers selected stored here because this state has access to the necessary screens.
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void switchScreen() {
    setState(() {
      //Pass the function pointer to Question screen
      activeScreen = QuestionsScreen(onSelectAnswer: addSelectedAnswer);
    });
  }

  void addSelectedAnswer(String answer){
    selectedAnswers.add(answer);

    //Stop iterating as soon as we don't have any questions left
    if(selectedAnswers.length == questions.length){
      setState(() {
        selectedAnswers = [];
        activeScreen = MainScreen(switchScreen);
      });
    }
  }

  @override
  void initState() {
    activeScreen = MainScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 26, 2, 80),
                    Color.fromARGB(255, 45, 7, 98)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}