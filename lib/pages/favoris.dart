import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfe_frontend/pages/messagerie.dart';
import 'package:pfe_frontend/pages/pagedacceuil.dart';
import 'package:pfe_frontend/pages/publier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavorisPage(),
      routes: {
        '/publier': (context) => const PublierAnnoncePage(),
        '/favoris': (context) => FavorisPage(),
        '/home': (context) => const FeaturedCarsPage(),
        '/messagerie': (context) => const ChatsPage(),
      },
    );
  }
}

class FavorisPage extends StatelessWidget {
  final List<Map<String, String>> voituresFavorites = [
    {"image": "assets/tesla.png", "nom": "Tesla Model S", "prix": "80 000 €"},
    {"image": "assets/BMW M4.png", "nom": "BMW M4", "prix": "70 000 €"},
    {"image": "assets/Audi RS5.png", "nom": "Audi RS5", "prix": "75 000 €"},
  ];

  FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5F6FA), // Conserve la couleur de fond
      appBar: AppBar(
        title: const Text('Favoris', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFD5F6FA),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: voituresFavorites.length,
        itemBuilder: (context, index) {
          final voiture = voituresFavorites[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(voiture["image"]!,
                  width: 60, height: 60, fit: BoxFit.cover),
              title: Text(voiture["nom"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(voiture["prix"]!),
              trailing: const Icon(Icons.favorite, color: Colors.red),
            ),
          );
        },
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
        currentIndex: 1, // L'index de 'Favoris' est sélectionné par défaut
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (index) {
          // Gestion de la navigation
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/publier');
              break;
            case 1:
              Navigator.pushNamed(context, '/favoris');
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FeaturedCarsPage()),
              );
              break;
            case 3:
              Navigator.pushNamed(context, '/messagerie');
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
