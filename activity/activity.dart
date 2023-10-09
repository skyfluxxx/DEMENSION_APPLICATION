import 'package:demension_application/activity/guess_the_action.dart';
import 'package:demension_application/activity/guess_the_name.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
           const Text(
            'Flashcards',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff034c81),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const GuessTheName();
                  },
                ),
              );
            },
            child: cardActivity1() ,
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const GuessTheAction();
                  },
                ),
              );
            },
            child: cardActivity2() ,
          ),
        ],
      ),
      
    );
  }

    Widget cardActivity1() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.greenAccent,
        elevation: 8,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Ink.image(
                image: const AssetImage('assets/images/card2.png'),
                width: 200,
                height: 200,
                alignment: Alignment.centerRight),
            const Positioned(
              bottom: 45,
              right: 10,
              left: 10,
              child: Text(
                'Activity 1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff034c81),
                  fontSize: 22,
                ),
              ),
            ),
            const Positioned(
              bottom: 13,
              right: 10,
              left: 10,
              child: Text(
                'Guest the Name',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff034c81),
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      );

      Widget cardActivity2() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.greenAccent,
        elevation: 8,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Ink.image(
                image: const AssetImage('assets/images/card1.png'),
                width: 200,
                height: 200,
                alignment: Alignment.centerRight),
            const Positioned(
              bottom: 45,
              right: 10,
              left: 10,
              child: Text(
                'Activity 2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff034c81),
                  fontSize: 22,
                ),
              ),
            ),
            const Positioned(
              bottom: 13,
              right: 10,
              left: 10,
              child: Text(
                'Guest the Action',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff034c81),
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      );

}