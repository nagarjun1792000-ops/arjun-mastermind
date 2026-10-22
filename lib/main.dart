import 'package:flutter/material.dart';

void main() { runApp(ArjunApp()); }

class ArjunApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF5FF),
      body: Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 60, 20, 40),
          decoration: BoxDecoration(color: Color(0xFF7C3AED), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
          child: Center(child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
        ),
        Expanded(child: GridView.count(crossAxisCount: 3, padding: EdgeInsets.all(16), children: [
          card(context, 'Games', Icons.sports_esports, GamesHubPage()),
          card(context, 'Food', Icons.fastfood, FoodHubPage()),
          card(context, 'Movies', Icons.movie, MovieNowShowingPage()),
          card(context, 'Jobs', Icons.work, JobsHubPage()),
          card(context, 'Travel', Icons.directions_bus, TravelHubPage()),
          card(context, 'Dress', Icons.checkroom, DressHubPage()),
        ])),
      ]),
    );
  }
  Widget card(BuildContext ctx, String t, IconData ic, Widget p) {
    return GestureDetector(
      onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => p)),
      child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(ic, size: 40, color: Color(0xFF7C3AED)), SizedBox(height: 8), Text(t, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))])),
    );
  }
}

// ============== GAMES - WORKING ==============
class GamesHubPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Games Hub'), backgroundColor: Colors.orange),
      body: ListView(padding: EdgeInsets.all(16), children: [
        gameCard(context, 'Tic Tac Toe', Icons.grid_3x3, Colors.orange, TicTacToePage()),
        gameCard(context, 'Snake Game', Icons.gamepad, Colors.green, SnakeInfoPage()),
        gameCard(context, 'Memory Match', Icons.memory, Colors.purple, MemoryInfoPage()),
      ]),
    );
  }
  Widget gameCard(BuildContext ctx, String t, IconData ic, Color c, Widget p) {
    return Card(child: ListTile(leading: Icon(ic, size: 40, color: c), title: Text(t, style: TextStyle(fontWeight: FontWeight.bold)), trailing: Icon(Icons.arrow_forward), onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => p))));
  }
}
class TicTacToePage extends StatefulWidget { @override State<TicTacToePage> createState() => _TicTacToePageState(); }
class _TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, ''); bool xTurn = true; String win = '';
  void checkWin() {
    List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    for (var p in w) { if (board[p[0]] != '' && board[p[0]] == board[p[1]] && board[p[1]] == board[p[2]]) { win = board[p[0]]; return; } }
    if (!board.contains('')) win = 'Draw';
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Tic Tac Toe')), body: Column(children: [SizedBox(height: 20), Text(win == '' ? '${xTurn ? "X" : "O"} Turn' : win == 'Draw' ? 'Draw!' : '$win Wins!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: 9, itemBuilder: (c,i) => GestureDetector(onTap: () { if(board[i]=='' && win==''){ setState((){ board[i]=xTurn?'X':'O'; xTurn=!xTurn; checkWin(); }); } }, child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize: 40))))))), ElevatedButton(onPressed: (){ setState((){ board=List.filled(9,''); win=''; xTurn=true; }); }, child: Text('Restart')), SizedBox(height: 20)]));
  }
}
class SnakeInfoPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Snake')), body: Center(child: Text('Snake Game Coming Soon da! Play Tic Tac Toe for now!'))); }
class MemoryInfoPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Memory')), body: Center(child: Text('Memory Game Coming Soon da!'))); }

