                                                                                                          
import 'package:flutter/material.dart';

void main() => runApp(ArjunMastermindApp());

class ArjunMastermindApp extends StatelessWidget {
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
                SizedBox(height: 20),
                Text('Vanakkam! Nagarjun', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                Text('Mastermind ku varuga!', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9),
              itemCount: items.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    Widget page;
                    if (i == 0) page = GamesHubPage();
                    else if (i == 1) page = FoodPage();
                    else if (i == 2) page = DressPage();
                    else if (i == 3) page = JobsPage();
                    else if (i == 4) page = MoviesPage();
                    else if (i == 5) page = TravelPage();
                    else if (i == 6) page = NotifPage();
                    else page = SpecialPage();
                    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(items[i]['icon'] as IconData, size: 40, color: Color(0xFF7C3AED)),
                        SizedBox(height: 8),
                        Text(items[i]['ta'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
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

// GAMES
class GamesHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Games')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(title: Text('Tic Tac Toe'), subtitle: Text('X O Game'), trailing: Icon(Icons.play_arrow), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage()))),
          ListTile(title: Text('Memory Game'), subtitle: Text('Jodi Sera'), trailing: Icon(Icons.play_arrow), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MemoryPage()))),
          ListTile(title: Text('Arjun Quiz'), subtitle: Text('GK Test'), trailing: Icon(Icons.play_arrow), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizPage()))),
        ],
      ),
    );
  }
}

class TicTacToePage extends StatefulWidget { @override State<TicTacToePage> createState() => _TicTacToePageState(); }
class _TicTacToePageState extends State<TicTacToePage> {
  List<String> b = List.filled(9, '');
  bool xTurn = true;
  String winner = '';
  void check() {
    List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    for (var p in w) {
      if (b[p[0]] != '' && b[p[0]] == b[p[1]] && b[p[1]] == b[p[2]]) { winner = b[p[0]]; return; }
    }
    if (!b.contains('')) winner = 'Draw';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(winner == '' ? '${xTurn ? "X" : "O"} Turn' : '$winner Wins', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: 9, itemBuilder: (c,i) => GestureDetector(onTap: (){ if(b[i]=='' && winner==''){ setState((){ b[i]=xTurn?'X':'O'; xTurn=!xTurn; check(); }); } }, child: Card(child: Center(child: Text(b[i], style: TextStyle(fontSize: 40))))))),
          ElevatedButton(onPressed: ()=> setState((){ b=List.filled(9,''); winner=''; xTurn=true; }), child: Text('Restart')),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class MemoryPage extends StatefulWidget { @override State<MemoryPage> createState() => _MemoryPageState(); }
class _MemoryPageState extends State<MemoryPage> {
  List<int> nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8];
  List<bool> show = List.filled(16, false);
  int? first;
  @override void initState(){ super.initState(); nums.shuffle(); }
  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text('Memory Game')), body: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemCount: 16, itemBuilder: (c,i)=> GestureDetector(onTap: (){
      if(show[i]) return;
      setState(()=> show[i]=true);
      if(first==null){ first=i; }
      else{
        if(nums[first!]==nums[i]){ first=null; }
        else{ Future.delayed(Duration(milliseconds: 500), (){ setState((){ show[first!]=false; show[i]=false; first=null; }); }); }
      }
    }, child: Card(color: show[i]? Colors.white : Color(0xFF7C3AED), child: Center(child: Text(show[i]? '${nums[i]}' : '?', style: TextStyle(fontSize: 24)))))));
  }
}

class QuizPage extends StatefulWidget { @override State<QuizPage> createState() => _QuizPageState(); }
class _QuizPageState extends State<QuizPage>{
  int q=0, score=0;
  List<Map<String,dynamic>> list = [
    {'q':'Tamil Nadu capital?','o':['Chennai','Madurai','Trichy'],'a':0},
    {'q':'Arjun Mastermind creator?','o':['Nagarjun','Rajini','Kamal'],'a':0},
    {'q':'Flutter by?','o':['Google','Meta','Apple'],'a':0},
  ];
  @override Widget build(BuildContext context){
    if(q>=list.length) return Scaffold(appBar: AppBar(title: Text('Result')), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Score $score/${list.length}', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)), ElevatedButton(onPressed: ()=> setState((){q=0;score=0;}), child: Text('Again'))])));
    return Scaffold(appBar: AppBar(title: Text('Quiz ${q+1}/${list.length}')), body: Padding(padding: EdgeInsets.all(20), child: Column(children: [Text(list[q]['q'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 20), ...List.generate(3, (i)=> Card(child: ListTile(title: Text(list[q]['o'][i]), onTap: (){ if(i==list[q]['a']) score++; setState(()=> q++); }))) ])));
  }
}

// FOOD
class FoodPage extends StatefulWidget { @override State<FoodPage> createState() => _FoodPageState(); }
class _FoodPageState extends State<FoodPage>{
  List<Map<String,dynamic>> foods = [
    {'n':'Chicken Biryani','p':250},
    {'n':'Dosa','p':80},
    {'n':'Parotta','p':100},
    {'n':'Pizza','p':199},
    {'n':'Burger','p':120},
  ];
  List<Map<String,dynamic>> cart = [];
  @override Widget build(BuildContext context){
    int total = cart.fold(0, (s,e)=> s + (e['p'] as int));
    return Scaffold(
      appBar: AppBar(title: Text('Food Order - ${cart.length} items'), backgroundColor: Colors.red),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: foods.length, itemBuilder: (c,i)=> Card(margin: EdgeInsets.all(8), child: ListTile(title: Text(foods[i]['n']), subtitle: Text('Rs ${foods[i]['p']}'), trailing: ElevatedButton(child: Text('Add'), onPressed: (){ setState(()=> cart.add(foods[i])); }))))),
          Container(padding: EdgeInsets.all(16), color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total Rs $total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: (){ if(cart.isNotEmpty){ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Placed da Nagarjun!'))); setState(()=> cart.clear()); } }, child: Text('Order Now'))]))
        ],
      ),
    );
  }
}

// DRESS
class DressPage extends StatelessWidget {
  final dresses = [
    {'n':'T-Shirt','p':499},
    {'n':'Jeans','p':1299},
    {'n':'Saree','p':1999},
    {'n':'Hoodie','p':899},
  ];
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Dress Order'), backgroundColor: Colors.blue),
      body: GridView.builder(padding: EdgeInsets.all(12), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8), itemCount: dresses.length, itemBuilder: (c,i)=> Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.checkroom, size: 50), Text(dresses[i]['n'] as String, style: TextStyle(fontWeight: FontWeight.bold)), Text('Rs ${dresses[i]['p']}'), ElevatedButton(onPressed: ()=> ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${dresses[i]['n']} Ordered'))), child: Text('Buy'))]))),
    );
  }
}

