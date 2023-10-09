import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xff5ba2f4),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["diary_title"],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0,),
          Text(
            doc["diary_entry_date"],
          ),
          const SizedBox(height: 8.0,),
          Text(
            doc["diary_entry_text"],
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}