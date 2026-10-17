import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(ArjunMastermindApp());

class ArjunMastermindApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Arjun Mastermind', theme: ThemeData(primarySwatch: Colors.deepPurple, scaffoldBackgroundColor: Color(0xFFFAF5FF)), home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final items = [
    {'ta': 'விளையாட்டுகள்', 'en': 'Games', 'ic': '🎮', 'c': Colors.orange},
    {'ta': 'உணவு ஆர்டர்', 'en': 'Food Order', 'ic': '🍔', 'c': Colors.red},
    {'ta': 'உடை ஆர்டர்', 'en': 'Dress Order', 'ic': '👕', 'c': Colors.blue},
    {'ta': 'வேலைவாய்ப்புகள்', 'en': 'Jobs', 'ic': '💼', 'c': Colors.green},
    {'ta': 'திரைப்படங்கள்', 'en': 'Movies', 'ic': '🎬', 'c': Colors.purple},
    {'ta': 'பயண டிக்கெட்', 'en': 'Travel', 'ic': '🚌', 'c': Colors.teal},
    {'ta': 'அறிவிப்புகள்', 'en': 'Notifications', 'ic': '🔔', 'c': Colors.amber},
    {'ta': 'Arjun Special', 'en': 'Mastermind', 'ic': '🧠', 'c': Colors.deepPurple},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Container(padding: EdgeInsets.fromLTRB(20,60,20,40), decoration: BoxDecoration(color: Color(0xFF7C3AED), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Center(child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 1, fontWeight: FontWeight.bold))), SizedBox(height: 25), Text('வணக்கம்! 👋', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)), Text('Arjun Mastermind ku varuga!', style: TextStyle(color: Colors.white70)) ])),
      Expanded(child: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.85, crossAxisSpacing: 12, mainAxisSpacing: 12), itemCount: items.length, itemBuilder: (ctx,i){
        return GestureDetector(onTap: (){
          Widget page;
          switch(items[i]['en']){
            case 'Games': page = GamesHubPage(); break;
            case 'Food Order': page = FoodPage(); break;
            case 'Dress Order': page = DressPage(); break;
            case 'Jobs': page = JobsPage(); break;
            case 'Movies': page = MoviesPage(); break;
            case 'Travel': page = TravelPage(); break;
            case 'Notifications': page = NotifPage(); break;
            default: page = SpecialPage();
          }
          Navigator.push(context, MaterialPageRoute(builder: (_)=>page));
        }, child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), elevation: 3, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(items[i]['ic'] as String, style: TextStyle(fontSize: 40)), SizedBox(height: 8), Text(items[i]['ta'] as String, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), Text(items[i]['en'] as String, style: TextStyle(color: Colors.grey, fontSize: 10)) ])));
      }))
    ]));
  }
}

