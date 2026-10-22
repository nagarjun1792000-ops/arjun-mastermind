import 'package:flutter/material.dart';

void main() {
  runApp(const ArjunApp());
}

class ArjunApp extends StatelessWidget {
  const ArjunApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF5FF),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
            decoration: const BoxDecoration(
              color: Color(0xFF7C3AED),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
            ),
            child: const Center(
              child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16),
              children: [
                _homeCard(context, 'Games', Icons.sports_esports, const GamesHubPage()),
                _homeCard(context, 'Food', Icons.fastfood, const FoodHubPage()),
                _homeCard(context, 'Movies', Icons.movie, const MoviePage()),
                _homeCard(context, 'Jobs', Icons.work, const JobsHubPage()),
                _homeCard(context, 'Travel', Icons.directions_bus, const TravelHubPage()),
                _homeCard(context, 'Dress', Icons.checkroom, const DressHubPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeCard(BuildContext ctx, String t, IconData ic, Widget page) {
    return GestureDetector(
      onTap: () { Navigator.push(ctx, MaterialPageRoute(builder: (_) => page)); },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ic, size: 40, color: const Color(0xFF7C3AED)),
            const SizedBox(height: 8),
            Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class GamesHubPage extends StatelessWidget {
  const GamesHubPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Games')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Tic Tac Toe'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => const TicPage())); },
          ),
        ],
      ),
    );
  }
}

class TicPage extends StatefulWidget {
  const TicPage({super.key});
  @override
  State<TicPage> createState() => TicPageState();
}

class TicPageState extends State<TicPage> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9,
        itemBuilder: (c, i) {
          return GestureDetector(
            onTap: () {
              if (board[i] == '') {
                setState(() { board[i] = xTurn ? 'X' : 'O'; xTurn = !xTurn; });
              }
            },
            child: Card(child: Center(child: Text(board[i], style: const TextStyle(fontSize: 40)))),
          );
        },
      ),
    );
  }
}

class FoodHubPage extends StatefulWidget {
  const FoodHubPage({super.key});
  @override
  State<FoodHubPage> createState() => FoodHubPageState();
}

class FoodHubPageState extends State<FoodHubPage> {
  String district = 'Chennai';
  List<String> districts = ['Chennai','Coimbatore','Madurai','Salem','Trichy','Thanjavur'];
  String platform = 'Swiggy';
  List<String> platforms = ['Swiggy','Zomato','Zepto','Blinkit','BigBasket'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food - $district')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButton<String>(
              value: district,
              isExpanded: true,
              items: districts.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
              onChanged: (v) { setState(() { district = v!; }); },
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: platforms.map((p) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(label: Text(p), selected: platform == p, onSelected: (v) { setState(() { platform = p; }); }),
                );
              }).toList(),
            ),
          ),
          const Expanded(child: Center(child: Text('Food Menu Here'))),
        ],
      ),
    );
  }
}

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});
  @override
  State<MoviePage> createState() => MoviePageState();
}

class MoviePageState extends State<MoviePage> {
  String district = 'Coimbatore';
  List<String> districts = ['Chennai','Coimbatore','Madurai','Salem','Trichy'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies - $district')),
      body: Column(
        children: [
          DropdownButton<String>(
            value: district,
            isExpanded: true,
            items: districts.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
            onChanged: (v) { setState(() { district = v!; }); },
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _movieCard('Jailer 2'),
                _movieCard('Leo 2'),
                _movieCard('KGF 3'),
                _movieCard('Avatar 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _movieCard(String title) {
    return GestureDetector(
      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => SeatPage(movieTitle: title, district: district))); },
      child: Card(child: Center(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)))),
    );
  }
}

class SeatPage extends StatefulWidget {
  final String movieTitle;
  final String district;
  const SeatPage({super.key, required this.movieTitle, required this.district});
  @override
  State<SeatPage> createState() => SeatPageState();
}

