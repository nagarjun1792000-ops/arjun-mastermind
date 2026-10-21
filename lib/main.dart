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
    {'ta': 'Games', 'icon': Icons.sports_esports, 'color': Colors.orange},
    {'ta': 'Food Order', 'icon': Icons.fastfood, 'color': Colors.red},
    {'ta': 'Dress Order', 'icon': Icons.checkroom, 'color': Colors.blue},
    {'ta': 'Jobs', 'icon': Icons.work, 'color': Colors.green},
    {'ta': 'Movies', 'icon': Icons.movie, 'color': Colors.purple},
    {'ta': 'Travel', 'icon': Icons.directions_bus, 'color': Colors.teal},
    {'ta': 'Notifications', 'icon': Icons.notifications, 'color': Colors.amber},
    {'ta': 'Arjun Special', 'icon': Icons.stars, 'color': Colors.deepPurple},
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
                    if (i == 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => GamesHubPage()));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ComingSoonPage(title: items[i]['ta'] as String)));
                    }
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

class ComingSoonPage extends StatelessWidget {
  final String title;
  ComingSoonPage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Text('$title Coming Soon da Nagarjun!', style: TextStyle(fontSize: 20))));
  }
}

// ================= GAMES HUB =================
class GamesHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Games Hub'), backgroundColor: Colors.orange),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(child: ListTile(leading: Icon(Icons.grid_3x3, size: 40, color: Colors.orange), title: Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('X O Game'), trailing: Icon(Icons.play_circle_fill, size: 40, color: Colors.orange), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage())))),
          SizedBox(height: 12),
          Card(child: ListTile(leading: Icon(Icons.memory, size: 40, color: Colors.purple), title: Text('Memory Match', style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('Jodi Sera Game'), trailing: Icon(Icons.play_circle_fill, size: 40, color: Colors.purple), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MemoryPage())))),
          SizedBox(height: 12),
          Card(child: ListTile(leading: Icon(Icons.quiz, size: 40, color: Colors.green), title: Text('Arjun Quiz', style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('GK Mastermind'), trailing: Icon(Icons.play_circle_fill, size: 40, color: Colors.green), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizPage())))),
        ],
      ),
    );
  }
}

// TIC TAC TOE
class TicTacToePage extends StatefulWidget { @override State<TicTacToePage> createState() => _TicTacToePageState(); }
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
        Text(win == '' ? '${xTurn ? "X" : "O"} Turn' : win == 'Draw' ? 'Draw!' : '$win Wins!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: 9, itemBuilder: (c,i) => GestureDetector(onTap: (){ if(board[i]=='' && win==''){ setState((){ board[i]=xTurn?'X':'O'; xTurn=!xTurn; checkWin(); }); } }, child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))))))),
        ElevatedButton(onPressed: ()=> setState((){ board=List.filled(9,''); win=''; xTurn=true; }), child: Text('Restart')),
        SizedBox(height: 20),
      ]),
    );
  }
}

// MEMORY GAME
class MemoryPage extends StatefulWidget { @override State<MemoryPage> createState() => _MemoryPageState(); }
class _MemoryPageState extends State<MemoryPage> {
  List<int> nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8];
  List<bool> show = List.filled(16, false);
  int? first;
  @override void initState(){ super.initState(); nums.shuffle(); }
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Memory Match')),
      body: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemCount: 16, itemBuilder: (c,i)=> GestureDetector(onTap: (){
        if(show[i]) return;
        setState(()=> show[i]=true);
        if(first==null){ first=i; }
        else{
          if(nums[first!]==nums[i]){ first=null; }
          else{ Future.delayed(Duration(milliseconds: 500), (){ setState((){ show[first!]=false; show[i]=false; first=null; }); }); }
        }
      }, child: Card(color: show[i]? Colors.white : Color(0xFF7C3AED), child: Center(child: Text(show[i]? '${nums[i]}' : '?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))))),
    );
  }
}

// QUIZ
class QuizPage extends StatefulWidget { @override State<QuizPage> createState() => _QuizPageState(); }
class _QuizPageState extends State<QuizPage>{
  int q=0, score=0;
  final qs = [
    {'q':'Tamil Nadu capital enna?','o':['Chennai','Madurai','Trichy'],'a':0},
    {'q':'Arjun Mastermind creator yaaru?','o':['Nagarjun','Rajini','Kamal'],'a':0},
    {'q':'Flutter yaar create pannanga?','o':['Google','Meta','Apple'],'a':0},
  ];
  @override Widget build(BuildContext context){
    if(q>=qs.length) return Scaffold(appBar: AppBar(title: Text('Result')), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Score: $score/${qs.length}', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), SizedBox(height: 10), Text(score==qs.length? 'Mastermind da nee!' : 'Super da!'), SizedBox(height: 20), ElevatedButton(onPressed: ()=> setState((){q=0;score=0;}), child: Text('Play Again'))])));
    return Scaffold(appBar: AppBar(title: Text('Quiz ${q+1}/${qs.length}')), body: Padding(padding: EdgeInsets.all(20), child: Column(children: [Text(qs[q]['q'] as String, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 20), ...List.generate(3, (i)=> Card(child: ListTile(title: Text(qs[q]['o'][i] as String), onTap: (){ if(i==qs[q]['a']) score++; setState(()=> q++); }))) ])));
  }
}