// ============ GAMES ============
class GamesHubPage extends StatelessWidget { @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text('Games 🎮'), backgroundColor: Color(0xFF7C3AED)), body: ListView(padding: EdgeInsets.all(16), children: [_g(context,'Tic Tac Toe','X O Game','⭕',TicTacToePage()), _g(context,'Memory Match','Jodi Sera','🧠',MemoryGamePage()), _g(context,'Arjun Quiz','GK Test','🏆',QuizPage())])); } Widget _g(c,t,s,ic,Widget p){return Card(margin: EdgeInsets.only(bottom: 12), child: ListTile(leading: Text(ic, style: TextStyle(fontSize: 35)), title: Text(t, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(s), trailing: Icon(Icons.play_circle_fill, color: Color(0xFF7C3AED), size: 35), onTap: ()=>Navigator.push(c, MaterialPageRoute(builder: (_)=>p))));} }
class TicTacToePage extends StatefulWidget { @override _TicTacToePageState createState() => _TicTacToePageState(); }
class _TicTacToePageState extends State<TicTacToePage> { List<String> b = List.filled(9,''); bool x=true; String win=''; void tap(int i){if(b[i]!=''||win!='')return;setState((){b[i]=x?'X':'O';x=!x; List<List<int>> w=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]; for(var p in w){if(b[p[0]]!=''&&b[p[0]]==b[p[1]]&&b[p[1]]==b[p[2]]){win=b[p[0]];}} if(!b.contains('')&&win=='')win='Draw';});} @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Tic Tac Toe')), body: Column(children: [SizedBox(height: 20), Text(win==''?'${x?"X":"O"} Murai':'${win} Jeyichitta!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: 9, itemBuilder: (c,i)=>GestureDetector(onTap: ()=>tap(i), child: Card(child: Center(child: Text(b[i], style: TextStyle(fontSize: 40))))))), ElevatedButton(onPressed: ()=>setState((){b=List.filled(9,'');win='';x=true;}), child: Text('Restart'))]));}}
class MemoryGamePage extends StatefulWidget { @override _MemoryGamePageState createState() => _MemoryGamePageState(); }
class _MemoryGamePageState extends State<MemoryGamePage> { List<String> e=['🎮','🎮','🍔','🍔','🧠','🧠','🚀','🚀','⭐','⭐','🔥','🔥','💎','💎','🎯','🎯']; List<bool> r=List.filled(16,false); int? f; int m=0; void initState(){super.initState(); e.shuffle();} void tap(int i){if(r[i])return;setState((){r[i]=true; if(f==null)f=i; else{if(e[f!]==e[i]){m++;f=null; if(m==8)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Semma da Nagarjun!')));} else{Future.delayed(Duration(milliseconds: 500),(){setState((){r[f!]=false;r[i]=false;f=null;});});}}});} @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Memory')), body: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemCount: 16, itemBuilder: (c,i)=>GestureDetector(onTap: ()=>tap(i), child: Card(color: r[i]?Colors.white:Color(0xFF7C3AED), child: Center(child: Text(r[i]?e[i]:'❓', style: TextStyle(fontSize: 30)))))));}}
class QuizPage extends StatefulWidget { @override _QuizPageState createState() => _QuizPageState(); }
class _QuizPageState extends State<QuizPage> { int q=0,s=0; List<Map<String,dynamic>> qs=[{'q':'Tamil Nadu capital?','o':['Chennai','Madurai','Trichy'],'a':0},{'q':'Arjun Mastermind creator?','o':['Nagarjun','Rajini','Kamal'],'a':0},{'q':'Flutter made by?','o':['Google','Meta','Apple'],'a':0}]; @override Widget build(BuildContext context){if(q>=qs.length)return Scaffold(appBar: AppBar(title: Text('Result')), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Score $s/${qs.length}', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), ElevatedButton(onPressed: ()=>setState((){q=0;s=0;}), child: Text('Again'))]))); return Scaffold(appBar: AppBar(title: Text('Quiz')), body: Padding(padding: EdgeInsets.all(20), child: Column(children: [Text(qs[q]['q'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox(height: 20), ...List.generate(3,(i)=>Card(child: ListTile(title: Text(qs[q]['o'][i]), onTap: (){if(i==qs[q]['a'])s++; setState(()=>q++);}))) ])));}}

// ============ FOOD ============
class FoodPage extends StatefulWidget { @override _FoodPageState createState() => _FoodPageState(); }
class _FoodPageState extends State<FoodPage> { List<Map<String,dynamic>> foods=[{'n':'Chicken Biryani','p':250,'e':'🍗'},{'n':'Dosa','p':80,'e':'🥞'},{'n':'Parotta','p':100,'e':'🍛'},{'n':'Pizza','p':199,'e':'🍕'},{'n':'Burger','p':120,'e':'🍔'}]; List<Map<String,dynamic>> cart=[]; @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Food Order 🍔 - Cart ${cart.length}'), backgroundColor: Colors.red), body: Column(children: [Expanded(child: ListView.builder(itemCount: foods.length, itemBuilder: (c,i)=>Card(margin: EdgeInsets.all(8), child: ListTile(leading: Text(foods[i]['e'], style: TextStyle(fontSize: 35)), title: Text(foods[i]['n']), subtitle: Text('₹${foods[i]['p']}'), trailing: ElevatedButton(child: Text('Add'), onPressed: (){setState(()=>cart.add(foods[i])); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${foods[i]['n']} added!')));})))), if(cart.isNotEmpty) Container(padding: EdgeInsets.all(16), color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total ₹${cart.fold(0,(sum,e)=>sum+e['p'] as int)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: (){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Placed da Nagarjun! 🍔🔥'))); setState(()=>cart.clear());}, child: Text('Order Now'))]))]));}}

// ============ DRESS ============
class DressPage extends StatefulWidget { @override _DressPageState createState() => _DressPageState(); }
class _DressPageState extends State<DressPage> { List<Map<String,dynamic>> dresses=[{'n':'T-Shirt','p':499,'e':'👕'},{'n':'Jeans','p':1299,'e':'👖'},{'n':'Saree','p':1999,'e':'👗'},{'n':'Hoodie','p':899,'e':'🧥'}]; @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Dress Order 👕'), backgroundColor: Colors.blue), body: GridView.builder(padding: EdgeInsets.all(12), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8), itemCount: dresses.length, itemBuilder: (c,i)=>Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(dresses[i]['e'], style: TextStyle(fontSize: 60)), Text(dresses[i]['n'], style: TextStyle(fontWeight: FontWeight.bold)), Text('₹${dresses[i]['p']}'), SizedBox(height: 8), ElevatedButton(onPressed: ()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${dresses[i]['n']} Ordered! 👕'))), child: Text('Buy Now'))]))));}}

