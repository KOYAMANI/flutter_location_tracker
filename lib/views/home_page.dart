import 'package:flutter/material.dart';
import 'package:location_tracker/domain/models/user_location.dart';

import 'package:provider/provider.dart' as provider;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = provider.Provider.of<UserLocation>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Location broadcast'),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('latitude: ${userLocation.latitude}'),
            Text('longtitude: ${userLocation.longtitude}'),
          ],
        )),
      ),
    );
  }
}
