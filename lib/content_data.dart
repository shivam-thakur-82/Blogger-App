import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentData extends StatefulWidget {
  final DocumentSnapshot snapshot;
  ContentData({required this.snapshot});

  @override
  _ContentDataState createState() => _ContentDataState();
}

class _ContentDataState extends State<ContentData> {
  //final stream = FirebaseFirestore.instance.collection('Post').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Details'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Card(
            color: Colors.deepPurple,
            elevation: 10.0,
            margin: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Text(
                            widget.snapshot.get('title')[0],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          widget.snapshot.get('title'),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  widget.snapshot.get('content'),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
