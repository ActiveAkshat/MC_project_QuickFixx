import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackingCard extends StatelessWidget {
  final String providerName;
  final String providerRole;
  final String userAddress;
  final String deliveryTime;
  final String providerPhone;

  TrackingCard({
    required this.providerName,
    required this.providerRole,
    required this.userAddress,
    required this.deliveryTime,
    required this.providerPhone,
  });

  void _callProvider() async {
    final Uri callUri = Uri(scheme: "tel", path: providerPhone);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw "Could not launch $providerPhone";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Track Your Service",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/images/delivery_man.png"),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    providerName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    providerRole,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.call, color: Colors.red, size: 28),
                onPressed: _callProvider,
              ),
            ],
          ),
          Divider(height: 20, color: Colors.grey.shade300),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.red),
              SizedBox(width: 8),
              Expanded(
                child: Text(userAddress, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.access_time, color: Colors.blue),
              SizedBox(width: 8),
              Text(deliveryTime, style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
