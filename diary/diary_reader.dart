import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiaryReaderScreen extends StatefulWidget {
  DiaryReaderScreen(this.doc, {super.key});
  QueryDocumentSnapshot doc;
  @override
  State<DiaryReaderScreen> createState() => _DiaryReaderScreenState();
}

class _DiaryReaderScreenState extends State<DiaryReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5ba2f4),
      appBar: AppBar(
        backgroundColor: const Color(0xff5ba2f4),
        elevation: 0.0,
        title: const Text("Write a new diary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["diary_title"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.doc["diary_entry_date"],
            ),
            const SizedBox(
              height: 28.0,
            ),
            Text(
              widget.doc["diary_entry_text"],
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
