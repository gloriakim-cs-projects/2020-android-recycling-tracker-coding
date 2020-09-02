import 'package:flutter/material.dart';
//locator
import 'package:provider/provider.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//google map
//import 'package:url_launcher/url_launcher.dart'; //google map directions
//import 'package:geolocator/geolocator.dart'; //location service

/* LOCATOR */
//
//class LocatorPage extends StatelessWidget {
//  final locatorService = GeoLocatorService();
//  final placesService = PlacesService();
//
//  //TODO:     final currentPosition = Provider.of<Position>(context);
////26:19 https://www.youtube.com/watch?v=Dme03oxZRU0
//
//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: [
//        FutureProvider(create: (context) => locatorService.getLocation()),
//        ProxyProvider<Position, Future<List<Place>>>(
//          update: (context, position, places) {
//            return (position != null)
//                ? placesService.getPlaces(position.latitude, position.longitude)
//                : null;
//          },
//        ),
//      ],
//      child: MaterialApp(
//        title: 'Parking App',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: Search(),
//      ),
//    );
//  }
//}
