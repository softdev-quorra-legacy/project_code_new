import 'package:firebase_database/firebase_database.dart';
import 'globals.dart' as globals;
//add dependency "firebase_database: ^2.0.3" to pubspec.yaml

//import 'package:flutter/material.dart';

//defien classes to organize game and field data
class Game{
  String gametype;
  Field playspace;
  int players;

  Game();

  Game.full(String title, Field fieldspace){
    this.gametype = title;
    this.playspace = fieldspace;
    this.players = 1;
  }
  Game.exists(String title, int mems, Field fieldspace){
    this.gametype = title;
    this.playspace = fieldspace;
    this.players = mems;

  }
}

class Field{
  String name;
  double lat;
  double lon;
  double pos;

  Field(String fname, double up, double down, double id){
    this.name = fname;
    this.lat = up;
    this.lon = down;
    this.pos = id;
  }
}

class User{
  String uid;
  String fname;
  String lname;
  String username;

  User(String uid, String fname, String lname, String username){
    this.uid = uid;
    this.fname = fname;
    this.lname = lname;
    this.username = username;
  }
}
//premade field list
var fields = [createField('Ferrand', 40.006009, -105.267693, 1), createField('Norlin Quad', 40.008729, -105.271468, 2), createField('Kittridge Fields', 40.002974, -105.259576, 3), createField('Engineering Quad', 40.006813, -105.264942, 4)];

//connect to firebase
final dbref = FirebaseDatabase.instance.reference();


void addUser(String uid, String uname, String fname, String lname){
  var user = new User(uid, fname, lname, uname);
  dbref.child('users').child(uid).set({
    'fname': user.fname,
    'lname': user.lname,
    'uname': user.username,
  });
}

void getUser(String uid){
    dbref.child('users').child(uid).once().then((DataSnapshot usersnap){
    //Map<dynamic, dynamic> details = usersnap.value;
    var myUser = new User(uid, usersnap.value[dbref.child('users')], usersnap.value['lname'], usersnap.value['uname']);
    globals.myUser = myUser;
    print(myUser.username);
    });
}

//function to create a field
//takes name, both coorinates, id = pos in fields array
Field createField(String fname, double lat, double lon, double id){
  var field = new Field(fname, lat, lon, id);
  return field;
}


//function to create game, push to server
//takes name of game and a field object //creates game with name, field, 1 player
void createGame(String title, Field location){
  var game = new Game.full(title, location);
  dbref.child('games').child(game.gametype).set({ //create game in database
    'location': game.playspace.name,
    'players': game.players,
  });
  dbref.child('games').child(title).child('field').set({ //create field in game
    'name': location.name,
    'lat' : location.lat,
    'lon' : location.lon,
    //'test': 'yeet',

  });
}

//call this when a player adds themselves to a game
//just increments game's player count
void updateGame(String title, double players){
  dbref.child('games').child(title).update({
    'players': players,
  });
}

//call this to receive a list of game objects, one for each game in the db
List readGames(){
  print('we is here');
  List<Game> games = [];
  var i = 0;
  dbref.child('games').once().then((DataSnapshot snapshot){
    Map<dynamic, dynamic> values = snapshot.value;
    print(values.toString());
    print('wild');
    values.forEach((key, values){
      //print('wilder');
      dbref.child('games').child(key).child('field').once().then((DataSnapshot fsnap){
        //Map<dynamic, dynamic> fvalues = fsnap.value;
        print('next game');
        
          /*String gname = key;
          String fname = fvalues['name'];
          double flat = fvalues['lat'];
          double flon = fvalues['lon'];
          int curplayers = values['players'];
          print(gname);
          print(fname);
          print(flat);
          print(flon);
          print(curplayers.toString());*/
        games.add(new Game.exists(key, values['players'], new Field(fsnap.value['name'], fsnap.value['lat'], fsnap.value['lon'], fsnap.value['id'])));
        globals.gameslist = games;
        print(games[i].gametype);
        print(games[i].playspace.lat);
        i = i + 1;
      });
    });});
    return globals.gameslist;
    }
        
       /* Map<dynamic, dynamic> fvalues = fsnap.value;
          fvalues.forEach((fkey, fval){
            print(fkey);
            print(fval);
          });
          }
      
        print(fvalues.toString());
        print(values.toString());
      );
    });

      games.add(new Game.exists(key, values['players'], new Field(fsnap.value['name'], fsnap.value['lat'], fsnap.value['lon'], fsnap.value['id'])));
      }
      );
      }
      );
      print(games[1].playspace.name);
      return games;
      }*/



/*
void readFields(){
  dbref.once().then((DataSnapshot fields){

    Widget build(BuildContext context){
      return MaterialApp(
        title: fields.value
      );
    }
    print('Data: ${fields.value}');
  }
  );
  }*/