class SeatPageState extends State<SeatPage> {
  List<String> selected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movieTitle)),
      body: Column(
        children: [
          Text('District: ${widget.district}'),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
              itemCount: 40,
              itemBuilder: (c, i) {
                String seat = 'A${i+1}';
                bool sel = selected.contains(seat);
                return GestureDetector(
                  onTap: () { setState(() { if (sel) { selected.remove(seat); } else { selected.add(seat); } }); },
                  child: Container(margin: const EdgeInsets.all(4), color: sel ? Colors.green : Colors.white, child: Center(child: Text('${i+1}', style: const TextStyle(fontSize: 10)))),
                );
              },
            ),
          ),
          if (selected.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booked ${selected.join(",")} in ${widget.district}'))); Navigator.pop(context); },
                child: Text('Pay Rs.${selected.length * 180}'),
              ),
            ),
        ],
      ),
    );
  }
}

class JobsHubPage extends StatefulWidget {
  const JobsHubPage({super.key});
  @override
  State<JobsHubPage> createState() => JobsHubPageState();
}

class JobsHubPageState extends State<JobsHubPage> {
  String district = 'All Districts';
  String filter = 'All';
  List<String> districts = ['All Districts','Chennai','Coimbatore','Madurai','Salem','Trichy','Thanjavur','Vellore','Erode','Tiruppur'];
  List<Map<String, String>> jobs = [
    {'title':'Flutter Dev','company':'Zoho','salary':'45k','type':'IT','loc':'Chennai'},
    {'title':'TNPSC Group 4','company':'TN Govt','salary':'35k','type':'Government','loc':'All Districts'},
    {'title':'Bank Clerk','company':'SBI','salary':'28k','type':'Government','loc':'Coimbatore'},
  ];
  List<Map<String, String>> get filtered {
    var list = jobs;
    if (filter != 'All') { list = list.where((j) => j['type'] == filter).toList(); }
    if (district != 'All Districts') { list = list.where((j) => j['loc'] == district || j['loc'] == 'All Districts').toList(); }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jobs - $district')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButton<String>(
              value: district,
              isExpanded: true,
              items: districts.map((d) => DropdownMenuItem(value: d, child: Text(d, style: const TextStyle(fontSize: 12)))).toList(),
              onChanged: (v) { setState(() { district = v!; }); },
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ['All','IT','Government','Private'].map((f) {
                return Padding(padding: const EdgeInsets.only(right: 8), child: ChoiceChip(label: Text(f), selected: filter == f, onSelected: (v) { setState(() { filter = f; }); }));
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (c, i) {
                var j = filtered[i];
                return Card(
                  child: ListTile(
                    title: Text(j['title']!),
                    subtitle: Text('${j['company']!} - ${j['salary']!}'),
                    trailing: ElevatedButton(
                      onPressed: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Applied for ${j['title']!}'))); },
                      child: const Text('Apply'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TravelHubPage extends StatefulWidget {
  const TravelHubPage({super.key});
  @override
  State<TravelHubPage> createState() => TravelHubPageState();
}

class TravelHubPageState extends State<TravelHubPage> {
  String fromDistrict = 'Chennai';
  String toDistrict = 'Coimbatore';
  List<String> districts = ['All Districts','Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode','Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai','Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet','Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli','Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'];
  List<Map<String, String>> buses = [
    {'name':'Parveen Travels','time':'08:00 PM','price':'750','type':'AC Sleeper','from':'Chennai','to':'Coimbatore'},
    {'name':'SETC Govt','time':'10:30 PM','price':'450','type':'Non AC','from':'Chennai','to':'Madurai'},
    {'name':'SRS Travels','time':'09:15 PM','price':'900','type':'AC Sleeper','from':'Coimbatore','to':'Chennai'},
    {'name':'KPN Travels','time':'07:30 PM','price':'650','type':'Semi Sleeper','from':'Salem','to':'Chennai'},
    {'name':'Mettur Super Fast','time':'06:00 AM','price':'350','type':'Govt','from':'Chennai','to':'Salem'},
  ];
  List<Map<String, String>> get filteredBuses {
    return buses.where((b) => (b['from'] == fromDistrict || fromDistrict == 'All Districts') && (b['to'] == toDistrict || toDistrict == 'All Districts')).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel - TN Buses'), backgroundColor: const Color(0xFF059669)),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: fromDistrict,
                    decoration: const InputDecoration(labelText: 'FROM', border:
