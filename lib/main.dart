import 'package:flutter/material.dart';

void main() => runApp(ArjunMastermindApp());

class ArjunMastermindApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arjun Mastermind',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'ta': 'விளையாட்டுகள்', 'en': 'Games', 'icon': '🎮'},
    {'ta': 'உணவு ஆர்டர்', 'en': 'Food Order', 'icon': '🍔'},
    {'ta': 'உடை ஆர்டர்', 'en': 'Dress Order', 'icon': '👕'},
    {'ta': 'வேலைவாய்ப்புகள்', 'en': 'Jobs', 'icon': '💼'},
    {'ta': 'திரைப்படங்கள்', 'en': 'Movies', 'icon': '🎬'},
    {'ta': 'பயண டிக்கெட்', 'en': 'Travel', 'icon': '🚌'},
    {'ta': 'அறிவிப்புகள்', 'en': 'Notifications', 'icon': '🔔'},
    {'ta': 'Mastermind', 'en': 'Arjun Special', 'icon': '🧠'},
    {'ta': 'மேலும்', 'en': 'More', 'icon': '⭐'},
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1))),
                SizedBox(height: 25),
                Text('வணக்கம்! 👋', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text('Arjun Mastermind ku varuga!', style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.85, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: items.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(title: items[i]['ta']!, subtitle: items[i]['en']!)));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(items[i]['icon']!, style: TextStyle(fontSize: 40)),
                        SizedBox(height: 8),
                        Text(items[i]['ta']!, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        Text(items[i]['en']!, style: TextStyle(color: Colors.grey, fontSize: 11)),
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
            Text('🚀', style: TextStyle(fontSize: 80)),
            SizedBox(height: 20),
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Text('Intha page la un content varum da Nagarjun!', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Back Poga')),
          ],
        ),
      ),
    );
  }
}
