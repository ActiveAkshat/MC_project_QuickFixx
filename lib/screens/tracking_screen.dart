import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingScreen extends StatelessWidget {
  final LatLng selectedLocation;

  TrackingScreen({required this.selectedLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Tracking")),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: selectedLocation,
              zoom: 15,
            ),
            markers: {
              Marker(
                markerId: MarkerId("destination"),
                position: selectedLocation,
              ),
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: _buildTrackingDetails(),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingDetails() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://via.placeholder.com/50"),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Raju", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Delivery Man"),
                  ],
                ),
                Spacer(),
                Icon(Icons.call, color: Colors.red),
              ],
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text("Delivery Address"),
              subtitle: Text("${selectedLocation.latitude}, ${selectedLocation.longitude}"),
            ),
            ListTile(
              leading: Icon(Icons.timer, color: Colors.blue),
              title: Text("Delivery Time"),
              subtitle: Text("03:00 PM (Max 20 min)"),
            ),
          ],
        ),
      ),
    );
  }
}
