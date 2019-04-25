import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'auth.dart';
import 'dart:async';
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

  // void _onMapCreated(GoogleMapController controller){
  //   mapController = controller;
  // }
   Completer<GoogleMapController> _controller = Completer();

 static final CameraPosition _kCuBoulder = CameraPosition(
    target: LatLng(40.008131, -105.263782),
    zoom: 14.4746,
  );

  static final CameraPosition _kFolsomField = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(40.008131, -105.263782),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

      static final CameraPosition _kFarrandField = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(39.978069, -105.261045),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

      static final CameraPosition _kKittredgeField = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(40.0031513, -105.2624734),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

       static final CameraPosition _kWilliamsVillageField = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(40.0000562, -105.2364027),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

       static final CameraPosition _kLowerRecField = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(40.013933, -105.263218),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

       static final CameraPosition _kSportsDomeField = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(40.013933, -105.263218),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

    //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Marker _pin = Marker(
    markerId: MarkerId('_pin1'),
    position: LatLng(40.006949, -105.262697)
    );      




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
         drawer:  Container(
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
//                                   title: Text('Settings')),
                              ),
                              ]
                          )
                      )
                  )
              ),//endof inner container
                ]
              )
            ), 
              body: Stack(
          children: <Widget>[
            GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kCuBoulder,
                    onMapCreated: (GoogleMapController controller) {
                       _controller.complete(controller);
                       },
                      markers: {
              _pin,
            }


                       ),
                      


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
  

  // Future<void> _goToTheField() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kFolsomField));
  // }



// Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 tooltip: 'Menu',
//                 color: Colors.orangeAccent,
//                   iconSize: 32.00,
//                   icon: Icon(
//                     Icons.menu
//                   ),
//                 onPressed: () => _scaffoldKey.currentState.openDrawer(),
//               ),
//             ),
//           ),
// //          SizedBox(height: 10.0,),
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: ButtonTheme(
//                 minWidth: 8.00,
//                 height: 35.00,
//                 child: RaisedButton(
//                   child: const Text('Choose/Create an Activity'),
//                   textColor: Colors.white,
//                   color: Colors.orangeAccent,
//                   elevation: 4.0, //shadow of button
//                   splashColor: Color(0xFF424242),
//                   onPressed: (){
//                     Navigator.of(context).pushNamed('/event_create');
//                   }
//                 ),
//               ),
//             ),
//           )
//             ],
//           ),
//         ),

//       );
//   }
// }


    //               }
    //             ),
    //           ),
    //         ),
    //       )
    //       ),
      

         
          



      
        
    // ),
    //     ]
    //     )
          
    //       ))}


//   GoogleMapController mapController;

//   // void _onMapCreated(GoogleMapController controller){
//   //   mapController = controller;
//   // }
//    Completer<GoogleMapController> _controller = Completer();

//  static final CameraPosition _kCuBoulder = CameraPosition(
//     target: LatLng(40.008131, -105.263782),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kFolsomField = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(40.008131, -105.263782),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//       static final CameraPosition _kFarrandField = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(39.978069, -105.261045),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//       static final CameraPosition _kKittredgeField = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(40.0031513, -105.2624734),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//        static final CameraPosition _kWilliamsVillageField = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(40.0000562, -105.2364027),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//        static final CameraPosition _kLowerRecField = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(40.013933, -105.263218),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//        static final CameraPosition _kSportsDomeField = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(40.013933, -105.263218),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);


  Future<void> _goToTheField() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kFolsomField));
  }
}

      


//         drawer: new Container(
//           width: 250.0,
//           color: Colors.orangeAccent,
//           child: new ListView(
//             children: <Widget>[
//               new DrawerHeader(
//                 child: new Text('Hello!',
//                   style: new TextStyle(
//                     fontSize: 16.0,
//                     color: const Color(0xFFFFAB40),
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "Roboto"
//                   ),
//                 ),
//                 decoration: new BoxDecoration(
//                   color: Colors.white,
//                 ),
//               ),
//               Container(
//                 // This align moves the children to the bottom
//                   child: Align(
//                       alignment: FractionalOffset.center,
//                       child: Container(
//                           child: Column(
//                             children: <Widget>[
//                               //Divider(),
//                               ListTile(
//                                   leading: Container(
//                                     child: FlatButton(
//                                       child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text("Profile",
//                                           style: TextStyle(
//                                             fontSize: 16.0,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                       onPressed: (){
//                                         Navigator.of(context).pushNamed('/profile_page');
//                                       },
//                                     ),
//                                   )
// //                                  Icon(Icons.settings),
// //                                  title: Text('Settings')),
//                               ),
//                               ListTile(
//                                   leading: Container(
//                                     child: FlatButton(
//                                       child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text("Log Out",
//                                           style: TextStyle(
//                                             fontSize: 16.0,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                       onPressed: (){
//                                         widget.lougOut(context);
//                                       },
//                                     ),
//                                   )
// //                                  Icon(Icons.settings),
// //                                  title: Text('Settings')),
//                               ),





