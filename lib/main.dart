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
    List<Map<String, dynamic>> items = [
      {'ta': 'Games', 'icon': Icons.sports_esports},
      {'ta': 'Food Order', 'icon': Icons.fastfood},
      {'ta': 'Dress Order', 'icon': Icons.checkroom},
      {'ta': 'Jobs', 'icon': Icons.work},
      {'ta': 'Movies', 'icon': Icons.movie},
      {'ta': 'Travel', 'icon': Icons.directions_bus},
      {'ta': 'Notifications', 'icon': Icons.notifications},
      {'ta': 'Arjun Special', 'icon': Icons.stars},
    ];

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
                  child: Text('ARJUN MASTERMIND',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Text('Vanakkam Nagarjun!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
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
                  childAspectRatio: 0.9),
              itemCount: items.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    if (i == 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => GamesHubPage()));
                    } else if (i == 1) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => FoodHubPage()));
                    } else if (i == 4) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MovieHubPage()));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(title: items[i]['ta'].toString())));
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(items[i]['icon'] as IconData, size: 40, color: Color(0xFF7C3AED)),
                        SizedBox(height: 8),
                        Text(items[i]['ta'].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center),
                      ],
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

class DetailPage extends StatelessWidget {
  final String title;
  DetailPage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Color(0xFF7C3AED)),
      body: Center(child: Text('$title Coming Soon da!')),
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
          Card(child: ListTile(leading: Icon(Icons.grid_3x3, size: 40, color: Colors.orange), title: Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage())))),
        ],
      ),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String win = '';
  void checkWin() {
    List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    for (var p in w) {
      if (board[p[0]] != '' && board[p[0]] == board[p[1]] && board[p[1]] == board[p[2]]) { win = board[p[0]]; return; }
    }
    if (!board.contains('')) win = 'Draw';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Column(children: [
        SizedBox(height: 20),
        Text(win == '' ? '${xTurn ? "X" : "O"} Turn' : '$win Wins', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: 9, itemBuilder: (c,i) => GestureDetector(onTap: () { if(board[i]=='' && win==''){ setState((){ board[i]=xTurn?'X':'O'; xTurn=!xTurn; checkWin(); }); } }, child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize: 40))))))),
        ElevatedButton(onPressed: (){ setState((){ board=List.filled(9,''); win=''; xTurn=true; }); }, child: Text('Restart')),
        SizedBox(height: 20),
      ]),
    );
  }
}

class FoodHubPage extends StatefulWidget {
  @override
  _FoodHubPageState createState() => _FoodHubPageState();
}

