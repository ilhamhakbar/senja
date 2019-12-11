import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:senja/constants/theme.dart';

class CafePage extends StatefulWidget {
  @override
  _CafePageState createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  static const LatLng _center = const LatLng(-7.0557345, 110.4323373);
  final Map<String, Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  int photoIndex = 0;
  Timer timer;
  
  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initMap();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      _nextImage();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  void initMap() {
    _markers.clear();
    final marker = Marker(
      markerId: MarkerId("curr_loc"),
      position: LatLng(7.0557345, 110.4323373),
      infoWindow: InfoWindow(title: 'Your Location'),
    );
    _markers["Current Location"] = marker;
  }

  List<String> photos = [
    'https://picsum.photos/id/866/600/300',
    'https://picsum.photos/id/867/600/300',
    'https://picsum.photos/id/868/600/300',
    'https://picsum.photos/id/869/600/300',
    'https://picsum.photos/id/890/600/300'
  ];

  // void _previousImage(){
  //   setState(() {
  //     photoIndex = photoIndex > 0 ? photoIndex -1 : 0;
  //   });
  // }

  void _nextImage() {
    if (mounted) {
      setState(() {
        photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              height: sizeHorizontal * 100,
              width: sizeHorizontal * 100,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  GoogleMap(
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    rotateGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 10.0,
                    ),
                    markers: _markers.values.toSet(),
                    mapType: _currentMapType,
                    onCameraMove: _onCameraMove,
                  ),
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                  //   child: FloatingActionButton(
                  //     onPressed: _getLocation,
                  //     backgroundColor: Colors.grey,
                  //     tooltip: 'Get Location',
                  //     child: Icon(Icons.location_searching),
                  //   ),
                  // ),
                ],
              )),
          Container(
            padding: EdgeInsets.fromLTRB(sizeHorizontal * 5, sizeHorizontal * 5,
                sizeHorizontal * 3, sizeHorizontal * 5),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(sizeHorizontal * 3),
                  width: sizeHorizontal * 40,
                  child: Image.asset('assets/images/senja_1.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            'assets/images/clock.svg',
                            height: 12,
                          ),
                        ),
                        Container(
                          child: Text(
                            "15.00 - 03.00",
                            style: t5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHorizontal * 3,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset('assets/images/pin.svg',
                              height: 12),
                        ),
                        Container(
                          width: sizeHorizontal * 45,
                          child: Text(
                              "Jl. Jatimulyo No.12, Pedalangan, Kota Semarang",
                              style: t5),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHorizontal * 3,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset('assets/images/whatsapp.svg',
                              height: 12),
                        ),
                        Container(
                          child: Text("0813-8088-7094", style: t5),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHorizontal * 3,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset('assets/images/instagram.svg',
                              height: 12),
                        ),
                        Container(
                          child: Text("senjacoffee.smg", style: t5),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(sizeHorizontal * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text("Insight Senja", style: h2),
                ),
                SizedBox(
                  height: sizeHorizontal * 3,
                ),
                Container(
                  child: Text(
                    "A space we urge to not just only talk and conversate, but also to brew your passion. In order to set out a space for all kind of people believe that everyone have different interest and passion. Yet, passion itself will be better if it's being executed. It's true that you don't need to be an expert to enjoy a good cup of coffee. And a cup coffee is good to get you going",
                    style: t5,
                  ),
                ),
                SizedBox(
                  height: sizeHorizontal * 3,
                ),
                Container(
                  child: Text(
                    "Brew Your Passion - Senja Coffee",
                    style: t5,
                  ),
                ),
                SizedBox(
                  height: sizeHorizontal * 3,
                ),
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: NetworkImage(photos[photoIndex]),
                            fit: BoxFit.cover)),
                    height: sizeHorizontal * 40,
                    width: sizeHorizontal * 90,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: sizeHorizontal * 3),
                  child: SelectedPhoto(
                    numberOfDots: photos.length,
                    photoIndex: photoIndex,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
      child: new Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 15.0,
          width: 15.0,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: 15.0,
          width: 25.0,
          decoration: BoxDecoration(
            color: Color(0xffbe9b7b),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _buildDots(),
      ),
    );
  }
}
