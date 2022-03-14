import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';





class GeoLocationPage extends StatefulWidget {
  @override
  _GeoLocationPageState createState() => _GeoLocationPageState();
}

class _GeoLocationPageState extends State<GeoLocationPage> {

 

Future<Map> _init() async {
  final prefs = await SharedPreferences.getInstance();
  final result = {
    'homeLocation': prefs.getString(homeLocationKey) ?? 'Unknown',
    'homeLatitude': prefs.getDouble(homeLatitudeKey) ?? null,
    'homeLongitude': prefs.getDouble(homeLongitudeKey) ?? null
  };
  return result;
}

Future<Null> displayPrediction(Prediction p) async {
  if (p != null) {
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId);
    // var address = await Geocoder.local.findAddressesFromQuery(p.description);

    // update the state and update the values in shared preferences for persistence
    setState(() {
      _homeLocation = p.description;
      _homeLatitude = detail.result.geometry.location.lat;
      _homeLongitude = detail.result.geometry.location.lng;
    });
    await _saveHomeLocation();

    // update the geofence
    _addGeofence();
  }
}

// update values in shared preferences
Future<void> _saveHomeLocation() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('my_home_location', _homeLocation);
  prefs.setDouble('my_home_latitude', _homeLatitude);
  prefs.setDouble('my_home_longitude', _homeLongitude);
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  
}