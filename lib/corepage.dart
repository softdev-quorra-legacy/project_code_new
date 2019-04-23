import 'package:flutter/material.dart';
import 'package:pickup_app/map.dart';
import 'package:pickup_app/login.dart';
import 'form.dart';
import 'forgot_password.dart';
//import 'prelogin.dart';
import 'package:pickup_app/event_create.dart';
import 'activity_search.dart';
import 'package:pickup_app/auth.dart';
import 'profile_page.dart';
import 'auth_provider.dart';

class CorePage extends StatelessWidget {
//   @override
//   State<StatefulWidget> createState() => new CorePageState();
// }

// //enum AuthStatus { notSignedIn, signedIn }

// class CorePageState extends State<CorePage> {
// //   AuthStatus curStatus = AuthStatus.notSignedIn;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     var auth = AuthProvider.of(context).auth;
//     auth.currentUser().then((userId) {
//       setState(() {
//         curStatus = userId == null ? AuthStatus.signedIn : AuthStatus.notSignedIn;
//       });
//     });
//   }

//   void _signedIn() {
//     setState(() {
//       curStatus = AuthStatus.signedIn;
//       print('signing in');
//     });
//   }

//   void logOut() {
//     setState(() {
//       curStatus = AuthStatus.notSignedIn;
//       print('signing out');
//     });
//   }

  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;
    return StreamBuilder<String>(
        stream: auth.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final bool isLoggedin = snapshot.hasData;
            return isLoggedin ?  Login() : ProfileInfo() ;//MapPage() 
          }
          return buildWaitingScreen();
        });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
