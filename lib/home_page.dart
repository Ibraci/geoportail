import 'package:flutter/material.dart';
import './home_content.dart';
import './map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeoPortal Platform'),
        centerTitle: true,
        // leading: Icon(Icons.menu),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'GeoPortail',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text('Bienvenue', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.map),
              title: Text('Cartes'),
              onTap: () {
                print('Cartes tapped');
                // Navigator.pushNamed(context, '/maps');
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Statistiques'),
              onTap: () {
                print('Statistiques tapped');
                // Navigator.pushNamed(context, '/statistics');
              },
            ),
            ListTile(
              leading: Icon(Icons.file_present),
              title: Text('Ressources'),
              onTap: () {
                print('Ressources tapped');
                // Navigator.pushNamed(context, '/resources');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                print('Paramètres tapped');
                // Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
              onTap: () {
                print('À propos tapped');
                // Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),

      body: switch (currentIndex) {
        0 => const HomeContent(),
        1 => const MapPage(),
        _ => const Center(child: Text('Page non disponible')),
      },
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Accueil'),
          NavigationDestination(icon: Icon(Icons.map), label: 'Cartes'),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Statistiques',
          ),
          NavigationDestination(icon: Icon(Icons.more_horiz), label: 'Plus'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex, // Set the initial selected index
      ),
    );
  }
}
