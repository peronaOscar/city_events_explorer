import 'package:city_events_explorer/src/domain/entities/location.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailMap extends StatefulWidget {
  const DetailMap({super.key, required this.location});

  final Location location;

  @override
  State<DetailMap> createState() => _DetailMapState();
}

class _DetailMapState extends State<DetailMap> {
  late final LatLng _eventPosition;

  @override
  void initState() {
    super.initState();
    _eventPosition = LatLng(widget.location.lat!, widget.location.lng!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _eventPosition,
            zoom: 14,
          ),
          markers: {
            Marker(
              markerId: const MarkerId("eventLocation"),
              position: _eventPosition,
              infoWindow: InfoWindow(title: widget.location.name),
            ),
          },
          onMapCreated: (controller) {},
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
          },
        ),
      ),
    );
  }
}
