import 'package:flutter/material.dart';
import 'form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'auth.dart';
import 'auth_provider.dart';
import 'globals.dart' as globals;
import 'classes.dart';

class Login extends StatefulWidget {
  //Login({this.onSignedIn});
  //final VoidCallback onSignedIn;

  @override
  LoginState createState() => LoginState();
}

enum FormType {
  login,
  signUp,
}

class LoginState extends State<Login> {
  bool passwordVisible; //declare passwordVisible

  // ignore: must_call_super
  void initState() {
    passwordVisible = false;
  }

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Form is valid');
      return true;
    } else {
      print('Form is invalid');
      return false;
    }
  }
  /*void openMap(){
    if (validateAndSave() == true)
    {
      
            Navigator.of(context).pushNamed('/map'); //Direct to home page
            print('home page: map');
            _showQuestionDialog();
    }

  }*/

  bool isValid;

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        var auth = AuthProvider.of(context).auth;
        //if the user exists and is logging in
        if (_formType == FormType.login) {
          String userId =
              await auth.signInWithEmaiAndPassword(_email, _password);
          print('Sign in: $userId');
          globals.userId = userId; //set the globla uid for session
          //_showQuestionDialog();
        } 
        //user signing up
        else {
          String userId =
              await auth.createUserWithEmailAndPassword(_email, _password);
          print('Register user: $userId');
          globals.userId = userId;//set the global uid for session
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegForm(),
              ));
        }
        //widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToSignUp() {
    setState(() {
      _formType = FormType.signUp;
    });
  }

  void moveToLogin() {
    setState(() {
      _formType = FormType.login;
    });
  }

  //final _usernameController = TextEditingController();
  //final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          children: <Widget>[
            SizedBox(height: 60.0),
            Column(
              children: <Widget>[
                Image.asset('assets/print/logo-print-hd-transparent.png', fit: BoxFit.contain, width: 200,), //Width can be > 100, depends on the .png file of new design
                SizedBox(height: 30.0),
              ],
            ),
            SizedBox(height: 15.0),
            Form(
              key: formKey,
              child: new Column(
                children: buildLoginInputs() + buildSubmitButtons(),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.orangeAccent,
    );
  }

  List<Widget> buildLoginInputs() {
    return [
      // Add TextField widgets
      // [Name]
      TextFormField(
        //controller: _usernameController,
        decoration: new InputDecoration(
          /*filled: true*/ labelText: 'Email',
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      // spacer
      SizedBox(height: 0),
      // [Password]

      TextFormField(
        //keyboardType: TextInputType.text,
        //controller: _passwordController,
        obscureText: passwordVisible,
        decoration: InputDecoration(
          /*filled: true*/
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                passwordVisible
                    ? passwordVisible = false
                    : passwordVisible = true;
              });
            },
          ),
        ),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 12.00, //The max size can fit in the button bar
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/forgot_password');
              },
            ),
            ButtonTheme(
              minWidth: 4.00,
              height: 35.00,
              child: RaisedButton(
                child: const Text('LOG IN'),
                textColor: Colors.orangeAccent,
                color: Colors.white,
                elevation: 4.0, //shadow of button
                splashColor: Color(
                    0xFF424242), //it revealed white only when it's in a pressed state
                onPressed: () {
                  validateAndSubmit();
                },
                /*{
                        //if (_usernameController.TextEditingController == 'user' && _passwordController == 'password')
                        Navigator.of(context).pushNamed('/home'); //Direct to home page
                        print('home');
                      },*/
              ),
            ),
            ButtonTheme(
              minWidth: 4.00,
              height: 35.00,
              child: RaisedButton(
                child: const Text('Sign Up'),
                textColor: Colors.orangeAccent,
                color: Colors.white,
                elevation: 4.0, //shadow of button
                splashColor: Color(
                    0xFF424242), //it revealed white only when it's in a pressed state
                onPressed: () {
                  // TODO: Show the next page (101)
                  moveToSignUp();
                },
              ),
            ),
          ],
        ),
        new InkWell(
          splashColor: Color(
              0xFF424242), //it revealed white only when it's in a pressed state
          onTap: () => Navigator.of(context)
              .pushNamed('/home'), //Actions when tapping the button
          child: new Container(
            //width: 100.0,
            height: 35.0, //Button size
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.circular(35.0),
            ),
            child: new Center(
              child: new Text(
                'Log in with Google account',
                style:
                    new TextStyle(fontSize: 16.0, color: Colors.orangeAccent),
              ),
            ),
          ),
        )
      ];
    } else {
      return [
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 12.00, //The max size can fit in the button bar
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/forgot_password');
              },
            ),
            ButtonTheme(
              minWidth: 4.00,
              height: 35.00,
              child: RaisedButton(
                child: const Text('Sign Up'),
                textColor: Colors.orangeAccent,
                color: Colors.white,
                elevation: 4.0, //shadow of button
                splashColor: Color(
                    0xFF424242), //it revealed white only when it's in a pressed state
                onPressed: () {
                  validateAndSubmit();
                },
                /*{
                        //if (_usernameController.TextEditingController == 'user' && _passwordController == 'password')
                        Navigator.of(context).pushNamed('/home'); //Direct to home page
                        print('home');
                      },*/
              ),
            ),
            ButtonTheme(
              minWidth: 4.00,
              height: 35.00,
              child: RaisedButton(
                child: const Text('Sign In'),
                textColor: Colors.orangeAccent,
                color: Colors.white,
                elevation: 4.0, //shadow of button
                splashColor: Color(
                    0xFF424242), //it revealed white only when it's in a pressed state
                onPressed: () {
                  // TODO: Show the next page (101)
                  /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Form_()),
                        );*/
                  moveToLogin();
                },
              ),
            ),
          ],
        ),
        new InkWell(
          splashColor: Color(
              0xFF424242), //it revealed white only when it's in a pressed state
          onTap: () => Navigator.of(context)
              .pushNamed('/home'), //Actions when tapping the button
          child: new Container(
            //width: 100.0,
            height: 35.0, //Button size
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.circular(35.0),
            ),
            child: new Center(
              child: new Text(
                'Log in with Google account',
                style:
                    new TextStyle(fontSize: 16.0, color: Colors.orangeAccent),
              ),
            ),
          ),
        )
      ];
    }
  }

  /*void _showQuestionDialog() {
    showAlert(
      context: context,
      title: 'Allow "Pick-UP" to access your location?',
      body: "Your location will not be displayed or shared with others.",
      actions: [
        AlertAction(
          text: "Don't Allow",
          isDestructiveAction: true,
          onPressed: () {
            print("Do Nothing");
//            Navigator.of(context).pushNamed('/');
          },
        ),
        //last things to happen on login page
        AlertAction(
          text: "Allow",
          isDestructiveAction: true,
          onPressed: () {
            readGames();
            getUser(globals.userId);
            Navigator.of(context).pushNamed('/map'); //Direct to home page
            print('home page: map');
          },
        ),
      ],
    );
  }*/
}
