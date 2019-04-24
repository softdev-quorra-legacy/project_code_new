import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pickup_app/form.dart';
import 'crud.dart';
import 'app.dart';
import 'classes.dart';
import 'globals.dart' as globals;

// variable for input and to be added to database
String curUserId;
String userId;
String first;
String last;
String phone;
String email;
String username;
String password;
String confirmPsw;

// creates class object with necessary CRUD(Create Read Update Delete) methods
crudMethods crudObj = new crudMethods();

class RegForm extends StatefulWidget {
  // meant to store value of user.uid passed from login
  //final String userId;
  

  // meant tor grab user.uid from login and assign to userId
  //RegForm(String uid, {Key key, this.userId}) : super (key: key);

  //String _userId;
  




  // calls RegFormState to build content form form
  @override
  RegFormState createState() => RegFormState();
}

class RegFormState extends State<RegForm> {
  // this is not an actual flutter 'Form' widget so I created a boolean value to keep track of validity of form
  bool _validate = false;
  






  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      floatingActionButton: new FloatingActionButton(onPressed: null),
      appBar: new AppBar(
        backgroundColor: new Color(0xFFFFAB40),
        title: new Text('Register your Pick-Up account'),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            new Text(
              "Register your Pick-Up account",
              style: new TextStyle(fontSize: 23.0,
              color: const Color(0xFFFFAB40),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                new FutureBuilder(
                    future: FirebaseAuth.instance.currentUser(),
                    builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                    if (snapshot.hasData) {
                      userId = snapshot.data.uid;
                    return new Container(width: 0.0, height: 0.0);
                    //(snapshot.data.uid);
                  }
                  else {
                    return Text('Loading...');
                    }
                  },
                ),


                new Flexible(
                  // input for last name
                  child: new TextField(
                      decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter',
                          labelText: "Last Name",
                          // check if empty
                          errorText: _validate ? 'Value can\'t be empty' : null,
                          contentPadding: EdgeInsets.all(10),
                      ),
                    // changes/store value if not empty
                    onChanged: (value) {
                      last = value;
                    },
                    textCapitalization: TextCapitalization.words,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize:16.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
                  ),
                ),
                SizedBox(width: 15.0,),
                new Flexible(
                  // input for first name
                  child: new TextField(
                      decoration: InputDecoration(
                          //icon: const Icon(Icons.person),
                          hintText: 'Enter',
                          labelText: "First Name",
                          // check if empty
                          errorText: _validate ? 'Value can\'t be empty' : null,
                          contentPadding: EdgeInsets.all(10),
                        //hasFloatingPlaceholder: false,
                      ),
                      // change/store value if not empty 
                      onChanged: (value) {
                        first = value;
                      },
                  textCapitalization: TextCapitalization.words,
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize:16.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
                  ),
                ),
              ],
            ),
            // input for phone number
            new TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                icon: const Icon(Icons.email),
                hintText: 'Enter',
                labelText: "Your phone number",
                // check if empty
                errorText: _validate ? 'Value can\'t be empty' : null,
              ),
              // change/store if not empty
              onChanged: (value) {
                phone = value;
              },
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize:16.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto")
            ),
            // input for username
            new TextField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.perm_identity),
                  hintText: 'Enter',
                  labelText: "Pick an username for this account",
                  // check if empty
                  errorText: _validate ? 'Value can\'t be empty' : null,
                ),
                // change/store value if not empty
                onChanged: (value) {
                  username = value;
                },
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize:16.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto")
            ),
  
            ButtonBar(
              children: <Widget>[
                ButtonTheme(
                  minWidth: 4.00,
                  height: 35.00,
                  child: RaisedButton(
                    child: Align(alignment: Alignment.center, child: Text("Submit",
                      style: TextStyle(
                        fontSize: 16.00, //The max size can fit in the button bar
                      ),
                    ),
                    ),
                    textColor: Colors.orangeAccent,
                    color: Colors.white,
                    elevation: 4.0, //shadow of button
                    splashColor: Color(0xFF424242),//it revealed white only when it's in a pressed state
                   onPressed: () {
                     // creates map similar to a dictionary with key and value key is 'String' type and value is 'dynamic' type
                     addUser(userId, username, first, last);
                     globals.userId = userId;
                     Map<String, dynamic> userData ={'first_name': first, 'last_name': last, 'phone': phone, 'userID': userId, 'username': username};
                     // calls crud object function to add data to cloud firestore
                     crudObj.addUserData(userData);
              },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





