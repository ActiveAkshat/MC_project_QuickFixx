import 'package:flutter/material.dart';
import '../widgets/service_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> services = [
    {
      "name": "Electrician",
      "cost": "Rs 500",
      "rating": "4.9",
      "image": 'assets/images/Electrician.png',
    },
    {
      "name": "Plumber",
      "cost": "Rs 600",
      "rating": "4.8",
      "image": "assets/images/Plumber.png",
    },
    {
      "name": "Carpenter",
      "cost": "Rs 300",
      "rating": "4.6",
      "image": "assets/images/Carpenter.png",
    },
    {
      "name": "Toilet Clean",
      "cost": "Rs 400",
      "rating": "4.5",
      "image": "assets/images/Toilet_clean.png",
    },
  ];

  List<Map<String, dynamic>> filteredServices = [];

  @override
  void initState() {
    super.initState();
    filteredServices = services;
  }

  void _searchService(String query) {
    setState(() {
      filteredServices =
          services
              .where(
                (service) =>
                    service["name"].toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "QuickFixx",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _searchService,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: filteredServices.length,
                itemBuilder: (context, index) {
                  return ServiceCard(service: filteredServices[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