// ============== FOOD - WORKING WITH 38 DISTRICTS ==============
class FoodHubPage extends StatefulWidget { @override State<FoodHubPage> createState() => _FoodHubPageState(); }
class _FoodHubPageState extends State<FoodHubPage> {
  String district = 'Chennai'; String platform = 'Swiggy';
  List<String> districts = ['Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode','Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai','Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet','Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli','Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'];
  Map<String, List<Map<String, dynamic>>> data = {
    'Swiggy': [{'name':'Chicken Biryani','price':250,'shop':'SS Hyderabad'},{'name':'Mutton Biryani','price':350,'shop':'Thalappakatti'}],
    'Zomato': [{'name':'Fried Rice','price':220,'shop':'Zomato Kitchen'},{'name':'Noodles','price':180,'shop':'Zomato'}],
    'Zepto': [{'name':'Milk 500ml','price':32,'shop':'Zepto Cafe'}],
    'Blinkit': [{'name':'Milk 1L','price':60,'shop':'Blinkit Mart'}],
    'BigBasket': [{'name':'Tomato 1kg','price':35,'shop':'BigBasket Fresh'}],
  };
  List<Map<String, dynamic>> cart = [];
  int total() { int s=0; for(var e in cart){ s+=e['price'] as int; } return s; }
  @override Widget build(BuildContext context) {
    var foods = data[platform]!;
    return Scaffold(
      appBar: AppBar(title: Text('Food - $platform - $district'), backgroundColor: Colors.orange),
      body: Column(children: [
        Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), color: Colors.grey.shade100, child: Row(children: [Icon(Icons.location_on, color: Colors.red, size: 18), SizedBox(width:6), Expanded(child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: district, isExpanded: true, items: districts.map((d)=>DropdownMenuItem(value:d, child: Text(d, style: TextStyle(fontSize:12)))).toList(), onChanged: (v)=>setState(()=>district=v!))))])),
        Container(height: 50, child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.all(8), children: ['Swiggy','Zomato','Zepto','Blinkit','BigBasket'].map((p)=>Padding(padding: EdgeInsets.only(right:8), child: ChoiceChip(label: Text(p), selected: platform==p, onSelected: (v)=>setState(()=>platform=p)))).toList())),
        Expanded(child: ListView.builder(padding: EdgeInsets.all(10), itemCount: foods.length, itemBuilder: (c,i)=>Card(child: ListTile(title: Text(foods[i]['name']), subtitle: Text('Rs.${foods[i]['price']} - ${foods[i]['shop']}'), trailing: ElevatedButton(onPressed: (){ setState(()=>cart.add({'name':foods[i]['name'],'price':foods[i]['price']})); }, child: Text('ADD')))))),
        if(cart.isNotEmpty) Container(padding: EdgeInsets.all(12), color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total Rs.${total()} - ${cart.length} items'), ElevatedButton(onPressed: (){ setState(()=>cart=[]); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Success in $district!'), backgroundColor: Colors.green)); }, child: Text('Order Now'))])),
      ]),
    );
  }
}

