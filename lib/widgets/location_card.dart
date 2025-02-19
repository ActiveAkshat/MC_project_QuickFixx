import 'package:flutter/material.dart';

class LocationCard extends StatefulWidget {
  final String address;
  final VoidCallback onSave;

  LocationCard({required this.address, required this.onSave});

  @override
  _LocationCardState createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  String selectedLabel = "Home";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Location",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(widget.address, style: TextStyle(fontSize: 16)),
          SizedBox(height: 16),
          Text("Save As"),
          Row(
            children:
                ["Home", "Office", "Others"].map((label) {
                  return ChoiceChip(
                    label: Text(label),
                    selected: selectedLabel == label,
                    onSelected: (selected) {
                      setState(() => selectedLabel = label);
                    },
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
