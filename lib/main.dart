import 'package:flutter/material.dart';

void main() {
  runApp(ArjunApp());
}

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
            child: Center(
              child: Text(
                'ARJUN MASTERMIND',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(16),
              children: [
                homeCard(context, 'Games', Icons.sports_esports, GamesHubPage()),
                homeCard(context, 'Food', Icons.fastfood, FoodHubPage()),
                homeCard(context, 'Movies', Icons.movie, MovieNowShowingPage()),
                homeCard(context, 'Jobs', Icons.work, DetailPage(title: 'Jobs')),
                homeCard(context, 'Travel', Icons.directions_bus, DetailPage(title: 'Travel')),
                homeCard(context, 'Dress', Icons.checkroom, DetailPage(title: 'Dress')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget homeCard(BuildContext ctx, String t, IconData ic, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => page)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ic, size: 40, color: Color(0xFF7C3AED)),
            SizedBox(height: 8),
            Text(t, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  DetailPage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title Coming Soon')),
    );
  }
}

class GamesHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Games')), body: Center(child: Text('Games')));
  }
}

class FoodHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Food')), body: Center(child: Text('Food')));
  }
}

class MovieNowShowingPage extends StatefulWidget {
  @override
  State<MovieNowShowingPage> createState() => MovieNowShowingPageState();
}

class MovieNowShowingPageState extends State<MovieNowShowingPage> {
  String district = 'Coimbatore';
  String filter = 'Tamil';

  List<String> districts = [
    'Chennai','Coimbatore','Madurai','Salem','Trichy','Tirunelveli','Thanjavur','Vellore','Erode','Tiruppur'
  ];

  List<Map<String, dynamic>> movies = [
    {'title': 'Jailer 2', 'sub': '367K+ likes', 'lang': 'Tamil', 'col': Colors.brown},
    {'title': 'Street Fighter', 'sub': '7.3  3.6K+ votes', 'lang': 'English', 'col': Colors.red},
    {'title': 'Drones', 'sub': '8.9  1.4K+ votes', 'lang': 'Tamil', 'col': Colors.orange},
    {'title': 'Baththa', 'sub': '9.2  37.2K+ votes', 'lang': 'Tamil', 'col': Colors.deepOrange},
    {'title': 'Leo 2', 'sub': '420K+ likes', 'lang': 'Tamil', 'col': Colors.redAccent},
    {'title': 'KGF 3', 'sub': '9.0  50K+ votes', 'lang': 'Kannada', 'col': Colors.amber},
    {'title': 'Avatar 3', 'sub': '8.8  22K+ votes', 'lang': 'English', 'col': Colors.teal},
    {'title': 'Jawan 2', 'sub': '290K+ likes', 'lang': 'Hindi', 'col': Colors.deepOrange},
  ];

  List<Map<String, dynamic>> get filtered {
    if (filter == 'All') return movies;
    if (filter == 'New Releases') return movies;
    return movies.where((m) => m['lang'] == filter).toList();
  }

