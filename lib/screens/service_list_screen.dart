import 'package:flutter/material.dart';
import 'package:quickfixx_app_flutter/screens/map_screen.dart';

class ServiceListScreen extends StatelessWidget {
  final Map<String, dynamic> service;

  const ServiceListScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> providers = [
      {
        "name": "Rajesh Kumar",
        "baseFare": "₹200",
        "likes": "400",
        "experience": "2 years",
      },
      {
        "name": "Kamlesh Singh",
        "baseFare": "₹250",
        "likes": "600",
        "experience": "3 years",
      },
      {
        "name": "Amit Sharma",
        "baseFare": "₹300",
        "likes": "550",
        "experience": "4 years",
      },
      {
        "name": "Suresh Verma",
        "baseFare": "₹180",
        "likes": "350",
        "experience": "2.5 years",
      },
      {
        "name": "Vikas Yadav",
        "baseFare": "₹220",
        "likes": "500",
        "experience": "3.5 years",
      },
      {
        "name": "Manoj Tiwari",
        "baseFare": "₹270",
        "likes": "450",
        "experience": "5 years",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(service["name"]),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: providers.length,
          itemBuilder: (context, index) {
            final provider = providers[index];
            return Card(
              color: Colors.pink[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider["name"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () {
                               Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(),
                          ),
                        );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            child: const Text(
                              "BOOK",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text("📍 Base Fare: ${provider["baseFare"]}"),
                          Text("👍 Likes: ${provider["likes"]}"),
                          Text("🔧 Experience: ${provider["experience"]}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
