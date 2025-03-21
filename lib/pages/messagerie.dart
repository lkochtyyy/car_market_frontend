import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfe_frontend/pages/favoris.dart';
import 'package:pfe_frontend/pages/pagedacceuil.dart';
import 'package:pfe_frontend/pages/publier.dart';
import 'package:pfe_frontend/pages/firstmsg.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search Bar
            _buildSearchBar(),
            const SizedBox(height: 10),
            // List of Chats (only one contact)
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Only one contact
                itemBuilder: (context, index) {
                  return _buildChatItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // Reusable Search Bar
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Reusable Chat Item (Only "Mohamed Ali")
  Widget _buildChatItem(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: const Icon(Icons.person, color: Colors.white),
      ),
      title: const Text('Mohamed Ali',
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: const Text('Last message preview...'),
      trailing: null, // No trailing number for this contact
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatApp()),
        );
      },
    );
  }

  // Reusable Bottom Navigation Bar
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car, color: Colors.black),
          label: 'Publier',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline, color: Colors.black),
          label: 'Favoris',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.paperPlane, color: Colors.black),
          label: 'Messagerie',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Colors.black),
          label: 'Paramètres',
        ),
      ],
      currentIndex: 3,
      selectedItemColor: Colors.cyan,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      onTap: (index) {
        _onBottomNavTapped(index, context);
      },
    );
  }

  // Bottom Navigation Bar Action
  void _onBottomNavTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PublierAnnoncePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavorisPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FeaturedCarsPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatsPage()),
        );
        break;
    }
  }
}
