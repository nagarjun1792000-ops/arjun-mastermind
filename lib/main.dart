import 'package:flutter/material.dart';

void main() => runApp(ArjunApp());
class ArjunApp extends StatelessWidget {
  @override Widget build(BuildContext context) { return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()); }
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
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFAF5FF), body: Column(children: [
      Container(padding: EdgeInsets.fromLTRB(20, 60, 20, 40), decoration: BoxDecoration(color: Color(0xFF7C3AED), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Center(child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))), SizedBox(height: 20), Text('Vanakkam Nagarjun!', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),])),
      Expanded(child: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9), itemCount: items.length, itemBuilder: (ctx, i) => GestureDetector(onTap: () { 
        if (i == 0) Navigator.push(context, MaterialPageRoute(builder: (_) => GamesHubPage())); 
        else if (i == 1) Navigator.push(context, MaterialPageRoute(builder: (_) => FoodHubPage())); 
        else if (i == 4) Navigator.push(context, MaterialPageRoute(builder: (_) => MovieHubPage())); 
        else Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(title: items[i]['ta'] as String))); 
      }, child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(items[i]['icon'] as IconData, size: 40, color: Color(0xFF7C3AED)), SizedBox(height: 8), Text(items[i]['ta'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center),])))))
    ]));
  }
}
class DetailPage extends StatelessWidget { final String title; DetailPage({required this.title}); @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text(title), backgroundColor: Color(0xFF7C3AED)), body: Center(child: Text('$title Coming Soon da!'))); } }
class GamesHubPage extends StatelessWidget { @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text('Games Hub'), backgroundColor: Colors.orange), body: ListView(padding: EdgeInsets.all(16), children: [Card(child: ListTile(leading: Icon(Icons.grid_3x3, size: 40, color: Colors.orange), title: Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage())))), Card(child: ListTile(leading: Icon(Icons.memory, size: 40, color: Colors.purple), title: Text('Memory Match', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MemoryPage())))), Card(child: ListTile(leading: Icon(Icons.quiz, size: 40, color: Colors.green), title: Text('Arjun Quiz', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizPage())))),])); } }
class TicTacToePage extends StatefulWidget { @override State<TicTacToePage> createState() => _TicTacToePageState(); }
class _TicTacToePageState extends State<TicTacToePage> { List<String> board = List.filled(9, ''); bool xTurn = true; String win = ''; void check(){ List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]; for(var p in w){ if(board[p[0]]!='' && board[p[0]]==board[p[1]] && board[p[1]]==board[p[2]]){ win=board[p[0]]; return; } } if(!board.contains('')) win='Draw'; } @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text('Tic Tac Toe')), body: Column(children: [SizedBox(height:20), Text(win==''? '${xTurn?"X":"O"} Turn' : '$win Wins', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold)), Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3), itemCount:9, itemBuilder: (c,i)=> GestureDetector(onTap: (){ if(board[i]=='' && win==''){ setState((){ board[i]=xTurn?'X':'O'; xTurn=!xTurn; check(); }); } }, child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize:40))))))), ElevatedButton(onPressed: ()=> setState((){ board=List.filled(9,''); win=''; xTurn=true; }), child: Text('Restart')), SizedBox(height:20)])); } }
class MemoryPage extends StatefulWidget { @override State<MemoryPage> createState() => _MemoryPageState(); }
class _MemoryPageState extends State<MemoryPage> { List<int> nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]; List<bool> show = List.filled(16, false); int? first; @override void initState(){ super.initState(); nums.shuffle(); } @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title
