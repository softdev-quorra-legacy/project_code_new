/*import 'package:flutter/material.dart';
// ignore: camel_case_types
class Form_ extends StatelessWidget {
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
            //Name (first, last)
            //phone number
            //email
            //choose your user name (optional)
            //choose your password
            //confirm password
            new Text(
              "Register your Pick-Up account",
              style: new TextStyle(fontSize: 23.0,
                  color: const Color(0xFFFFAB40),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto"
              ),
              textAlign: TextAlign.center,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter',
                      labelText: "Last Name",
                      contentPadding: EdgeInsets.all(10),
                    ),
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
                  child: new TextField(
                    decoration: InputDecoration(
                      //icon: const Icon(Icons.person),
                      hintText: 'Enter',
                      labelText: "First Name",
                      contentPadding: EdgeInsets.all(10),
                      //hasFloatingPlaceholder: false,
                    ),
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
            new TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'Enter',
                  labelText: "Your email address",
                ),
//                keyboardType: TextInputType.multiline,
//                maxLines: 3,
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize:16.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto")
            ),
            new TextField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.perm_identity),
                  hintText: 'Enter',
                  labelText: "Pick an username for this account",
                ),
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize:16.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto")
            ),
            new TextField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.lock),
                  hintText: 'Enter',
                  labelText: "Choose a password",
                ),
                obscureText: true,
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize:16.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto")
            ),
            new TextField(
                decoration: InputDecoration(
                  //icon: const Icon(Icons.lock_open),
                  icon: const Icon(Icons.lock),
                  hintText: 'Enter',
                  labelText: "Enter your new password again",
                ),
                obscureText: true,
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
                      // TODO: Show the next page (101)
                      Navigator.of(context).pushNamed('/map');
                      print("home_map");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
//      floatingActionButton: new FloatingActionButton(
//          elevation: 4.0,
//          child: Text("Submit"),
//          backgroundColor: new Color(0xFFFFAB40),
//          onPressed: (){
//            Navigator.of(context).pushNamed('/home');
//          }),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
*/

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


//class Todo {
  //  String userId;
  //final String description;

//  Todo(this.userId);
//}
//




/*Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("App bar"),
    ),
    body: FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.uid);
        }
        else {
          return Text('Loading...');
        }
      },
    ),
  );
}*/




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
                     //print(widget.userId);
                     //print (Todo.userId);
                     // creates map similar to a dictionary with key and value key is 'String' type and value is 'dynamic' type
                     addUser(globals.userId, first, last, username);
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