// ============== MOVIES - BOOKMYSHOW STYLE ==============
class MovieNowShowingPage extends StatefulWidget { @override State<MovieNowShowingPage> createState() => MovieNowShowingPageState(); }
class MovieNowShowingPageState extends State<MovieNowShowingPage> {
  String district = 'Coimbatore'; String filter = 'Tamil';
  List<String> districts = ['Ariyalur','Chengalpattu','Chennai','Coimbatore','Madurai','Salem','Trichy','Tirunelveli','Thanjavur','Vellore','Erode','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Viluppuram','Virudhunagar','Chengalpattu','Kanchipuram','Kanyakumari'];
  List<Map<String, dynamic>> movies = [
    {'title':'Jailer 2','sub':'367K+ likes','lang':'Tamil','col':Colors.brown},
    {'title':'Street Fighter','sub':'7.3  3.6K+ votes','lang':'English','col':Colors.red},
    {'title':'Drones','sub':'8.9  1.4K+ votes','lang':'Tamil','col':Colors.orange},
    {'title':'Baththa','sub':'9.2  37.2K+ votes','lang':'Tamil','col':Colors.deepOrange},
    {'title':'Leo 2','sub':'420K+ likes','lang':'Tamil','col':Colors.redAccent},
    {'title':'KGF 3','sub':'9.0  50K+ votes','lang':'Kannada','col':Colors.amber},
  ];
  List<Map<String, dynamic>> get filtered => filter=='All' ? movies : movies.where((m)=>m['lang']==filter).toList();
  Widget chip(String l){bool s=filter==l;return Container(margin: EdgeInsets.only(right:8), child: ChoiceChip(label: Text(l), selected: s, selectedColor: Color(0xFFFFE4E8), onSelected: (v)=>setState(()=>filter=l)));}
  @override Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black), title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Now Showing', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)), Text('$district | ${filtered.length} Movies', style: TextStyle(color: Colors.grey, fontSize: 12))])),
      body: Column(children: [
        Container(padding: EdgeInsets.symmetric(horizontal: 12), child: DropdownButton<String>(value: district, isExpanded: true, items: districts.map((d)=>DropdownMenuItem(value: d, child: Text(d))).toList(), onChanged: (v)=>setState(()=>district=v!))),
        SingleChildScrollView(scrollDirection: Axis.horizontal, padding: EdgeInsets.all(8), child: Row(children: [chip('All'), chip('New Releases'), chip('Tamil'), chip('English'), chip('Hindi')])),
        Expanded(child: GridView.builder(padding: EdgeInsets.all(12), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.62, crossAxisSpacing: 12, mainAxisSpacing: 12), itemCount: filtered.length, itemBuilder: (c,i){var m=filtered[i];return GestureDetector(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SeatPage(movie: m, district: district))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(height: 200, decoration: BoxDecoration(color: m['col'], borderRadius: BorderRadius.circular(12)), child: Center(child: Text(m['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)))), SizedBox(height:6), Text(m['sub'], style: TextStyle(fontSize:11, color: Colors.grey)), Text(m['title'], style: TextStyle(fontWeight: FontWeight.bold))]));})),
      ]),
      floatingActionButton: FloatingActionButton.extended(backgroundColor: Color(0xFFFF2C5A), onPressed: (){}, label: Text('Browse by Cinemas', style: TextStyle(color: Colors.white)), icon: Icon(Icons.location_on, color: Colors.white)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
class SeatPage extends StatefulWidget { final Map<String, dynamic> movie; final String district; SeatPage({required this.movie, required this.district}); @override State<SeatPage> createState() => SeatPageState(); }
class SeatPageState extends State<SeatPage> {
  String time = '09:45 PM'; List<String> sel = []; Set<String> sold = {'A8','A7','B6','B7','C6','C7','H8','H9','I9','J12','K10','N9'}; Set<String> best = {'C16','J8','J9'};
  Widget seat(String k) { bool isSold=sold.contains(k); bool isSel=sel.contains(k); bool isBest=best.contains(k); Color bg, br; if(isSold){bg=Colors.grey.shade300; br=Colors.grey.shade300;} else if(isSel){bg=Color(0xFF16A34A); br=Color(0xFF16A34A);} else if(isBest){bg=Colors.amber.shade100; br=Colors.amber;} else {bg=Colors.white; br=Colors.green;} return GestureDetector(onTap: isSold?null:()=>setState(()=> isSel?sel.remove(k):sel.add(k)), child: Container(width:28, height:24, margin: EdgeInsets.all(2), decoration: BoxDecoration(color:bg, border: Border.all(color:br), borderRadius: BorderRadius.circular(3)), child: Center(child: Text(k.replaceAll(RegExp(r'[A-Z]'), ''), style: TextStyle(fontSize:9, color:isSel?Colors.white:Colors.black))))); }
  Widget rowSeats(String r, List<int> left, List<int> right){ return Row(children: [SizedBox(width:24, child: Text(r, style: TextStyle(fontSize:11, color: Colors.grey))), ...left.map((n)=>seat('$r$n')).toList(), SizedBox(width:20), ...right.map((n)=>seat('$r$n')).toList()]); }
  @override Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black), title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.movie['title'], style: TextStyle(color: Colors.black, fontSize:16, fontWeight: FontWeight.bold)), Text('Jayanthi Cinemas A/C 4K LASER ATMOS: P.N Palayam - ${widget.district}', style: TextStyle(color: Colors.grey, fontSize:10))])),
      body: Column(children: [
        Container(color: Color(0xFFF5F5F5), padding: EdgeInsets.all(10), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Wed, 21 Oct'), Text('2 Tickets', style: TextStyle(color: Color(0xFFFF2C5A)))])),
        Container(padding: EdgeInsets.all(10), child: Row(children: [timeBox('06:15 PM'), SizedBox(width:10), timeBox('09:45 PM')])),
        Expanded(child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: SingleChildScrollView(child: Column(children: [SizedBox(height:10), Row(children: [SizedBox(width:24, child: Text('PA', style: TextStyle(fontSize:11))), seat('PA8'), seat('PA7'), SizedBox(width:20), seat('PA15'), seat('PA14')]), Divider(), ...List.generate(14, (i){String r=String.fromCharCode(65+i); return Padding(padding: EdgeInsets.only(bottom:4), child: rowSeats(r, [6,7], [8,9,10,11,12,13,14,15,16]));}), SizedBox(height:20), Row(mainAxisAlignment: MainAxisAlignment.center, children: [leg(Colors.amber.shade100, 'Bestseller'), SizedBox(width:12), leg(Colors.white, 'Available'), SizedBox(width:12), leg(Colors.green, 'Selected'), SizedBox(width:12), leg(Colors.grey.shade300, 'Sold')])])))),
        if(sel.isNotEmpty) Container(width: double.infinity, padding: EdgeInsets.all(12), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF2C5A), padding: EdgeInsets.all(14)), onPressed: (){ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booked ${sel.join(",")} in ${widget.district}'), backgroundColor: Colors.green)); Navigator.pop(context); }, child: Text('Pay Rs.${sel.length*180} - ${sel.length} Tickets', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
      ]),
    );
  }
  Widget timeBox(String t){bool s=time==t;return Expanded(child: GestureDetector(onTap: ()=>setState(()=>time=t), child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: s?Color(0xFF16A34A):Colors.white, border: Border.all(color: s?Color(0xFF16A34A):Colors.orange, width:2), borderRadius: BorderRadius.circular(6)), child: Column(children: [Text(t, style: TextStyle(fontWeight: FontWeight.bold, color: s?Colors.white:Colors.black)), Text('4K LASER ATMOS', style: TextStyle(fontSize:9, color: s?Colors.white70:Colors.grey))]))));}
  Widget leg(Color c, String l){return Row(children: [Container(width:14, height:12, decoration: BoxDecoration(color:c, border: Border.all(color:c==Colors.white?Colors.green:c))), SizedBox(width:4), Text(l, style: TextStyle(fontSize:10))]);}
}

