//import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'read_data.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color start = Colors.deepPurple;
  Color end = Colors.purple;
  //ReadData readData = ReadData();
  final Stream<QuerySnapshot> post = FirebaseFirestore.instance.collection('Post').snapshots();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Blogger'),
            actions: [
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25.0,
                  ),
              ),
              ElevatedButton(
                  onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25.0,
                  ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          'Options',
                           style: TextStyle(
                             fontSize: 25.0,
                           ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                ),
                ListTile(
                  title: Text('Choose this'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Choose this'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [start,end],
              ),
            ),
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context,index) {
                  //var data;
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.transparent.withOpacity(0.1),
                    /*child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: Text(

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),*/
                    child: StreamBuilder<QuerySnapshot>(
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
                   ),
                  );
                }
            ),
          ),
        ),
    );
  }
}

//snapshot!.data.docs[index].data()['title'],