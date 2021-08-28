import 'dart:async';

import 'package:location/location.dart';
import 'package:location_tracker/domain/models/user_location.dart';

class LocationService {
  //Keep track of current location
  Location location = Location();
  late UserLocation currentLocation;

  //Continuously emit location updates
  final StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get getStreamData => _locationController.stream;

  LocationService() {
    location.requestPermission().then((premission) {
      if (premission == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          _locationController.add(UserLocation(
            latitude: locationData.latitude!,
            longtitude: locationData.longitude!,
          ));
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      currentLocation = UserLocation(
        latitude: userLocation.latitude!,
        longtitude: userLocation.longitude!,
      );
    } catch (e) {
      print('Could not get the location $e');
    }
    return currentLocation;
  }
}
