import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  
  String gender = 'Male'; // Default Gender
  List<String> selectedInterests = []; // Selected Checkboxes

  final List<String> interests = ['Plumbing', 'Electrical', 'Carpentry', 'Cleaning'];

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  // Load data from local storage
  void loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? profileData = prefs.getString('profile');

    if (profileData != null) {
      Map<String, dynamic> profile = jsonDecode(profileData);
      setState(() {
        nameController.text = profile['name'];
        emailController.text = profile['email'];
        gender = profile['gender'];
        selectedInterests = List<String>.from(profile['interests']);
      });
    }
  }

  // Save data to local storage
  void saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    Map<String, dynamic> profile = {
      'name': nameController.text,
      'email': emailController.text,
      'gender': gender,
      'interests': selectedInterests,
    };

    await prefs.setString('profile', jsonEncode(profile));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile saved successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField("Name", nameController),
            buildTextField("Email", emailController),
            
            SizedBox(height: 10),
            Text("Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: gender,
              isExpanded: true,
              items: ['Male', 'Female', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
            ),

            SizedBox(height: 10),
            Text("Interests", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Column(
              children: interests.map((interest) {
                return CheckboxListTile(
                  title: Text(interest),
                  value: selectedInterests.contains(interest),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedInterests.add(interest);
                      } else {
                        selectedInterests.remove(interest);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveProfile,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Save Profile", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
