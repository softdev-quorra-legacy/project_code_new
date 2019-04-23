import 'package:flutter/material.dart';
import 'package:pickup_app/map.dart';
import 'home.dart';
import 'login.dart';
import 'form.dart';
import 'forgot_password.dart';
import 'Prelogin.dart';
import 'package:pickup_app/event_create.dart';
import 'activity_search.dart';
//import 'profile.dart';
import 'profile_page.dart';
import 'auth_provider.dart';
import 'auth.dart';


// TODO: Convert ShrineApp to stateful widget (104)
class MyApp extends StatelessWidget {

  //Color gradientStart = Colors.deepPurple[700]; //Change start gradient color here
  //Color gradientEnd = Colors.purple[500]; //Change end gradient color here
   Widget build(BuildContext context) {
     return AuthProvider(
      auth: Auth(),
        child: MaterialApp(
          title: 'Pick-Up',
      // TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
      //home: HomePage(),
      //form: Form_(),
      // TODO: Make currentCategory field take _currentCategory (104)
      // TODO: Pass _currentCategory for frontLayer (104)
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      routes: {
        '/': (context) => Login(),
        '/home': (context) => HomePage(),
       // '/form': (context) => RegForm(uid, {Key key, this.userId}) : super (key: key);,
        '/forgot_password': (context) => Forgot(),
        '/Prelogin': (context) => Pre_(),
        '/map': (context) => MapPage(),
        '/activity_search': (context) => activity(),
        '/event_create': (context) => event(),
        //'/profile':(context) => profile_upload(),
        '/profile_page':(context) => ProfileInfo(),

      },
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      // TODO: Add a theme (103)
    )
    );
    }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => Login(),
      fullscreenDialog: true,
    );
  }

}
