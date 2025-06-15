import 'package:flutter/material.dart';

// This is the main HomeContent widget.
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Text(
              'Bienvenue sur le Géoportail national',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Explorez les cartes, les données régionales, et les ressources.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 24),
            // Quick Access Tiles (Grid)
            HomeTileGrid(),
            SizedBox(height: 32),
            // News Section
            Text(
              '📰 Actualités récentes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            NewsCard(
              title: 'Nouvelle carte des sites miniers disponible',
              date: '12 juin 2025',
            ),
            NewsCard(
              title: 'Rapport régional 2024 publié pour Mopti',
              date: '10 juin 2025',
            ),
          ],
        ),
      ),
    );
  }
}

// This widget shows the grid of quick access tiles.
class HomeTileGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of tiles to show
    final tiles = [
      HomeTile(icon: Icons.map, label: 'Cartes'),
      HomeTile(icon: Icons.bar_chart, label: 'Statistiques'),
      HomeTile(icon: Icons.file_present, label: 'Ressources'),
      HomeTile(icon: Icons.apartment, label: 'Infrastructures'),
      HomeTile(icon: Icons.nature, label: 'Environnement'),
      HomeTile(icon: Icons.theater_comedy, label: 'Culture & Tourisme'),
    ];

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: NeverScrollableScrollPhysics(),
      children: tiles,
    );
  }
}

// This widget represents a single tile in the grid.
class HomeTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const HomeTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show a message in the console when tapped
        print('$label tapped');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.teal),
            SizedBox(height: 12),
            Text(label, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

// This widget shows a news card.
class NewsCard extends StatelessWidget {
  final String title;
  final String date;

  const NewsCard({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(Icons.campaign, color: Colors.teal),
        title: Text(title),
        subtitle: Text(date),
        onTap: () {
          // Show a message in the console when tapped
          print('News: $title');
        },
      ),
    );
  }
}
