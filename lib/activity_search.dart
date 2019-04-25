import 'package:flutter/material.dart';
//import 'package:autocomplete_textfield/autocomplete_textfield.dart';
//import 'package:flutter_alert/
//import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:intl/intl.dart';



// ignore: camel_case_types
class activity extends StatefulWidget{
  @override
  _activityState createState() => _activityState();
}

// ignore: camel_case_types
class _activityState extends State<activity> {
  final _eventController = TextEditingController();
  final _locationController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
//          padding: EdgeInsets.symmetric(horizontal: 50.0),
          children: <Widget>[
//            Text('Error Showed if Field is Empty on Submit button Pressed'),
            ButtonBar(
              children: <Widget>[
                IconButton(
//                  alignment: Alignment.topLeft,
                  color: Colors.white,
                  iconSize: 32.0,
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  tooltip: 'Back to searching activity',
                  onPressed: (){
                    Navigator.of(context).pushNamed('/event_create');
                  },
                ),
              SizedBox(width: 250.0,),
              IconButton(
//                alignment: Alignment.topRight,
                color: Colors.white,
                iconSize: 32.0,
                icon: Icon(
                  Icons.home,
                ),
                tooltip: 'Home(Map) Page',
                onPressed: (){
                  Navigator.of(context).pushNamed('/map');
                },
              ),
//                child: Align(
//                  alignment: Alignment.topRight,
//                  child: IconButton(
//                      color: Colors.white,
//                      iconSize: 32.0,
//                      icon: Icon(
//                        Icons.home,
//                      ),
//                      tooltip: 'Home(Map) Page',
//                      onPressed: (){
//                        Navigator.of(context).pushNamed('/map');
//                      }
//                  ),
//                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: new Text(
                "Your Event Name:",
                style: new TextStyle(
                    fontSize: 23.0,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"
                ),
                textAlign: TextAlign.left,
              ),
            ),
//            SizedBox(height: 5.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: new TextField(
                controller: _eventController,
                decoration: InputDecoration(
//                  labelText: 'Create your own event',
                  hintText: 'Enter your event name',
                  contentPadding: EdgeInsets.all(10),
                  errorText: _validate ? 'Event Name Can\'t Be Empty' : null
                ),
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize:16.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: new Text(
                "Event Location:",
                style: new TextStyle(
                    fontSize: 23.0,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"
                ),
                textAlign: TextAlign.left,
              ),
            ),
//            SizedBox(height: 5.0,),
           /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: new TextField(
                controller: _locationController,
                decoration: InputDecoration(
//                  labelText: 'The location of your event',
                  hintText: 'Enter an address or a location name',
                  contentPadding: EdgeInsets.all(10),
//                  labelStyle: new TextStyle(
//                    color: Colors.white,
//                    fontWeight: FontWeight.bold,
//                  ),
                ),
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize:16.0,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto",
                ),
              ),
            ),*/
                Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: InkWell(
                splashColor: Color(0xFF424242),//it revealed white only when it's in a pressed state
               /* onTap: (){
                  DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                    print('confirm $date');
                  },
                      currentTime: DateTime.now()
                  );
                },*/
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
                      'Click to choose Location',
                      style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.orangeAccent
                      ),
                    ),
                  ),
                ),
              ),
            ),





            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: new Text(
                "Event Started Time:",
                style: new TextStyle(
                    fontSize: 23.0,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto"
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: InkWell(
                splashColor: Color(0xFF424242),//it revealed white only when it's in a pressed state
                onTap: (){
                  DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                    print('confirm $date');
                  },
                      currentTime: DateTime.now()
                  );
                },
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
                      'Click to choose time',
                      style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.orangeAccent
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //TODO Public/Private Event Using Radio
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                    child: const Text('Go!'),
                    textColor: Colors.orangeAccent,
                    color: Colors.white,
                    elevation: 4.0, //shadow of button
                    splashColor: Color(0xFF424242),
                    onPressed: (){
                      setState(() {
                        _eventController.text.isEmpty ? _validate = true : _validate = false;
                      });
//                      if (_validate = true){
//                        Navigator.of(context).pushNamed('/map');
//                      } else {
//                        print("Error Text");
//                      }
                    }
                )
              ),
            ),
            //            FlatButton(
//                onPressed: () {
//                  DatePicker.showDateTimePicker(
//                      context,
//                      showTitleActions: true,
//                      onChanged: (date) {
//                        print('change $date');
//                      }, onConfirm: (date) {
//                        print('confirm $date');
//                      },
//                      currentTime: DateTime.now()
//                  );
//                },
//                child: Text(
//                  'Click to choose time',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 16.0,
//                  ),
//                )
//            ),

//            DateTimePickerFormField(
//              format: dateFormat,
//              decoration: InputDecoration(labelText: 'Date'),
//              onChanged: (dt) => setState(() => date = dt),
//            ),
//            SizedBox(height: 16.0),
//            TimePickerFormField(
//              format: timeFormat,
//              decoration: InputDecoration(labelText: 'Time'),
//              onChanged: (t) => setState(() => time = t),
//            ),
//            SizedBox(height: 16.0),
//            Text('date.toString(): $date', style: TextStyle(fontSize: 18.0)),
//            SizedBox(height: 16.0),
//            Text('time.toString(): $time', style: TextStyle(fontSize: 18.0)),
          ],
              ),
            ),
          //],
        //),
      //),
    backgroundColor: Colors.orangeAccent,
    );
  }
}
