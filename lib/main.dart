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

class TravelHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel')),
      body: Center(child: Text('Travel - Bus Booking Coming Soon da!')),
    );
  }
}

class DressHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dress Order')),
      body: Center(child: Text('Dress Order Coming Soon da!')),
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
                homeCard(context, 'Jobs', Icons.work, JobsHubPage()),
                homeCard(context, 'Travel', Icons.directions_bus, TravelHubPage()),
                homeCard(context, 'Dress', Icons.checkroom, DressHubPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget homeCard(BuildContext ctx, String t, IconData ic, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(ctx, MaterialPageRoute(builder: (_) => page));
      },
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

class GamesHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Games Hub'), backgroundColor: Colors.orange),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(child: ListTile(leading: Icon(Icons.grid_3x3, size: 40, color: Colors.orange), title: Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold)), trailing: Icon(Icons.arrow_forward), onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage())); })),
          Card(child: ListTile(leading: Icon(Icons.gamepad, size: 40, color: Colors.green), title: Text('Snake Game'), subtitle: Text('Coming Soon'), onTap: () {})),
        ],
      ),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  @override
  State<TicTacToePage> createState() => TicTacToePageState();
}

class TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String win = '';

  void checkWin() {
    List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    for (var p in w) {
      if (board[p[0]] != '' && board[p[0]] == board[p[1]] && board[p[1]] == board[p[2]]) {
        win = board[p[0]];
        return;
      }
    }
    if (!board.contains('')) {
      win = 'Draw';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(win == '' ? '${xTurn ? "X" : "O"} Turn' : win == 'Draw' ? 'Draw!' : '$win Wins!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (c, i) {
                return GestureDetector(
                  onTap: () {
                    if (board[i] == '' && win == '') {
                      setState(() {
                        board[i] = xTurn ? 'X' : 'O';
                        xTurn = !xTurn;
                        checkWin();
                      });
                    }
                  },
                  child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize: 40)))),
                );
              },
            ),
          ),
          ElevatedButton(onPressed: () { setState(() { board = List.filled(9, ''); win = ''; xTurn = true; }); }, child: Text('Restart')),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class FoodHubPage extends StatefulWidget {
  @override
  State<FoodHubPage> createState() => FoodHubPageState();
}

class FoodHubPageState extends State<FoodHubPage> {
  String district = 'Chennai';
  String platform = 'Swiggy';
  List<String> districts = ['Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode','Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai','Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet','Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli','Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'];
  Map<String, List<Map<String, dynamic>>> data = {
    'Swiggy': [{'name':'Chicken Biryani','price':250},{'name':'Mutton Biryani','price':350}],
    'Zomato': [{'name':'Fried Rice','price':220},{'name':'Noodles','price':180}],
    'Zepto': [{'name':'Milk 500ml','price':32}],
    'Blinkit': [{'name':'Milk 1L','price':60}],
    'BigBasket': [{'name':'Tomato 1kg','price':35}],
  };
  List<Map<String, dynamic>> cart = [];
  int total() { int s=0; for(var e in cart){ s += e['price'] as int; } return s; }
  @override
  Widget build(BuildContext context) {
    var foods = data[platform]!;
    return Scaffold(
      appBar: AppBar(title: Text('Food - $platform - $district'), backgroundColor: Colors.orange),
      body: Column(
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), color: Colors.grey.shade100, child: Row(children: [Icon(Icons.location_on, color: Colors.red, size: 18), SizedBox(width:6), Expanded(child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: district, isExpanded: true, items: districts.map((d) => DropdownMenuItem(value: d, child: Text(d, style: TextStyle(fontSize:12)))).toList(), onChanged: (v) { setState(() { district = v!; }); }))) ])),
          Container(height: 50, child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.all(8), children: ['Swiggy','Zomato','Zepto','Blinkit','BigBasket'].map((p) { return Padding(padding: EdgeInsets.only(right:8), child: ChoiceChip(label: Text(p), selected: platform==p, onSelected: (v) { setState(() { platform=p; }); })); }).toList())),
          Expanded(child: ListView.builder(padding: EdgeInsets.all(10), itemCount: foods.length, itemBuilder: (c,i) { return Card(child: ListTile(title: Text(foods[i]['name']), subtitle: Text('Rs.${foods[i]['price']}'), trailing: ElevatedButton(onPressed: () { setState(() { cart.add({'name':foods[i]['name'],'price':foods[i]['price']}); }); }, child: Text('ADD')))); })),
          if(cart.isNotEmpty) Container(padding: EdgeInsets.all(12), color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total Rs.${total()} - ${cart.length} items'), ElevatedButton(onPressed: () { setState(() { cart=[]; }); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Success in $district!'), backgroundColor: Colors.green)); }, child: Text('Order Now'))])),
        ],
      ),
    );
  }
}

