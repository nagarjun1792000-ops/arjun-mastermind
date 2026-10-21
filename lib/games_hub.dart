import 'package:flutter/material.dart';

class GamesHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Games'), backgroundColor: Color(0xFF7C3AED)),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(child: ListTile(leading: Icon(Icons.grid_3x3, size: 40, color: Colors.orange), title: Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('X O Game'), trailing: Icon(Icons.play_circle_fill, size: 40, color: Color(0xFF7C3AED)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage())))),
          SizedBox(height: 12),
          Card(child: ListTile(leading: Icon(Icons.memory, size: 40, color: Colors.purple), title: Text('Memory Match', style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('Jodi Sera Game'), trailing: Icon(Icons.play_circle_fill, size: 40, color: Color(0xFF7C3AED)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MemoryGamePage())))),
          SizedBox(height: 12),
          Card(child: ListTile(leading: Icon(Icons.quiz, size: 40, color: Colors.green), title: Text('Arjun Quiz', style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('GK Mastermind'), trailing: Icon(Icons.play_circle_fill, size: 40, color: Color(0xFF7C3AED)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizPage())))),
        ],
      ),
    );
  }
}

class TicTacToePage extends StatefulWidget { @override State<TicTacToePage> createState() => _TicTacToePageState(); }
class _TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String winner = '';
  void tapBoard(int i) { if (board[i] != '' || winner != '') return; setState(() { board[i] = xTurn ? 'X' : 'O'; xTurn = !xTurn; checkWin(); }); }
  void checkWin() { List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]; for (var p in w) { if (board[p[0]] != '' && board[p[0]] == board[p[1]] && board[p[1]] == board[p[2]]) { winner = board[p[0]]; return; } } if (!board.contains('')) winner = 'Draw'; }
  @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text('Tic Tac Toe')), body: Column(children: [SizedBox(height: 20), Text(winner == '' ? '${xTurn ? "X" : "O"} Murai' : winner == 'Draw' ? 'Draw da!' : '$winner Jeyichitta!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: 9, itemBuilder: (c,i) => GestureDetector(onTap: ()=> tapBoard(i), child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))))))), ElevatedButton(onPressed: ()=> setState((){board=List.filled(9,''); winner=''; xTurn=true;}), child: Text('Restart')), SizedBox(height: 20)])); }
}

class MemoryGamePage extends StatefulWidget { @override State<MemoryGamePage> createState() => _MemoryGamePageState(); }
class _MemoryGamePageState extends State<MemoryGamePage> {
  List<int> nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8];
  List<bool> revealed = List.filled(16, false);
  int? first;
  @override void initState(){ super.initState(); nums.shuffle(); }
  @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text('Memory Match')), body: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemCount: 16, itemBuilder: (c,i) => GestureDetector(onTap: (){ if(revealed[i]) return; setState(()=> revealed[i]=true); if(first==null){ first=i; } else { if(nums[first!]==nums[i]){ first=null; } else { Future.delayed(Duration(milliseconds: 500), (){ setState((){ revealed[first!]=false; revealed[i]=false; first=null; }); }); } } }, child: Card(color: revealed[i] ? Colors.white : Color(0xFF7C3AED), child: Center(child: Text(revealed[i] ? '${nums[i]}' : '?', style: TextStyle(fontSize: 28))))))); }
}

class QuizPage extends StatefulWidget { @override State<QuizPage> createState() => _QuizPageState(); }
class _QuizPageState extends State<QuizPage> {
  int q = 0; int score = 0;
  List<Map<String,dynamic>> qs = [
    {'q':'Tamil Nadu capital enna?','o':['Chennai','Madurai','Trichy'],'a':0},
    {'q':'Flutter yaar create pannanga?','o':['Google','Facebook','Apple'],'a':0},
    {'q':'Arjun Mastermind creator yaaru?','o':['Nagarjun','Rajini','Kamal'],'a':0},
  ];
  @override Widget build(BuildContext context) { if (q >= qs.length) return Scaffold(appBar: AppBar(title: Text('Result')), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Score: $score / ${qs.length}', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), SizedBox(height: 20), ElevatedButton(onPressed: ()=>setState((){q=0;score=0;}), child: Text('Again Play'))]))); return Scaffold(appBar: AppBar(title: Text('Quiz ${q+1}/${qs.length}')), body: Padding(padding: EdgeInsets.all(20), child: Column(children: [Text(qs[q]['q'] as String, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 30), ...List.generate(3, (i) => Card(child: ListTile(title: Text(qs[q]['o'][i] as String), onTap: () { if (i == qs[q]['a']) score++; setState(()=>q++); }))) ]))); }
}
