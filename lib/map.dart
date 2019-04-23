import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'auth.dart';
import 'auth_provider.dart'
;
class MapPage extends StatefulWidget{
  //MapPage({this.onLoggedOut});
  //final VoidCallback onLoggedOut;

  void lougOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      //onLoggedOut();
    }
    catch(e) {
    print(e);
    }
  }

  @override
  State<MapPage> createState() => MapPageState ();
}

class MapPageState extends State<MapPage>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: new Container(
          width: 250.0,
          color: Colors.orangeAccent,
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                child: new Text('Hello!',
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: const Color(0xFFFFAB40),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"
                  ),
                ),
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                // This align moves the children to the bottom
                  child: Align(
                      alignment: FractionalOffset.center,
                      child: Container(
                          child: Column(
                            children: <Widget>[
                              //Divider(),
                              ListTile(
                                  leading: Container(
                                    child: FlatButton(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Profile",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).pushNamed('/profile_page');
                                      },
                                    ),
                                  )
//                                  Icon(Icons.settings),
//                                  title: Text('Settings')),
                              ),
                              ListTile(
                                  leading: Container(
                                    child: FlatButton(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Log Out",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onPressed: (){
                                        widget.lougOut(context);
                                      },
                                    ),
                                  )
//                                  Icon(Icons.settings),
//                                  title: Text('Settings')),
                              ),
                            ],
                          )
                      )
                  )
              )
            ],
          ),
        ),

//        floatingActionButton: new Builder(builder: (context) {
//          return new FloatingActionButton(
//            backgroundColor: Colors.transparent,
//            onPressed: () {
//              Scaffold.of(context).openDrawer();
//            },
//            child: new Icon(Icons.menu),
//            foregroundColor: Colors.orangeAccent,
//          );
//        }),

        body: Stack(
          children: <Widget>[
          GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  bearing: 90.0,
                  target: LatLng(40.007565, -105.267298),
                  tilt: 20, //talk to group and adjust
                  zoom: 15.5
                ),
              ),
//          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                tooltip: 'Menu',
                color: Colors.orangeAccent,
                  iconSize: 32.00,
                  icon: Icon(
                    Icons.menu
                  ),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ),
//          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: ButtonTheme(
                minWidth: 8.00,
                height: 35.00,
                child: RaisedButton(
                  child: const Text('Choose/Create an Activity'),
                  textColor: Colors.white,
                  color: Colors.orangeAccent,
                  elevation: 4.0, //shadow of button
                  splashColor: Color(0xFF424242),
                  onPressed: (){
                    Navigator.of(context).pushNamed('/event_create');
                  }
                ),
              ),
            ),
          )
            ],
          ),
        ),

      );
  }
}
