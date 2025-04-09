import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:howfarchat/model/mapmodel.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2947),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2947),
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white, // Change color as needed
          size: 24,
        ),
        title: const Text(
          'Nearby',
          style: TextStyle(
            fontFamily: 'Readex Pro',
            color: Colors.white, // Change color as needed
            fontSize: 24,
            letterSpacing: 0,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0), // Change initial position as needed
          zoom: 15, // Change initial zoom level as needed
        ),
        // Add more configurations as needed
      ),
    );
  }
}
