import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gotya/src/helpers/colors.dart';
import 'package:gotya/src/modules/location.dart';
import 'package:gotya/src/widgets/circleButton.dart';

class ShowMap extends StatefulWidget {
  ShowMap({this.isMarkerActive});

  final bool isMarkerActive;

  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  LatLng _selectedPlace;

  GoogleMapController mapController;

  // Initial location of the Map view
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));

  List<Marker> _markers = [];

  MapType _defaultMapType = MapType.normal;

  getPosition() async {
    PlaceLocation positionResults = PlaceLocation();
    var position = await positionResults.getLocation();

    setState(() {
      _selectedPlace = LatLng(position.latitude, position.longitude);

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 18.0,
          ),
        ),
      );
    });
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: _initialLocation,
                      mapType: _defaultMapType,
                      myLocationEnabled: true,
                      zoomGesturesEnabled: true,
                      markers: Set.from(_markers),
                      onTap: widget.isMarkerActive
                          ? (LatLng tappedPoint) {
                              setState(() {
                                _selectedPlace = tappedPoint;
                                _markers = [];
                                _markers.add(Marker(
                                  markerId: MarkerId(
                                    tappedPoint.toString(),
                                  ),
                                  position: tappedPoint,
                                ));
                              });
                            }
                          : null,
                      onMapCreated: (GoogleMapController controller) async {
                        mapController = controller;
                        getPosition();
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 80,
                        right: 12,
                      ),
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 38.0,
                        height: 38.0,
                        child: FloatingActionButton(
                            child: Icon(
                              Icons.layers,
                              color: Colors.grey[600],
                            ),
                            elevation: 2,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _changeMapType();
                              });
                            }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleButton(
                          height: 38.0,
                          width: 38.0,
                          color: Colors.white,
                          buttonChild: Icon(
                            Icons.close,
                            size: 33,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                  print(_selectedPlace);
                },
                child: CircleButton(
                  height: 38.0,
                  width: 38.0,
                  color: secondaryColor,
                  buttonChild: Icon(
                    Icons.check,
                    size: 33,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
