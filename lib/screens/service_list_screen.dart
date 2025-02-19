import 'package:flutter/material.dart';

class ServiceListScreen extends StatelessWidget {
  final Map<String, dynamic> service;

  const ServiceListScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> providers = [
      {
        "name": "Rajesh",
        "baseFare": "₹200",
        "likes": "400",
        "experience": "2 years",
      },
      {
        "name": "Kamlesh",
        "baseFare": "₹200",
        "likes": "400",
        "experience": "2 years",
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
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                            ),
                            child: const Text("BOOK"),
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
