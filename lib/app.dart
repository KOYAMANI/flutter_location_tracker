import 'package:flutter/material.dart';
import 'package:location_tracker/domain/models/user_location.dart';
import 'package:location_tracker/views/home_page.dart';
import 'package:location_tracker/services/location_service.dart';
import 'package:provider/provider.dart' as provider;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return provider.StreamProvider<UserLocation>(
      create: (_) => LocationService().getStreamData,
      initialData: UserLocation(
        latitude: 0,
        longtitude: 0,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Location Tracker',
        theme: ThemeData.light(),
        home: const HomePage(),
      ),
    );
  }
}