// JOBS
class JobsPage extends StatelessWidget {
  final jobs = [
    {'t':'Flutter Developer','c':'TCS','l':'Chennai','s':'6 LPA'},
    {'t':'UI Designer','c':'Zoho','l':'Tenkasi','s':'4.5 LPA'},
    {'t':'Backend Dev','c':'Infosys','l':'Bangalore','s':'8 LPA'},
  ];
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Jobs'), backgroundColor: Colors.green),
      body: ListView.builder(padding: EdgeInsets.all(12), itemCount: jobs.length, itemBuilder: (c,i)=> Card(child: ListTile(title: Text(jobs[i]['t'] as String, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('${jobs[i]['c']} - ${jobs[i]['l']} \n${jobs[i]['s']}'), trailing: ElevatedButton(child: Text('Apply'), onPressed: ()=> ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('Applied to ${jobs[i]['t']}'))))))),
    );
  }
}

// MOVIES
class MoviesPage extends StatelessWidget {
  final movies = [
    {'n':'Leo 2','r':'4.8'},
    {'n':'Vikram 2','r':'4.9'},
    {'n':'Arjun Story','r':'5.0'},
  ];
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Movies'), backgroundColor: Colors.purple),
      body: ListView.builder(padding: EdgeInsets.all(12), itemCount: movies.length, itemBuilder: (c,i)=> Card(child: ListTile(leading: Icon(Icons.movie, size: 40), title: Text(movies[i]['n'] as String, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('Rating ${movies[i]['r']}'), trailing: ElevatedButton(child: Text('Book'), onPressed: ()=> ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('${movies[i]['n']} Booked'))))))),
    );
  }
}

// TRAVEL
class TravelPage extends StatefulWidget { @override State<TravelPage> createState() => _TravelPageState(); }
class _TravelPageState extends State<TravelPage>{
  String from='Tenkasi', to='Chennai';
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Travel'), backgroundColor: Colors.teal),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField(value: from, items: ['Tenkasi','Madurai','Chennai','Bangalore'].map((e)=> DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v)=> setState(()=> from=v as String), decoration: InputDecoration(labelText: 'From', border: OutlineInputBorder())),
            SizedBox(height: 12),
            DropdownButtonFormField(value: to, items: ['Chennai','Bangalore','Coimbatore','Tenkasi'].map((e)=> DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v)=> setState(()=> to=v as String), decoration: InputDecoration(labelText: 'To', border: OutlineInputBorder())),
            SizedBox(height: 20),
            SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, padding: EdgeInsets.all(16)), onPressed: ()=> ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bus $from to $to - 5 buses found'))), child: Text('Search Buses'))),
            SizedBox(height: 20),
            Card(child: ListTile(leading: Icon(Icons.directions_bus), title: Text('$from to $to Express'), subtitle: Text('9 PM - 6 AM | Rs 550'), trailing: ElevatedButton(child: Text('Book'), onPressed: ()=> ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ticket Booked')))))),
          ],
        ),
      ),
    );
  }
}

// NOTIF
class NotifPage extends StatelessWidget {
  final notifs = [
    {'t':'Order Success','m':'Your Biryani is on the way'},
    {'t':'Job Alert','m':'New Flutter job at Zoho'},
    {'t':'Welcome','m':'Welcome to Arjun Mastermind v2.0'},
  ];
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Notifications'), backgroundColor: Colors.amber),
      body: ListView.builder(padding: EdgeInsets.all(12), itemCount: notifs.length, itemBuilder: (c,i)=> Card(child: ListTile(leading: CircleAvatar(child: Icon(Icons.notifications)), title: Text(notifs[i]['t'] as String, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(notifs[i]['m'] as String))))),
    );
  }
}

// SPECIAL
class SpecialPage extends StatelessWidget {
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Arjun Special'), backgroundColor: Colors.deepPurple),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.stars, size: 80, color: Colors.deepPurple),
            Text('NAGARJUN MASTERMIND', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Creator of Arjun Mastermind'),
            SizedBox(height: 30),
            Text('19 Builds | 8 Modules | 100% Mass', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Ne oru Real App Developer da!'),
          ],
        ),
      ),
    );
  }
}
