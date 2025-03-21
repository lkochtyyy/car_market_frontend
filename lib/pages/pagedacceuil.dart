import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfe_frontend/pages/favoris.dart';
import 'package:pfe_frontend/pages/messagerie.dart';
import 'package:pfe_frontend/pages/publier.dart';

class FeaturedCarsPage extends StatefulWidget {
  const FeaturedCarsPage({super.key});

  @override
  _FeaturedCarsPageState createState() => _FeaturedCarsPageState();
}

class _FeaturedCarsPageState extends State<FeaturedCarsPage> {
  List<Map<String, dynamic>> cars = [
    {
      'title': 'BMW serie 2',
      'price': 180000,
      'status': 'NOUVEAU',
      'color': Colors.green,
      'image': 'assets/bmw s2.png'
    },
    {
      'title': 'C63 AMG',
      'price': 200000,
      'status': 'Ancien',
      'color': Colors.amber,
      'image': 'assets/C63 AMG.png'
    },
    {
      'title': 'Audi RS7',
      'price': 250000,
      'status': 'NOUVEAU',
      'color': Colors.blue,
      'image': 'assets/Audi RS7.png'
    },
    {
      'title': 'Mercedes G63',
      'price': 300000,
      'status': 'Ancien',
      'color': Colors.red,
      'image': 'assets/Mercedes G63.png'
    },
    {
      'title': 'Tesla Model S',
      'price': 350000,
      'status': 'NOUVEAU',
      'color': Colors.purple,
      'image': 'assets/Tesla Model S.png'
    },
    {
      'title': 'Porsche 911',
      'price': 400000,
      'status': 'Ancien',
      'color': Colors.orange,
      'image': 'assets/Porsche 911.png'
    },
  ];

  bool isAscending = true;
  String? filterStatus;

  void sortCars() {
    setState(() {
      cars.sort((a, b) => isAscending
          ? a['price'].compareTo(b['price'])
          : b['price'].compareTo(a['price']));
      isAscending = !isAscending;
    });
  }

  void filterCars(String? status) {
    setState(() {
      filterStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedCars = filterStatus == null
        ? cars
        : cars.where((car) => car['status'] == filterStatus).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search any Car..',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.mic),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.network('assets/profile-photo1.png'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title and Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('All Featured',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    // Sort Button
                    TextButton.icon(
                      onPressed: sortCars,
                      icon: const Icon(Icons.sort),
                      label: const Text('Sort'),
                    ),
                    // Filter Button
                    PopupMenuButton<String>(
                      onSelected: filterCars,
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: null, child: Text('All')),
                        const PopupMenuItem(
                            value: 'NOUVEAU', child: Text('NOUVEAU')),
                        const PopupMenuItem(
                            value: 'Ancien', child: Text('Ancien')),
                      ],
                      child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.filter_list),
                        label: const Text('Filter'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Car Listings
            Expanded(
              child: ListView(
                children: displayedCars.map((car) => carCard(car)).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car, color: Colors.black),
              label: 'Publier'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, color: Colors.black),
              label: 'Favoris'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.paperPlane, color: Colors.black),
              label: 'Messagerie'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: 'Paramètres'),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PublierAnnoncePage()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavorisPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FeaturedCarsPage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatsPage()),
            );
          }
        },
      ),
    );
  }

  Widget carCard(Map<String, dynamic> car) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5, // Added elevation for a subtle shadow
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Car Image
            Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(car['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Car Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Car Title
                      Text(car['title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      // Car Status
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: car['color'],
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(car['status'],
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  // Car Price
                  Text('${car['price']} TND',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
