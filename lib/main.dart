import 'package:flutter/material.dart';

void main() {
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
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
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
        backgroundColor: const Color(0xFF4A148C),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Arjun Mastermind', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
            Text('Namma Ooru All-in-One Super App', style: TextStyle(fontSize: 11, color: Colors.white70)),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF4A148C),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            ),
            child: const Column(
              children: [
                Icon(Icons.rocket_launch, size: 48, color: Colors.white),
                SizedBox(height: 10),
                Text('Vanakkam Da! 🙏', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text('Games, Food, Jobs, Movies - Ellam Inga Irukku!', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(12),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _card('Games', Icons.sports_esports, Colors.orange),
                _card('Food Order', Icons.fastfood, Colors.red),
                _card('Jobs', Icons.work, Colors.blue),
                _card('Movies', Icons.movie, Colors.purple),
                _card('News', Icons.newspaper, Colors.green),
                _card('Services', Icons.handyman, Colors.teal),
                _card('Shopping', Icons.shopping_cart, Colors.pink),
                _card('Travel', Icons.bus_alert, Colors.indigo),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.black12,
            child: const Center(child: Text('Arjun Mastermind | Namma Ooru App', style: TextStyle(fontSize: 12))),
          ),
        ],
      ),
    );
  }

  static Widget _card(String title, IconData icon, Color color) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [color.withOpacity(0.7), color]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 42, color: Colors.white),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
