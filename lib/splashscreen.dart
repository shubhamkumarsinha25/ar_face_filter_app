import 'package:ar_face_filter_app/camerawithmaskfilterscreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: cameraWithMaskFilterScreen(),
      title: Text(
        'AR  FACE  MASK  APP',
        style: TextStyle(
          fontSize: 45.0,
          fontFamily: "Signatra",
          color: Colors.deepOrange,
        ),
      ),
      image: Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "Shubham",
        style: TextStyle(
          fontFamily: "Brand Bold",
          fontSize: 34.0,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
