import 'package:flutter/material.dart';

void main() => runApp(ArjunApp());

class ArjunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
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
            decoration: BoxDecoration(color: Color(0xFF7C3AED), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 20),
              Text('Vanakkam Nagarjun!', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            ]),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9),
              itemCount: items.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    if (i == 0) Navigator.push(context, MaterialPageRoute(builder: (_) => GamesHubPage()));
                    else if (i == 1) Navigator.push(context, MaterialPageRoute(builder: (_) => FoodHubPage()));
                    else Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(title: items[i]['ta'] as String)));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(items[i]['icon'] as IconData, size: 40, color: Color(0xFF7C3AED)),
                      SizedBox(height: 8),
                      Text(items[i]['ta'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center),
                    ]),
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
  DetailPage({required this.title});
  @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text(title), backgroundColor: Color(0xFF7C3AED)), body: Center(child: Text('$title Coming Soon da!'))); }
}

// ================= GAMES HUB (OLD) =================
class GamesHubPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Games Hub'), backgroundColor: Colors.orange),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(child: ListTile(leading: Icon(Icons.grid_3x3, size: 40, color: Colors.orange), title: Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage())))),
          Card(child: ListTile(leading: Icon(Icons.memory, size: 40, color: Colors.purple), title: Text('Memory Match', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MemoryPage())))),
          Card(child: ListTile(leading: Icon(Icons.quiz, size: 40, color: Colors.green), title: Text('Arjun Quiz', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizPage())))),
        ],
      ),
    );
  }
}
class TicTacToePage extends StatefulWidget { @override State<TicTacToePage> createState() => _TicTacToePageState(); }
class _TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, ''); bool xTurn = true; String win = '';
  void check(){ List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]; for(var p in w){ if(board[p[0]]!='' && board[p[0]]==board[p[1]] && board[p[1]]==board[p[2]]){ win=board[p[0]]; return; } } if(!board.contains('')) win='Draw'; }
  @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text('Tic Tac Toe')), body: Column(children: [SizedBox(height:20), Text(win==''? '${xTurn?"X":"O"} Turn' : '$win Wins', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold)), Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3), itemCount:9, itemBuilder: (c,i)=> GestureDetector(onTap: (){ if(board[i]=='' && win==''){ setState((){ board[i]=xTurn?'X':'O'; xTurn=!xTurn; check(); }); } }, child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize:40))))))), ElevatedButton(onPressed: ()=> setState((){ board=List.filled(9,''); win=''; xTurn=true; }), child: Text('Restart')), SizedBox(height:20)])); }
}
class MemoryPage extends StatefulWidget { @override State<MemoryPage> createState() => _MemoryPageState(); }
class _MemoryPageState extends State<MemoryPage> {
  List<int> nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]; List<bool> show = List.filled(16, false); int? first;
  @override void initState(){ super.initState(); nums.shuffle(); }
  @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text('Memory')), body: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4), itemCount:16, itemBuilder: (c,i)=> GestureDetector(onTap: (){ if(show[i]) return; setState(()=> show[i]=true); if(first==null){ first=i; } else { if(nums[first!]==nums[i]){ first=null; } else { Future.delayed(Duration(milliseconds:500), (){ setState((){ show[first!]=false; show[i]=false; first=null; }); }); } } }, child: Card(color: show[i]? Colors.white : Color(0xFF7C3AED), child: Center(child: Text(show[i]? '${nums[i]}' : '?', style: TextStyle(fontSize:24))))))); }
}
class QuizPage extends StatefulWidget { @override State<QuizPage> createState() => _QuizPageState(); }
class _QuizPageState extends State<QuizPage> {
  int q=0, score=0; List<Map<String,dynamic>> list = [{'q':'Tamil Nadu capital enna?','o':['Chennai','Madurai','Trichy'],'a':0},{'q':'Arjun creator yaaru?','o':['Nagarjun','Rajini','Kamal'],'a':0},{'q':'Flutter by?','o':['Google','Meta','Apple'],'a':0}];
  @override Widget build(BuildContext context){ if(q>=list.length) return Scaffold(appBar: AppBar(title: Text('Result')), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Score $score/${list.length}', style: TextStyle(fontSize:28, fontWeight: FontWeight.bold)), ElevatedButton(onPressed: ()=> setState((){q=0;score=0;}), child: Text('Again'))]))); return Scaffold(appBar: AppBar(title: Text('Quiz ${q+1}/${list.length}')), body: Padding(padding: EdgeInsets.all(20), child: Column(children: [Text(list[q]['q'] as String, style: TextStyle(fontSize:22, fontWeight: FontWeight.bold)), SizedBox(height:20), ...List.generate(3, (i)=> Card(child: ListTile(title: Text(list[q]['o'][i] as String), onTap: (){ if(i==list[q]['a']) score++; setState(()=> q++); }))) ]))); }
}

// ================= FOOD ORDER - NEW =================
class FoodHubPage extends StatefulWidget { @override State<FoodHubPage> createState() => _FoodHubPageState(); }
class _FoodHubPageState extends State<FoodHubPage> {
  List<Map<String,dynamic>> foods = [
    {'name':'Chicken Biryani','price':250,'icon':Icons.rice_bowl,'color':Colors.orange},
    {'name':'Mutton Biryani','price':350,'icon':Icons.rice_bowl,'color':Colors.red},
    {'name':'Fried Rice','price':180,'icon':Icons.ramen_dining,'color':Colors.green},
    {'name':'Parotta Set','price':120,'icon':Icons.bakery_dining,'color':Colors.brown},
    {'name':'Dosa','price':80,'icon':Icons.lunch_dining,'color':Colors.amber},
    {'name':'Pizza','price':299,'icon':Icons.local_pizza,'color':Colors.deepOrange},
  ];
  List<Map<String,dynamic>> cart = [];
  int get total => cart.fold(0, (s,e)=> s + (e['price'] as int));
  
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Food Order'), backgroundColor: Colors.red, actions: [Stack(children: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: ()=> _showCart()), if(cart.isNotEmpty) Positioned(right:6, top:6, child: CircleAvatar(radius:8, backgroundColor: Colors.yellow, child: Text('${cart.length}', style: TextStyle(fontSize:10, color: Colors.black))))])]),
      body: Column(children: [
        Container(padding: EdgeInsets.all(12), color: Colors.red.shade50, child: Row(children: [Icon(Icons.location_on, color: Colors.red), SizedBox(width:6), Text('Deliver to: Chennai, TN', style: TextStyle(fontWeight: FontWeight.bold))])),
        Expanded(child: ListView.builder(padding: EdgeInsets.all(12), itemCount: foods.length, itemBuilder: (c,i){ return Card(margin: EdgeInsets.only(bottom:12), child: ListTile(leading: CircleAvatar(backgroundColor: (foods[i]['color'] as Color).withOpacity(0.2), child: Icon(foods[i]['icon'] as IconData, color: foods[i]['color'] as Color)), title: Text(foods[i]['name'], style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('Rs. ${foods[i]['price']} - 30 mins delivery'), trailing: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: (){ setState(()=> cart.add(foods[i])); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${foods[i]['name']} added to cart'))); }, child: Text('ADD')))); })),
        if(cart.isNotEmpty) Container(padding: EdgeInsets.all(16), color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total: Rs. $total  (${cart.length} items)', style: TextStyle(fontWeight: FontWeight.bold, fontSize:16)), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: ()=> _showCart(), child: Text('Order Now'))])),
      ]),
    );
  }
  void _showCart(){
    showModalBottomSheet(context: context, builder: (_)=> Container(padding: EdgeInsets.all(16), child: Column(mainAxisSize: MainAxisSize.min, children: [Text('Your Cart', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)), SizedBox(height:10), ...cart.map((f)=> ListTile(title: Text(f['name']), trailing: Text('Rs.${f['price']}'))).toList(), Divider(), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize:18)), Text('Rs. $total', style: TextStyle(fontWeight: FontWeight.bold, fontSize:18))]), SizedBox(height:10), SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: EdgeInsets.all(14)), onPressed: (){ Navigator.pop(context); setState(()=> cart=[]); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Placed da Nagarjun! 30 mins la varum!'), backgroundColor: Colors.green)); }, child: Text('CONFIRM ORDER - Rs. $total')))])));
  }
}
