import 'dart:math';
import 'classes.dart';
import 'auth_provider.dart';
import 'form.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'globals.dart' as globals;

class ProfileInfo extends StatefulWidget {
  @override
  ProfileInfoState createState() {
    return ProfileInfoState();
  }
}

class ProfileInfoState extends State<ProfileInfo> {
  String id;
  final db = Firestore.instance;

  final _formKey = GlobalKey<FormState>();

  String name;
  String firstName;
  String lastName;
  String userName;
  String phone;

  String usid;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var auth = AuthProvider.of(context).auth;
    auth.currentUser().then((userId) {
      usid = userId;
    });
  }

  Card buildItem(DocumentSnapshot doc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'name: ${doc.data['name']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'username: ${doc.data['username']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'phone: ${doc.data['phone']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => updateData(doc),
                  child: Text('Update', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /*TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'name',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => name = value,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P!ckUp Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          /*Form(
             key: _formKey,
             child: buildTextFormField(),
           ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text('Read', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),
            ],
          ),


          RaisedButton(
            //onPressed: createData,
            child: Text('makeprofile', style: TextStyle(color: Colors.white)),
            color: Colors.green,

             onPressed: () {
              addUser(globals.userId, 'uname', 'fname', 'lname');
            },

            
          ),

          RaisedButton(
            //onPressed: createData,
            child: Text('makefield', style: TextStyle(color: Colors.white)),
            color: Colors.green,
            onPressed: () {
              readGames();
              createGame('mynewgame', createField('mynewfield', 1.0, 1.0, 2));
            },

          ),
          
          RaisedButton(
            //onPressed: createData,
            child: Text('updategame', style: TextStyle(color: Colors.white)),
            color: Colors.green,
            onPressed: () {
              updateGame('mynewgame', 5, globals.myUser.uid);
              //List<Game> games = readGames();
              print(globals.gameslist[0].gametype);
            },


          ),
          
          
          RaisedButton(
                //onPressed: createData,
                child: Text('readuser', style: TextStyle(color: Colors.white)),
                color: Colors.green,
                onPressed: (){
                  print(globals.myUser.username);
                  print(globals.myUser.fname);
                  print(globals.myUser.lname);
                },

              
              
              ),




          /*StreamBuilder<QuerySnapshot>(
            stream: db.collection('$usid').snapshots(), 
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.documents.map((doc) => buildItem(doc)).toList());
              } else {
                return SizedBox();
              }
            },
          )*/
        ],
      ),
    );
  }

  /*void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection('$usid').add({'name': ' 😎', 'username': randomTodo()});
      setState(() => id = ref.documentID);
      print(ref.documentID);
    }
  }*/

  void readData() async {
    DocumentSnapshot snapshot = await db.collection('$usid').document(id).get();
    print(snapshot.data['name']);
  }

  void updateData(DocumentSnapshot doc) async {
    await db
        .collection('$usid')
        .document(doc.documentID)
        .updateData({'todo': 'please 🤫'});
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('$usid').document(doc.documentID).delete();
    setState(() => id = null);
  }

  String randomTodo() {
    final randomNumber = Random().nextInt(4);
    String todo;
    switch (randomNumber) {
      case 1:
        todo = 'Like and subscribe 💩';
        break;
      case 2:
        todo = 'Twitter @robertbrunhage 🤣';
        break;
      case 3:
        todo = 'Patreon in the description 🤗';
        break;
      default:
        todo = 'Leave a comment 🤓';
        break;
    }
    return todo;
  }
}