class _FoodHubPageState extends State<FoodHubPage> {
  String selectedDistrict = 'Chennai';
  String selectedPlatform = 'Swiggy';
  List<String> districts = ['Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode','Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai','Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet','Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli','Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'];
  Map<String, List<Map<String, dynamic>>> platformData = {
    'Swiggy': [{'name': 'Chicken Biryani','price': 250,'shop': 'SS Hyderabad'},{'name': 'Mutton Biryani','price': 350,'shop': 'Thalappakatti'}],
    'Zomato': [{'name': 'Fried Rice','price': 220,'shop': 'Zomato Kitchen'}],
    'Zepto': [{'name': 'Milk 500ml','price': 32,'shop': 'Zepto Cafe'}],
    'Blinkit': [{'name': 'Milk 1L','price': 60,'shop': 'Blinkit Mart'}],
    'BigBasket': [{'name': 'Tomato 1kg','price': 35,'shop': 'BigBasket Fresh'}],
  };
  List<Map<String, dynamic>> cart = [];
  int totalPrice(){ int s=0; for(var e in cart){ s=s+(e['price'] as int); } return s; }
  Color getColor(String p){ if(p=='Swiggy') return Colors.orange; if(p=='Zomato') return Color(0xFFE23744); if(p=='Zepto') return Color(0xFF8B3CF7); if(p=='Blinkit') return Color(0xFFFACC15); return Color(0xFF84CC16); }
  @override
  Widget build(BuildContext context){
    var foods = platformData[selectedPlatform]!;
    Color pColor = getColor(selectedPlatform);
    return Scaffold(appBar: AppBar(title: Text('Food - $selectedPlatform'), backgroundColor: pColor), body: Column(children: [
      Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), color: Colors.grey.shade100, child: Row(children: [Icon(Icons.location_on, color: Colors.red, size: 18), SizedBox(width:6), Expanded(child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: selectedDistrict, isExpanded: true, items: districts.map((d)=> DropdownMenuItem(value: d, child: Text(d, style: TextStyle(fontSize:13)))).toList(), onChanged: (val){ if(val!=null) setState((){ selectedDistrict=val; }); }))),])),
      Container(height: 50, child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.all(8), children: ['Swiggy','Zomato','Zepto','Blinkit','BigBasket'].map((p)=> Padding(padding: EdgeInsets.only(right:8), child: ChoiceChip(label: Text(p), selected: selectedPlatform==p, onSelected: (v){ setState((){ selectedPlatform=p; }); }))).toList())),
      Expanded(child: ListView.builder(padding: EdgeInsets.all(10), itemCount: foods.length, itemBuilder: (c,i){ return Card(child: ListTile(title: Text(foods[i]['name']), subtitle: Text('Rs.${foods[i]['price']} - ${foods[i]['shop']} - $selectedDistrict'), trailing: ElevatedButton(onPressed: (){ setState((){ cart.add({'name': foods[i]['name'],'price': foods[i]['price'],'platform': selectedPlatform,'shop': foods[i]['shop']}); }); }, child: Text('ADD')))); })),
      if(cart.length>0) Container(padding: EdgeInsets.all(12), color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total Rs.${totalPrice()} - ${cart.length} items'), ElevatedButton(onPressed: (){ setState((){ cart=[]; }); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Success in $selectedDistrict!'))); }, child: Text('Order Now'))])),
    ]));
  }
}

class MovieHubPage extends StatefulWidget {
  @override
  _MovieHubPageState createState() => _MovieHubPageState();
}

class _MovieHubPageState extends State<MovieHubPage> {
  String selectedDistrict = 'Chennai';
  List<String> districts = ['Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode','Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai','Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet','Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli','Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'];

  List<String> getTheaters(String district) {
    if (district == 'Chennai') return ['Sathyam Cinemas','PVR VR Mall','INOX Citi Center','Rohini Silver Screens'];
    if (district == 'Coimbatore') return ['KG Cinemas','INOX Prozone','The Cinema','Broadway Cinemas'];
    if (district == 'Madurai') return ['Vetri Cinemas','INOX Visal Mall','Thangam Cinemas'];
    return ['$district Sathyam Cinemas','PVR $district','INOX $district','Arjun Multiplex $district','City $district Talkies'];
  }

  List<Map<String, dynamic>> movies = [
    {'title': 'Leo 2','rating': '4.5','type': 'Action','price': 180,'color': Colors.red},
    {'title': 'Vikram Returns','rating': '4.7','type': 'Thriller','price': 200,'color': Colors.black},
    {'title': 'Jailer 2','rating': '4.6','type': 'Comedy','price': 190,'color': Colors.orange},
    {'title': 'PS 3','rating': '4.8','type': 'Historical','price': 220,'color': Colors.brown},
    {'title': 'Thunivu 2','rating': '4.4','type': 'Action','price': 170,'color': Colors.blue},
    {'title': 'KGF 3','rating': '4.9','type': 'Action','price': 250,'color': Colors.amber},
  ];

