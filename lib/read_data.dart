import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'content_data.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {

  contData(DocumentSnapshot snap){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ContentData(snapshot : snap),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Post').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView.builder(
          itemCount: snapshot.data!.size,
            itemBuilder: (context, index) {
              //print(snapshot.data!.docs[index]['title']);
              return Card(
                margin: EdgeInsets.all(10.0),
                color: Colors.transparent.withOpacity(0.1),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.docs[index]['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(width : 20.0),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                child: Text(
                                    snapshot.data!.docs[index]['content'],
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                    maxLines: 2,
                                  ),
                                onTap: () {
                                  contData(snapshot.data!.docs[index]);
                                }
                              )
                            ],
                          ),
                        ),
                      ]
                    ),

                )
              );
            }
        );
      },
    );
  }
}