// ============== JOBS - WORKING ==============
class JobsHubPage extends StatefulWidget { @override State<JobsHubPage> createState() => JobsHubPageState(); }
class JobsHubPageState extends State<JobsHubPage> {
  String district = 'Chennai'; String filter = 'All'; String search = '';
  List<String> districts = ['All Districts','Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode','Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai','Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet','Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli','Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'];
  List<Map<String, dynamic>> jobs = [
    {'title':'Flutter Developer','company':'Zoho - Chennai','salary':'Rs.45k','type':'IT','exp':'0-2 yrs','loc':'Chennai','col':Colors.blue,'icon':Icons.code},
    {'title':'TNPSC Group 4','company':'Tamil Nadu Govt','salary':'Rs.35k','type':'Government','exp':'Degree','loc':'All Districts','col':Colors.green,'icon':Icons.account_balance},
    {'title':'Bank Clerk','company':'SBI - Coimbatore','salary':'Rs.28k','type':'Government','exp':'Graduate','loc':'Coimbatore','col':Colors.orange,'icon':Icons.account_balance_wallet},
    {'title':'Swiggy Delivery','company':'Swiggy','salary':'Rs.25k','type':'Private','exp':'10th','loc':'Chennai','col':Colors.deepOrange,'icon':Icons.delivery_dining},
    {'title':'Maths Teacher','company':'Velammal School','salary':'Rs.32k','type':'Private','exp':'B.Ed','loc':'Madurai','col':Colors.purple,'icon':Icons.school},
    {'title':'Police Constable','company':'TN Police','salary':'Rs.38k','type':'Government','exp':'12th','loc':'All Districts','col':Colors.brown,'icon':Icons.local_police},
    {'title':'Staff Nurse','company':'Apollo Hospital','salary':'Rs.30k','type':'Private','exp':'B.Sc Nursing','loc':'Trichy','col':Colors.pink,'icon':Icons.local_hospital},
    {'title':'Data Entry WFH','company':'TCS iON','salary':'Rs.18k','type':'IT','exp':'Any Degree','loc':'Work From Home','col':Colors.indigo,'icon':Icons.computer},
  ];
  List<Map<String, dynamic>> get filteredJobs {
    var list = jobs;
    if (filter != 'All') { list = list.where((j) => j['type'] == filter).toList(); }
    if (district != 'All Districts') { list = list.where((j) => j['loc'] == district || j['loc'] == 'All Districts' || j['loc'] == 'Work From Home').toList(); }
    if (search.isNotEmpty) { list = list.where((j) => j['title'].toString().toLowerCase().contains(search.toLowerCase())).toList(); }
    return list;
  }
  void applyJob(Map<String, dynamic> job) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(width:40, height:4, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10))),
            SizedBox(height:16),
            Icon(job['icon'], size:50, color: job['col']),
            SizedBox(height:10),
            Text(job['title'], style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
            Text(job['company'], style: TextStyle(color: Colors.grey)),
            SizedBox(height:16),
            TextField(decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person))),
            SizedBox(height:10),
            TextField(decoration: InputDecoration(labelText: 'Phone', border: Outline
