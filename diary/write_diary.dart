import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demension_application/diary/diary_editor.dart';
import 'package:demension_application/diary/diary_reader.dart';
import 'package:demension_application/widgets/diary_card.dart';
import 'package:flutter/material.dart';

class WriteDiary extends StatelessWidget {
  const WriteDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5ba2f4),
        title: const Text(
          'Write Diary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your recent entries",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff5ba2f4),
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("diary").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                      ),
                      children: snapshot.data!.docs.map((diary) => noteCard((){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryReaderScreen(diary)));
                      }, diary) ).toList(),
                    );
                  }
                  return const Text("There's no diary detected");
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DiaryEditorScreen()));
        },
        label: const Text("Write Diary"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
