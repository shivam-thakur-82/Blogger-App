import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {

  final Stream<QuerySnapshot> post = FirebaseFirestore.instance.collection('Post').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: post,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return new ListTile(
              title: new Text(data['title']),
              //subtitle: new Text(data['company']),
            );
          }).toList(),
        );
      },
    );
  }
}
