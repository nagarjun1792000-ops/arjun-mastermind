import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const ArjunMastermindApp());
}

class ArjunMastermindApp extends StatelessWidget {
  const ArjunMastermindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arjun Mastermind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Arjun Mastermind', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text('Namma Ooru All-in-One Super App', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.rocket_launch, size: 50, color: Colors.white),
                const SizedBox(height: 8),
                const Text(
                  'Vanakkam! 🙏',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Games, Food, Jobs, Movies - Ellam Inga Irukku!',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(12),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: [
                _buildCard(context, 'Games', Icons.sports_esports, Colors.orange, 'Mini Games Vilaiyaadu'),
                _buildCard(context, 'Food Order', Icons.fastfood, Colors.red, 'Namma Ooru Foods'),
                _buildCard(context, 'Jobs', Icons.work, Colors.blue, 'Velaivaippu'),
                _buildCard(context, 'Movies', Icons.movie, Colors.purple, 'Cinema Updates'),
                _buildCard(context, 'News', Icons.newspaper, Colors.green, 'Namma Ooru News'),
                _buildCard(context, 'Services', Icons.handyman, Colors.teal, 'All Services'),
                _buildCard(context, 'Shopping', Icons.shopping_cart, Colors.pink, 'Online Shopping'),
                _buildCard(context, 'Travel', Icons.directions_bus, Colors.indigo, 'Bus / Train'),
              ],
            ),
          ),
          // Banner Ad Placeholder - 100% Safe Build
          const BannerAdWidget(),
        ],
      ),
    );
  }

  static Widget _buildCard(BuildContext context, String title, IconData icon, Color color, String subtitle) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title - Coming Soon da! 🚀')),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.white, fontSize: 11), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

// 100% BUILD SAFE - No AdRequest errors
class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[200],
      child: const Center(
        child: Text(
          'Arjun Mastermind | Ad Space',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
