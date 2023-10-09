import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DiaryEditorScreen extends StatefulWidget {
  const DiaryEditorScreen({super.key});

  @override
  State<DiaryEditorScreen> createState() => _DiaryEditorScreenState();
}

class _DiaryEditorScreenState extends State<DiaryEditorScreen> {
  String date = DateTime.now().toString();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5ba2f4),
      appBar: AppBar(
        backgroundColor: const Color(0xff5ba2f4),
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add a new diary",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Diary Title',
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(date),
            const SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _textController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Diary description',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff5ba2f4),
        onPressed: () async {
          FirebaseFirestore.instance.collection("diary").add({
            "diary_title": _titleController.text,
            "diary_entry_date": date,
            "diary_entry_text": _textController.text,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print("Failed to add new entry due to $error"));
        },
        child: const Icon(Icons.save),
      ),
    );
    ;
  }
}