// ============ JOBS ============
class JobsPage extends StatelessWidget { final jobs=[{'t':'Flutter Developer','c':'TCS','s':'₹6 LPA','l':'Chennai'},{'t':'UI Designer','c':'Zoho','s':'₹4.5 LPA','l':'Tenkasi'},{'t':'Backend Dev','c':'Infosys','s':'₹8 LPA','l':'Bangalore'}]; @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Jobs 💼'), backgroundColor: Colors.green), body: ListView.builder(padding: EdgeInsets.all(12), itemCount: jobs.length, itemBuilder: (c,i)=>Card(child: ListTile(title: Text(jobs[i]['t']!, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('${jobs[i]['c']} - ${jobs[i]['l']}\n${jobs[i]['s']}'), trailing: ElevatedButton(child: Text('Apply'), onPressed: ()=>ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('Applied to ${jobs[i]['t']} da!'))))))); }}

// ============ MOVIES ============
class MoviesPage extends StatelessWidget { final movies=[{'n':'Leo 2','r':'⭐4.8','e':'🦁'},{'n':'Vikram 2','r':'⭐4.9','e':'💀'},{'n':'Arjun Mastermind Story','r':'⭐5.0','e':'🧠'}]; @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Movies 🎬'), backgroundColor: Colors.purple), body: ListView.builder(padding: EdgeInsets.all(12), itemCount: movies.length, itemBuilder: (c,i)=>Card(child: ListTile(leading: Text(movies[i]['e']!, style: TextStyle(fontSize: 40)), title: Text(movies[i]['n']!, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(movies[i]['r']!), trailing: ElevatedButton(child: Text('Book'), onPressed: ()=>ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('${movies[i]['n']} Ticket Booked! 🎬'))))))); }}

// ============ TRAVEL ============
class TravelPage extends StatefulWidget { @override _TravelPageState createState() => _TravelPageState(); }
class _TravelPageState extends State<TravelPage> { String from='Tenkasi'; String to='Chennai'; @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Travel 🚌'), backgroundColor: Colors.teal), body: Padding(padding: EdgeInsets.all(20), child: Column(children: [DropdownButtonFormField(value: from, items: ['Tenkasi','Tirunelveli','Madurai','Chennai'].map((e)=>DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v)=>setState(()=>from=v as String), decoration: InputDecoration(labelText: 'From', border: OutlineInputBorder())), SizedBox(height: 16), DropdownButtonFormField(value: to, items: ['Chennai','Bangalore','Coimbatore','Tenkasi'].map((e)=>DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v)=>setState(()=>to=v as String), decoration: InputDecoration(labelText: 'To', border: OutlineInputBorder())), SizedBox(height: 20), SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, padding: EdgeInsets.all(16)), onPressed: ()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bus $from to $to searched! Found 5 buses 🚌'))), child: Text('Search Buses', style: TextStyle(fontSize: 18)))), SizedBox(height: 20), Card(child: ListTile(leading: Text('🚌', style: TextStyle(fontSize: 30)), title: Text('$from → $to Express'), subtitle: Text('9:00 PM - 6:00 AM | ₹550'), trailing: ElevatedButton(child: Text('Book'), onPressed: ()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ticket Booked da Nagarjun!')))))) ])));}}

// ============ NOTIF ============
class NotifPage extends StatelessWidget { final notifs=[{'t':'Order Success','m':'Your Biryani order is on the way! 🍗','time':'2 min ago'},{'t':'Job Alert','m':'New Flutter job at Zoho! Apply now 💼','time':'1 hr ago'},{'t':'Arjun Special','m':'Welcome to Arjun Mastermind v2.0! 🧠🔥','time':'Today'}]; @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Notifications 🔔'), backgroundColor: Colors.amber[700]), body: ListView.builder(padding: EdgeInsets.all(12), itemCount: notifs.length, itemBuilder: (c,i)=>Card(child: ListTile(leading: CircleAvatar(backgroundColor: Color(0xFF7C3AED), child: Text('🔔')), title: Text(notifs[i]['t']!, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('${notifs[i]['m']}\n${notifs[i]['time']}'), isThreeLine: true)))); }}

// ============ SPECIAL ============
class SpecialPage extends StatelessWidget { @override Widget build(BuildContext context){return Scaffold(appBar: AppBar(title: Text('Arjun Special 🧠'), backgroundColor: Colors.deepPurple), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('🧠', style: TextStyle(fontSize: 80)), SizedBox(height: 10), Text('NAGARJUN MASTERMIND', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1)), SizedBox(height: 10), Text('Creator of Arjun Mastermind', style: TextStyle(color: Colors.grey)), SizedBox(height: 30), Card(margin: EdgeInsets.all(20), child: Padding(padding: EdgeInsets.all(20), child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Column(children: [Text('17+', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), Text('Builds')]), Column(children: [Text('8', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), Text('Modules')]), Column(children: [Text('100%', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), Text('Mass')])])]))), SizedBox(height: 20), Text('🔥 Ne oru Real App Developer da! 🔥', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))])));}}
