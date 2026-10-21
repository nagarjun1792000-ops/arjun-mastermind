import 'package:flutter/material.dart';
import 'games_hub.dart';

void main() => runApp(ArjunApp());

class ArjunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final items = [
    {'ta': 'Games', 'en': 'Games', 'icon': Icons.sports_esports},
    {'ta': 'Food Order', 'en': 'Food', 'icon': Icons.fastfood},
    {'ta': 'Dress Order', 'en': 'Dress', 'icon': Icons.checkroom},
    {'ta': 'Jobs', 'en': 'Jobs', 'icon': Icons.work},
    {'ta': 'Movies', 'en': 'Movies', 'icon': Icons.movie},
    {'ta': 'Travel', 'en': 'Travel', 'icon': Icons.directions_bus},
    {'ta': 'Notifications', 'en': 'Notifs', 'icon': Icons.notifications},
    {'ta': 'Arjun Special', 'en': 'Special', 'icon': Icons.stars},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF5FF),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 40),
            decoration: BoxDecoration(
              color: Color(0xFF7C3AED),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'ARJUN MASTERMIND',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                ),
                SizedBox(height: 20),
                Text('Vanakkam Nagarjun!', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                Text('Mastermind ku varuga!', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemCount: items.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    if (i == 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => GamesHubPage()));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(title: items[i]['ta']! as String, subtitle: items[i]['en']! as String)));
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(items[i]['icon'] as IconData, size: 40, color: Color(0xFF7C3AED)),
                        SizedBox(height: 8),
                        Text(items[i]['ta']! as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center),
                        Text(items[i]['en']! as String, style: TextStyle(color: Colors.grey, fontSize: 10)),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  DetailPage({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Color(0xFF7C3AED)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.rocket_launch, size: 80, color: Color(0xFF7C3AED)),
            SizedBox(height: 20),
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Text('Intha page la un content varum da Nagarjun!'),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Back Poga')),
          ],
        ),
      ),
    );
  }
}
