import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xerneas',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Xerneas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position _counter;
  LatLng latLng = LatLng(0, 0);
  double lat = 0;
  double long = 0;
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    _goToTheLake();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Maps Sample App'),
            backgroundColor: Colors.orange,
          ),
          body: GoogleMap(
            compassEnabled: true,
            mapType: MapType.hybrid,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: latLng,
              zoom: 17.0,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.orange,
          )),
    );
  }

  Future<void> _goToTheLake() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    double a = position.latitude;
    double b = position.longitude;
    lat = a;
    long = b;

    latLng = LatLng(lat, long);

    setState(() {
      _counter = position;
      lat = a;
      long = b;
    });
  }
}
