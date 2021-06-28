import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  CollectionReference post = FirebaseFirestore.instance.collection('Post');
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  Future<void> addPost() {
    return post.add({
      'title' : titleController.text,
      'content' : contentController.text,
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add Post'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Container(
            color: Colors.deepPurple,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Enter Post Heading',
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: contentController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Enter Post Details',
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async{
                          await addPost();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Post',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
