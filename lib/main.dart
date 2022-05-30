// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, unused_import

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';
import 'questionlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

QuestionList ql = QuestionList();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> scorekeeper = [];

  void checkanswer(bool userans) {
    bool correctAnswer = ql.returnanswer();
    setState(() {
      if (ql.isFinished() != false) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        ql.reset();
        scorekeeper = [];
      } else {
        if (correctAnswer == userans) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        ql.nextQuestion();
        print('The end of the the main function');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(ql.returnQuestion()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height / 12,
                  width: size.width / 2.5,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      checkanswer(true);
                    },
                    color: Colors.green,
                    child: Text('True'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height / 12,
                  width: size.width / 2.5,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      checkanswer(false);
                    },
                    color: Colors.red,
                    child: Text('False'),
                  ),
                ),
              ),
              Row(
                children: scorekeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
