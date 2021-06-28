//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FinalAdding extends StatelessWidget {
  final String titleAdd;
  final String contentAdd;
  FinalAdding({required this.titleAdd, required this.contentAdd});

  @override
  Widget build(BuildContext context) {
    CollectionReference post = FirebaseFirestore.instance.collection('Post');
    return Container();
  }
}
