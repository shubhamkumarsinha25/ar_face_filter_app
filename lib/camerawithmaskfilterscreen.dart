import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'dart:io' as Platform;

class cameraWithMaskFilterScreen extends StatefulWidget {
  const cameraWithMaskFilterScreen({Key key}) : super(key: key);

  @override
  _cameraWithMaskFilterScreenState createState() =>
      _cameraWithMaskFilterScreenState();
}

class _cameraWithMaskFilterScreenState
    extends State<cameraWithMaskFilterScreen> {
  CameraDeepArController cameraDeepArController;
  String platformversion = "unknown";
  int currentpage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilter = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            //deep ar camera
            CameraDeepAr(
              onCameraReady: (isReady) {
                platformversion = "camerastatus$isReady";
                print(platformversion);
                setState(() {});
              },
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {});
              },
            ),
            //mace mask filter image button
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (page) {
                          bool active = currentpage == page;

                          return Platform.Platform.isIOS
                              ?
                              //ios app view
                              GestureDetector(
                                onTap: (){
                                  currentpage=page;
                                  cameraDeepArController.changeMask(page);
                                  setState(() {
                                    
                                  });
                                },
                              )
                              //androide app views
                              : GestureDetector();
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
