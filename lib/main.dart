import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your fav color?',
      'answers': [ { 'text' : 'Black', 'score' : 10}, 
        { 'text' : 'Red' , 'score' : 5} , 
        { 'text' : 'Green', 'score': 3 }, 
        { 'text' : 'White', 'score': 1} ],
    },
    {
      'questionText': 'What is your fav animal?',
      'answers': [
        {'text' : 'Rabbit', 'score': 1},
        {'text' : 'Snake', 'score': 3},
        {'text' : 'Elephant', 'score': 4},
        {'text' : 'Dog', 'score': 5},
      ]},
    {
      'questionText': 'Who is your favorite instructor',
      'answers': [
        {'text' : 'Nizar', 'score': 1},
        {'text' : 'Shilleh', 'score': 3},
        {'text' : 'Akram', 'score': 4},
        {'text' : 'Asmar', 'score': 5},
      ]},
  ];

  var _questionIndex = 0;
  var _totalscore = 0;



  void _resetQuiz() {
    setState(() {
      {
    _questionIndex = 0;
    _totalscore = 0;
    }
    });
  }

  void _checkAnswer(int score) {

    _totalscore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more Questions');
    } else {
      print('No more Questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                checkAnswer: _checkAnswer,
                questionIndex: _questionIndex)
            : Result(_totalscore,_resetQuiz) ,
      ),
    );
  }
}
