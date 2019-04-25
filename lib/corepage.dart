import 'package:flutter/material.dart';
import 'package:pickup_app/Prelogin.dart';
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
  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;
    return StreamBuilder<String>(
        stream: auth.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return buildWaitingScreen();
          }
          final bool isLoggedin = snapshot.hasData;
            return isLoggedin ? MapPage() : Pre_();
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
