import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:quickfixx_app_flutter/services/location_service.dart';
import 'package:quickfixx_app_flutter/widgets/location_card.dart';

class LocationPicker extends StatefulWidget {
  final LatLng location;
  LocationPicker(this.location);

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String address = "Fetching address...";
  String selectedLabel = "Home";

  @override
  void initState() {
    super.initState();
    _fetchAddress();
  }

  void _fetchAddress() async {
    String addr = await LocationService().getAddressFromLatLng(
      widget.location.latitude,
      widget.location.longitude,
    );
    setState(() => address = addr);
  }

  void _saveAddress() {
    // You can store this in Firebase/SharedPreferences
    print("Saved: $address as $selectedLabel");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: LocationCard(address: address, onSave: _saveAddress)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: _saveAddress,
              child: Text("Save Address"),
            ),
          ),
        ],
      ),
    );
  }
}