//                             ],
//                           )
//                       )
//                   )
//               )
//             ],
//           ),
//         ),

 
            // mainAxisSize: MainAxisSize.min,
            // children: <Widget>[
            //   OutlineButton.icon(
            //     icon: const Icon(Icons.add, size: 18.0),
            //     label: const Text('Menu', semanticsLabel: 'Menu'),
            //     onPressed: () => _scaffoldKey.currentState.openDrawer(),
            //   ),
            //   OutlineButton.icon(
            //     icon: const Icon(Icons.add, size: 18.0),
            //     label: const Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 6'),
            //     onPressed: null,
            //   ),
            // ],
          // ButtonBar(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     OutlineButton(
          //       child: const Text('To the Field!', semanticsLabel: 'To the Field!'),
          //       onPressed: _goToTheField,
          //     ),
          //      OutlineButton(
          //       child: Text('Choose/Create an Activity', semanticsLabel: 'Create Event'),
          //        onPressed: (){
          //           Navigator.of(context).pushNamed('/event_create');
          //         },
          //     ),
          //   ],
          // ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheField,
      //   label: Text('To the Field!'),
      //   icon: Icon(Icons.place),
      // ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: (){
      //               Navigator.of(context).pushNamed('/event_create');
      //             },
      //   label: Text('Choose/Create an Activity'),
      //   icon: Icon(Icons.place),
      // ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => _scaffoldKey.currentState.openDrawer(),
      //   label: Text('Menu'),
      //   icon: Icon(Icons.place),
      // ),
      //),
      // Padding(
      //       padding: const EdgeInsets.all(25.0),
      //       child: Align(
      //         alignment: Alignment.topLeft,
      //         child: IconButton(
      //           tooltip: 'Menu',
      //           color: Colors.orangeAccent,
      //             iconSize: 32.00,
      //             icon: Icon(
      //               Icons.menu
      //             ),
      //           onPressed: () => _scaffoldKey.currentState.openDrawer(),
      //         ),
      //       ),
      //     ),
// //          SizedBox(height: 10.0,),
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: ButtonTheme(
//                 minWidth: 8.00,
//                 height: 35.00,
//                 child: RaisedButton(
//                   child: const Text('Choose/Create an Activity'),
//                   textColor: Colors.white,
//                   color: Colors.orangeAccent,
//                   elevation: 4.0, //shadow of button
//                   splashColor: Color(0xFF424242),
//                   onPressed: (){
//                     Navigator.of(context).pushNamed('/event_create');
//                   }
//                 ),
//               ),
//             ),
//           )
//            ],
       
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

            
//           GoogleMap(
//                 onMapCreated: _onMapCreated,
//                 initialCameraPosition: CameraPosition(
//                   bearing: 90.0,
//                   target: LatLng(40.007565, -105.267298),
//                   tilt: 20, //talk to group and adjust
//                   zoom: 15.5
//                 ),
//               ),
//               floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
// //          SizedBox(height: 30.0,),
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 tooltip: 'Menu',
//                 color: Colors.orangeAccent,
//                   iconSize: 32.00,
//                   icon: Icon(
//                     Icons.menu
//                   ),
//                 onPressed: () => _scaffoldKey.currentState.openDrawer(),
//               ),
//             ),
//           ),
// //          SizedBox(height: 10.0,),
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: ButtonTheme(
//                 minWidth: 8.00,
//                 height: 35.00,
//                 child: RaisedButton(
//                   child: const Text('Choose/Create an Activity'),
//                   textColor: Colors.white,
//                   color: Colors.orangeAccent,
//                   elevation: 4.0, //shadow of button
//                   splashColor: Color(0xFF424242),
//                   onPressed: (){
//                     Navigator.of(context).pushNamed('/event_create');
//                   }
//                 ),
//               ),
//             ),
//           )
//             ],
//           ),
//         ),

//       );
//     Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
//   }
// }

//  Stack(
//           children: <Widget>[
//           GoogleMap(
//                 onMapCreated: _onMapCreated,
//                 initialCameraPosition: CameraPosition(
//                   bearing: 90.0,
//                   target: LatLng(40.007565, -105.267298),
//                   tilt: 20, //talk to group and adjust
//                   zoom: 15.5
//                 ),
//               ),
// //          SizedBox(height: 30.0,),
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 tooltip: 'Menu',
//                 color: Colors.orangeAccent,
//                   iconSize: 32.00,
//                   icon: Icon(
//                     Icons.menu
//                   ),
//                 onPressed: () => _scaffoldKey.currentState.openDrawer(),
//               ),
//             ),
//           ),
// //          SizedBox(height: 10.0,),
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: ButtonTheme(
//                 minWidth: 8.00,
//                 height: 35.00,
//                 child: RaisedButton(
//                   child: const Text('Choose/Create an Activity'),
//                   textColor: Colors.white,
//                   color: Colors.orangeAccent,
//                   elevation: 4.0, //shadow of button
//                   splashColor: Color(0xFF424242),
//                   onPressed: (){
//                     Navigator.of(context).pushNamed('/event_create');
//                   }
//                 ),
//               ),
//             ),
//           )
//             ],
//           ),