class MovieNowShowingPage extends StatefulWidget {
  @override
  State<MovieNowShowingPage> createState() => MovieNowShowingPageState();
}

class MovieNowShowingPageState extends State<MovieNowShowingPage> {
  String district = 'Coimbatore';
  String filter = 'Tamil';
  List<String> districts = ['Chennai','Coimbatore','Madurai','Salem','Trichy','Tirunelveli','Thanjavur','Vellore','Erode','Tiruppur'];
  List<Map<String, dynamic>> movies = [
    {'title':'Jailer 2','sub':'367K+ likes','lang':'Tamil','col':Colors.brown},
    {'title':'Street Fighter','sub':'7.3  3.6K+ votes','lang':'English','col':Colors.red},
    {'title':'Drones','sub':'8.9  1.4K+ votes','lang':'Tamil','col':Colors.orange},
    {'title':'Baththa','sub':'9.2  37.2K+ votes','lang':'Tamil','col':Colors.deepOrange},
    {'title':'Leo 2','sub':'420K+ likes','lang':'Tamil','col':Colors.redAccent},
    {'title':'KGF 3','sub':'9.0  50K+ votes','lang':'Kannada','col':Colors.amber},
  ];
  List<Map<String, dynamic>> get filtered {
    if (filter == 'All') { return movies; }
    if (filter == 'New Releases') { return movies; }
    return movies.where((m) => m['lang'] == filter).toList();
  }
  Widget chip(String label) {
    bool sel = filter == label;
    return Container(margin: EdgeInsets.only(right:8), child: ChoiceChip(label: Text(label, style: TextStyle(fontSize:12)), selected: sel, selectedColor: Color(0xFFFFE4E8), onSelected: (v) { setState(() { filter = label; }); }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black), title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Now Showing', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:18)), Text('$district | ${filtered.length} Movies', style: TextStyle(color: Colors.grey, fontSize:12))])),
      body: Column(
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 12), child: DropdownButton<String>(value: district, isExpanded: true, items: districts.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(), onChanged: (v) { setState(() { district = v!; }); })),
          SingleChildScrollView(scrollDirection: Axis.horizontal, padding: EdgeInsets.all(8), child: Row(children: [chip('All'), chip('New Releases'), chip('Tamil'), chip('English'), chip('Hindi')])),
          Expanded(child: GridView.builder(padding: EdgeInsets.all(12), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.62, crossAxisSpacing: 12, mainAxisSpacing: 12), itemCount: filtered.length, itemBuilder: (c,i) { var m=filtered[i]; return GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => SeatPage(movie: m, district: district))); }, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(height: 200, decoration: BoxDecoration(color: m['col'], borderRadius: BorderRadius.circular(12)), child: Center(child: Text(m['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:20)))), SizedBox(height:6), Text(m['sub'], style: TextStyle(fontSize:11, color: Colors.grey)), Text(m['title'], style: TextStyle(fontWeight: FontWeight.bold))])); })),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(backgroundColor: Color(0xFFFF2C5A), onPressed: () {}, label: Text('Browse by Cinemas', style: TextStyle(color: Colors.white)), icon: Icon(Icons.location_on, color: Colors.white)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SeatPage extends StatefulWidget {
  final Map<String, dynamic> movie;
  final
