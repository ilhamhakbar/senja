import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:senja/constants/theme.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(-7.0748668, 110.431952);
const LatLng DEST_LOCATION = LatLng(-7.0555186, 110.4304541);

class CafePage extends StatefulWidget {
  @override
  _CafePageState createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  Completer<GoogleMapController> _controller = Completer();
// this set will hold my markers
  Set<Marker> _markers = {};
// this will hold the generated polylines
  Set<Polyline> _polylines = {};
// this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];
// this is the key object - the PolylinePoints
// which generates every polyline between start and finish
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyCsICft3IJZUwyOW5F00_A3_1qCXcva0zM";
// for my custom icons
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  // static const LatLng _center = const LatLng(-7.0557345, 110.4323373);
  // final Map<String, Marker> _markers = {};
  // LatLng _lastMapPosition = _center;
  // MapType _currentMapType = MapType.normal;

  int photoIndex = 0;
  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSourceAndDestinationIcons();
    // initMap();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      _nextImage();
    });
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/source.png').then((onValue){
          sourceIcon = onValue;
        });
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/destinantion.png').then((onValue){
          destinationIcon = onValue;
        });
  }

  // _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  // void initMap() {
  //   _markers.clear();
  //   final marker = Marker(
  //     markerId: MarkerId("curr_loc"),
  //     position: LatLng(7.0557345, 110.4323373),
  //     infoWindow: InfoWindow(title: 'Your Location'),
  //   );
  //   _markers["Current Location"] = marker;
  // }

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
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: SOURCE_LOCATION);
    return Container(
      height: sizeVertical * 100,
      child: Column(
        children: <Widget>[
          Container(
              height: sizeVertical * 35 ,
              width: sizeHorizontal * 100,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  GoogleMap(
                      myLocationEnabled: true,
                      compassEnabled: true,
                      tiltGesturesEnabled: true,
                      markers: _markers,
                      polylines: _polylines,
                      mapType: MapType.normal,
                      initialCameraPosition: initialLocation,
                      onMapCreated: onMapCreated),
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
              height: sizeVertical *60,
              child: SingleChildScrollView(
                              child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          sizeHorizontal * 5,
                          sizeHorizontal * 5,
                          sizeHorizontal * 3,
                          sizeHorizontal * 5),
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
                                    child: SvgPicture.asset(
                                        'assets/images/whatsapp.svg',
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
                                    child: SvgPicture.asset(
                                        'assets/images/instagram.svg',
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
              ),
            ),
          
        ],
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyles);
    _controller.complete(controller);
    setMapPins();
    setPolylines();
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: SOURCE_LOCATION,
          icon: sourceIcon));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId('destPin'),
          position: DEST_LOCATION,
          icon: destinationIcon));
    });
  }

  setPolylines() async {
    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
        googleAPIKey,
        SOURCE_LOCATION.latitude,
        SOURCE_LOCATION.longitude,
        DEST_LOCATION.latitude,
        DEST_LOCATION.longitude);
    if (result.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }
}

class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
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
