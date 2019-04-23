import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Add app bar (102)
//      appBar: AppBar(
//        // TODO: Add buttons and title (102)
//        backgroundColor: new Color(0xFFFFAB40),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              Icons.search,
//              semanticLabel: 'search',
//            ),
//            onPressed: () {
//              print('Search button');
//            },
//          ),
//          IconButton(
//            icon: Icon(
//              Icons.tune,
//              semanticLabel: 'filter',
//            ),
//            onPressed: () {
//              print('Filter button');
//            },
//          ),
//        ],
//        leading: IconButton(
//          icon: Icon(
//            Icons.menu,
//            semanticLabel: 'menu',
//          ),
//          onPressed: () {
//            print('Menu button');
//            Navigator.of(context).pushNamed('/Prelogin');
//          },
//        ),
//        title: Text('Pick-Up'),
//      ),
//      // TODO: Add a grid view (102)
//      body: Center(
//        child: Text("You look cute. Can I get your number?",
//          style: new TextStyle(
//              fontSize: 22.0,
//              color: const Color(0xFFFFAB40),
//              fontWeight: FontWeight.bold,
//              fontFamily: "Roboto"
//          ),
//          textAlign: TextAlign.center,
//        ),
//      ),
      backgroundColor: Colors.orangeAccent,
    );
  }
}
