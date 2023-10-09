import 'package:demension_application/diary/write_diary.dart';
import 'package:demension_application/diary/diary_editor.dart';
import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Diary',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff034c81),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          cardDiary1(),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff5ba2f4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              minimumSize: const Size(100, 50),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DiaryEditorScreen();
                  },
                ),
              );
            },
            child: const Text(
              'Write diary',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          cardDiary2(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff5ba2f4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              minimumSize: const Size(100, 50),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const WriteDiary();
                  },
                ),
              );
            },
            child: const Text(
              'See previous entries',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget cardDiary1() => Card(
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
                'Today\'s Diary',
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
                'Write your Diary',
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

  Widget cardDiary2() => Card(
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
                'Insert Date',
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
                'Dear Diary',
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