  void openBooking(Map<String, dynamic> movie) {
    List<String> theaters = getTheaters(selectedDistrict);
    String selectedTheater = theaters[0];
    String selectedTime = '7:00 PM';
    List<String> times = ['10:00 AM','1:30 PM','4:00 PM','7:00 PM','10:00 PM'];
    List<int> selectedSeats = [];

    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Color(0xFF1F1F1F), shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))), builder: (context) {
      return StatefulBuilder(builder: (ctx, setSheet) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10))),
            SizedBox(height: 12),
            Text('${movie['title']} - $selectedDistrict', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(value: selectedTheater, dropdownColor: Color(0xFF2A2A2A), style: TextStyle(color: Colors.white), decoration: InputDecoration(labelText: 'Theater', labelStyle: TextStyle(color: Colors.grey), border: OutlineInputBorder()), items: theaters.map((t)=> DropdownMenuItem(value: t, child: Text(t, style: TextStyle(fontSize:12)))).toList(), onChanged: (v){ setSheet((){ selectedTheater=v!; }); }),
            SizedBox(height: 10),
            Wrap(spacing: 8, children: times.map((t)=> ChoiceChip(label: Text(t, style: TextStyle(fontSize: 12)), selected: selectedTime==t, selectedColor: Color(0xFFE50914), onSelected: (v){ setSheet((){ selectedTime=t; }); })).toList()),
            SizedBox(height: 10),
            Text('Select Seats - Rs.${movie['price']} each', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            GridView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8, crossAxisSpacing: 6, mainAxisSpacing: 6), itemCount: 32, itemBuilder: (c, idx){ bool sel = selectedSeats.contains(idx); return GestureDetector(onTap: (){ setSheet((){ if(sel) selectedSeats.remove(idx); else selectedSeats.add(idx); }); }, child: Container(decoration: BoxDecoration(color: sel? Color(0xFFE50914): Colors.grey.shade300, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.chair, size: 14, color: sel? Colors.white: Colors.black54))); }),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('${selectedSeats.length} Seats', style: TextStyle(color: Colors.white)), Text('Rs.${selectedSeats.length * (movie['price'] as int)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))]),
            SizedBox(height: 10),
            SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE50914), padding: EdgeInsets.all(14)), onPressed: selectedSeats.isEmpty? null: (){ Navigator.pop(context); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SUCCESS! ${movie['title']} booked at $selectedTheater, $selectedTime, $selectedDistrict - ${selectedSeats.length} tickets'), backgroundColor: Colors.green)); }, child: Text(selectedSeats.isEmpty? 'Select Seats': 'PAY Rs.${selectedSeats.length * (movie['price'] as int)} & BOOK', style: TextStyle(color: Colors.white)))) ,
            SizedBox(height: 20),
          ]),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> theaters = getTheaters(selectedDistrict);
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      appBar: AppBar(title: Text('Movies - $selectedDistrict'), backgroundColor: Color(0xFFE50914), foregroundColor: Colors.white),
      body: Column(children: [
        Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), color: Colors.white, child: Row(children: [Icon(Icons.location_city, color: Colors.red, size: 20), SizedBox(width:6), Text('City:', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(width:8), Expanded(child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: selectedDistrict, isExpanded: true, items: districts.map((d)=> DropdownMenuItem(value: d, child: Text(d))).toList(), onChanged: (val){ if(val!=null) setState((){ selectedDistrict=val; }); }))), Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)), child: Text('${theaters.length} Theaters', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)))])),
        Expanded(child: ListView.builder(padding: EdgeInsets.all(12), itemCount: movies.length, itemBuilder: (c,i){ var m = movies[i]; return Card(margin: EdgeInsets.only(bottom: 12), color: Color(0xFF1F1F1F), child: ListTile(title: Text(m['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), subtitle: Text('${m['rating']} * ${m['type']} - Rs.${m['price']} - $selectedDistrict - ${theaters.length} theaters', style: TextStyle(color: Colors.grey, fontSize: 11)), trailing: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE50914)), onPressed: (){ openBooking(m); }, child: Text('Book', style: TextStyle(color: Colors.white))))); })),
      ]),
    );
  }
}