  Widget chip(String label) {
    bool sel = filter == label;
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label, style: TextStyle(fontSize: 12)),
        selected: sel,
        selectedColor: Color(0xFFFFE4E8),
        onSelected: (v) => setState(() => filter = label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Now Showing', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
            Text('$district | ${filtered.length} Movies', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<String>(
              value: district,
              isExpanded: true,
              items: districts.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
              onChanged: (v) => setState(() => district = v!),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                chip('All'),
                chip('New Releases'),
                chip('Tamil'),
                chip('English'),
                chip('Hindi'),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.62, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: filtered.length,
              itemBuilder: (c, i) {
                var m = filtered[i];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SeatPage(movie: m, district: district))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(color: m['col'], borderRadius: BorderRadius.circular(12)),
                        child: Center(child: Text(m['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
                      ),
                      SizedBox(height: 6),
                      Text(m['sub'], style: TextStyle(fontSize: 11, color: Colors.grey)),
                      Text(m['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFFF2C5A),
        onPressed: () {},
        label: Text('Browse by Cinemas', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.location_on, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SeatPage extends StatefulWidget {
  final Map<String, dynamic> movie;
  final String district;
  SeatPage({required this.movie, required this.district});
  @override
  State<SeatPage> createState() => SeatPageState();
}

class SeatPageState extends State<SeatPage> {
  String time = '09:45 PM';
  List<String> sel = [];
  Set<String> sold = {'A8','A7','B6','B7','C6','C7','H8','H9','I9','J12','K10','N9'};
  Set<String> best = {'C16','J8','J9'};

  Widget seat(String k) {
    bool isSold = sold.contains(k);
    bool isSel = sel.contains(k);
    bool isBest = best.contains(k);
    Color bg;
    Color br;
    if (isSold) { bg = Colors.grey.shade300; br = Colors.grey.shade300; }
    else if (isSel) { bg = Color(0xFF16A34A); br = Color(0xFF16A34A); }
    else if (isBest) { bg = Colors.amber.shade100; br = Colors.amber; }
    else { bg = Colors.white; br = Colors.green; }

    return GestureDetector(
      onTap: isSold ? null : () => setState(() { if (isSel) sel.remove(k); else sel.add(k); }),
      child: Container(
        width: 28,
        height: 24,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(color: bg, border: Border.all(color: br), borderRadius: BorderRadius.circular(3)),
        child: Center(child: Text(k.replaceAll(RegExp(r'[A-Z]'), ''), style: TextStyle(fontSize: 9, color: isSel ? Colors.white : Colors.black))),
      ),
    );
  }

  Widget rowSeats(String r, List<int> left, List<int> right) {
    return Row(
      children: [
        SizedBox(width: 24, child: Text(r, style: TextStyle(fontSize: 11, color: Colors.grey))),
        ...left.map((n) => seat('$r$n')).toList(),
        SizedBox(width: 20),
        ...right.map((n) => seat('$r$n')).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.movie['title'], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Jayanthi Cinemas A/C 4K LASER ATMOS: P.N Palayam', style: TextStyle(color: Colors.grey, fontSize: 10)),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFF5F5F5),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wed, 21 Oct'),
                Text('2 Tickets', style: TextStyle(color: Color(0xFFFF2C5A))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                timeBox('06:15 PM'),
                SizedBox(width: 10),
                timeBox('09:45 PM'),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(children: [SizedBox(width: 24, child: Text('PA', style: TextStyle(fontSize: 11))), seat('PA8'), seat('PA7'), SizedBox(width: 20), seat('PA15'), seat('PA14')]),
                    Divider(),
                    ...List.generate(14, (i) {
                      String r = String.fromCharCode(65 + i);
                      return Padding(padding: EdgeInsets.only(bottom: 4), child: rowSeats(r, [6,7], [8,9,10,11,12,13,14,15,16]));
                    }),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        leg(Colors.amber.shade100, 'Bestseller'),
                        SizedBox(width: 12),
                        leg(Colors.white, 'Available'),
                        SizedBox(width: 12),
                        leg(Colors.green, 'Selected'),
                        SizedBox(width: 12),
                        leg(Colors.grey.shade300, 'Sold'),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          if (sel.isNotEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF2C5A), padding: EdgeInsets.all(14)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booked ${sel.join(",")} in ${widget.district}')));
                  Navigator.pop(context);
                },
                child: Text('Pay Rs.${sel.length * 180} - ${sel.length} Tickets', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
        ],
      ),
    );
  }

  Widget timeBox(String t) {
    bool s = time == t;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => time = t),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(color: s ? Color(0xFF16A34A) : Colors.white, border: Border.all(color: s ? Color(0xFF16A34A) : Colors.orange, width: 2), borderRadius: BorderRadius.circular(6)),
          child: Column(children: [Text(t, style: TextStyle(fontWeight: FontWeight.bold, color: s ? Colors.white : Colors.black)), Text('4K LASER ATMOS', style: TextStyle(fontSize: 9, color: s ? Colors.white70 : Colors.grey))]),
        ),
      ),
    );
  }

  Widget leg(Color c, String l) {
    return Row(children: [Container(width: 14, height: 12, decoration: BoxDecoration(color: c, border: Border.all(color: c == Colors.white ? Colors.green : c))), SizedBox(width: 4), Text(l, style: TextStyle(fontSize: 10))]);
  }
}                
