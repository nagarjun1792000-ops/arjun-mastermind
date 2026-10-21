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
      Expanded(child: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9), itemCount: items.length, itemBuilder: (ctx, i) => GestureDetector(onTap: () { if (i == 0) Navigator.push(context, MaterialPageRoute(builder: (_) => GamesHubPage())); else if (i == 1) Navigator.push(context, MaterialPageRoute(builder: (_) => FoodHubPage())); else Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(title: items[i]['ta'] as String))); }, child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(items[i]['icon'] as IconData, size: 40, color: Color(0xFF7C3AED)), SizedBox(height: 8), Text(items[i]['ta'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center),])))))
    ]));
  }
}
class DetailPage extends StatelessWidget { final String title; DetailPage({required this.title}); @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text(title), backgroundColor: Color(0xFF7C3AED)), body: Center(child: Text('$title Coming Soon da!'))); } }
class GamesHubPage extends StatelessWidget { @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text('Games Hub'), backgroundColor: Colors.orange), body: ListView(padding: EdgeInsets.all(16), children: [Card(child: ListTile(leading: Icon(Icons.grid_3x3, size: 40, color: Colors.orange), title: Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage())))), Card(child: ListTile(leading: Icon(Icons.memory, size: 40, color: Colors.purple), title: Text('Memory Match', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MemoryPage())))), Card(child: ListTile(leading: Icon(Icons.quiz, size: 40, color: Colors.green), title: Text('Arjun Quiz', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizPage())))),])); } }
class TicTacToePage extends StatefulWidget { @override State<TicTacToePage> createState() => _TicTacToePageState(); }
class _TicTacToePageState extends State<TicTacToePage> { List<String> board = List.filled(9, ''); bool xTurn = true; String win = ''; void check(){ List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]; for(var p in w){ if(board[p[0]]!='' && board[p[0]]==board[p[1]] && board[p[1]]==board[p[2]]){ win=board[p[0]]; return; } } if(!board.contains('')) win='Draw'; } @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text('Tic Tac Toe')), body: Column(children: [SizedBox(height:20), Text(win==''? '${xTurn?"X":"O"} Turn' : '$win Wins', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold)), Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3), itemCount:9, itemBuilder: (c,i)=> GestureDetector(onTap: (){ if(board[i]=='' && win==''){ setState((){ board[i]=xTurn?'X':'O'; xTurn=!xTurn; check(); }); } }, child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize:40))))))), ElevatedButton(onPressed: ()=> setState((){ board=List.filled(9,''); win=''; xTurn=true; }), child: Text('Restart')), SizedBox(height:20)])); } }
class MemoryPage extends StatefulWidget { @override State<MemoryPage> createState() => _MemoryPageState(); }
class _MemoryPageState extends State<MemoryPage> { List<int> nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]; List<bool> show = List.filled(16, false); int? first; @override void initState(){ super.initState(); nums.shuffle(); } @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text('Memory')), body: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4), itemCount:16, itemBuilder: (c,i)=> GestureDetector(onTap: (){ if(show[i]) return; setState(()=> show[i]=true); if(first==null){ first=i; } else { if(nums[first!]==nums[i]){ first=null; } else { Future.delayed(Duration(milliseconds:500), (){ setState((){ show[first!]=false; show[i]=false; first=null; }); }); } } }, child: Card(color: show[i]? Colors.white : Color(0xFF7C3AED), child: Center(child: Text(show[i]? '${nums[i]}' : '?', style: TextStyle(fontSize:24))))))); } }
class QuizPage extends StatefulWidget { @override State<QuizPage> createState() => _QuizPageState(); }
class _QuizPageState extends State<QuizPage> { int q=0, score=0; List<Map<String,dynamic>> list = [{'q':'Tamil Nadu capital enna?','o':['Chennai','Madurai','Trichy'],'a':0},{'q':'Arjun creator yaaru?','o':['Nagarjun','Rajini','Kamal'],'a':0},{'q':'Flutter by?','o':['Google','Meta','Apple'],'a':0}]; @override Widget build(BuildContext context){ if(q>=list.length) return Scaffold(appBar: AppBar(title: Text('Result')), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Score $score/${list.length}', style: TextStyle(fontSize:28, fontWeight: FontWeight.bold)), ElevatedButton(onPressed: ()=> setState((){q=0;score=0;}), child: Text('Again'))]))); return Scaffold(appBar: AppBar(title: Text('Quiz ${q+1}/${list.length}')), body: Padding(padding: EdgeInsets.all(20), child: Column(children: [Text(list[q]['q'] as String, style: TextStyle(fontSize:22, fontWeight: FontWeight.bold)), SizedBox(height:20), ...List.generate(3, (i)=> Card(child: ListTile(title: Text(list[q]['o'][i] as String), onTap: (){ if(i==list[q]['a']) score++; setState(()=> q++); }))) ]))); } }

class FoodHubPage extends StatefulWidget { @override State<FoodHubPage> createState() => _FoodHubPageState(); }
class _FoodHubPageState extends State<FoodHubPage> {
  String selectedDistrict = 'Chennai';
  String selectedPlatform = 'Swiggy';
  final List<String> districts = ['Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode','Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai','Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet','Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli','Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'];
  Map<String, List<Map<String,dynamic>>> platformData = {
    'Swiggy': [
      {'name':'Chicken Biryani','price':250,'icon':Icons.rice_bowl,'time':'30 mins','shop':'SS Hyderabad'},
      {'name':'Mutton Biryani','price':350,'icon':Icons.rice_bowl,'time':'35 mins','shop':'Thalappakatti'},
      {'name':'Parotta Set','price':120,'icon':Icons.bakery_dining,'time':'20 mins','shop':'Burma Kadai'},
      {'name':'Meals','price':150,'icon':Icons.restaurant,'time':'25 mins','shop':'Sangeethas'},
      {'name':'Pizza','price':299,'icon':Icons.local_pizza,'time':'30 mins','shop':'Dominos'},
      {'name':'Dosa','price':80,'icon':Icons.lunch_dining,'time':'15 mins','shop':'Murugan Idli'},
    ],
    'Zomato': [
      {'name':'Fried Rice','price':220,'icon':Icons.ramen_dining,'time':'28 mins','shop':'Zomato Kitchen'},
      {'name':'Burger Combo','price':199,'icon':Icons.fastfood,'time':'25 mins','shop':'Burger King'},
      {'name':'Shawarma','price':180,'icon':Icons.kebab_dining,'time':'20 mins','shop':'Al Bek'},
      {'name':'Grill Chicken','price':380,'icon':Icons.set_meal,'time':'40 mins','shop':'Grill Thrill'},
      {'name':'Pasta','price':249,'icon':Icons.dinner_dining,'time':'30 mins','shop':'Italian Corner'},
      {'name':'Momos','price':149,'icon':Icons.rice_bowl,'time':'22 mins','shop':'Wow Momo'},
    ],
    'Zepto': [
      {'name':'Milk 500ml','price':32,'icon':Icons.local_drink,'time':'10 mins','shop':'Zepto Cafe'},
      {'name':'Maggi 4pack','price':52,'icon':Icons.ramen_dining,'time':'10 mins','shop':'Zepto Super'},
      {'name':'Ice Cream Cup','price':99,'icon':Icons.icecream,'time':'10 mins','shop':'Zepto Cafe'},
      {'name':'Samosa 3pcs','price':75,'icon':Icons.bakery_dining,'time':'12 mins','shop':'Zepto Cafe'},
      {'name':'Banana 1kg','price':60,'icon':Icons.eco,'time':'10 mins','shop':'Zepto Fresh'},
      {'name':'Cold Coffee','price':89,'icon':Icons.coffee,'time':'10 mins','shop':'Zepto Cafe'},
    ],
    'Blinkit': [
      {'name':'Milk 1L','price':60,'icon':Icons.local_drink,'time':'8 mins','shop':'Blinkit Mart'},
      {'name':'Bread Loaf','price':45,'icon':Icons.bakery_dining,'time':'8 mins','shop':'Blinkit Mart'},
      {'name':'Eggs 12pcs','price':85,'icon':Icons.egg,'time':'8 mins','shop':'Blinkit Mart'},
      {'name':'Chips Lays','price':20,'icon':Icons.shopping_basket,'time':'8 mins','shop':'Blinkit Mart'},
      {'name':'Coke 750ml','price':40,'icon':Icons.local_drink,'time':'8 mins','shop':'Blinkit Mart'},
      {'name':'Atta 5kg','price':250,'icon':Icons.shopping_bag,'time':'8 mins','shop':'Blinkit Mart'},
    ],
    'BigBasket': [
      {'name':'Tomato 1kg','price':35,'icon':Icons.eco,'time':'2 hrs','shop':'BigBasket Fresh'},
      {'name':'Onion 2kg','price':55,'icon':Icons.eco,'time':'2 hrs','shop':'BigBasket Fresh'},
      {'name':'Rice 10kg','price':650,'icon':Icons.rice_bowl,'time':'2 hrs','shop':'BigBasket Daily'},
      {'name':'Oil 1L','price':180,'icon':Icons.water_drop,'time':'2 hrs','shop':'BigBasket Mart'},
      {'name':'Dal Toor 1kg','price':145,'icon':Icons.shopping_bag,'time':'2 hrs','shop':'BigBasket Mart'},
      {'name':'Fruits Combo','price':299,'icon':Icons.apple,'time':'2 hrs','shop':'BigBasket Fresh'},
    ],
  };

  List<Map<String,dynamic>> cart = [];
  int get total {
    int sum = 0;
    for (var e in cart) { sum += e['price'] as int; }
    return sum;
  }
  
  Color getPlatformColor(String p) {
    if (p == 'Swiggy') return Colors.orange;
    if (p == 'Zomato') return Color(0xFFE23744);
    if (p == 'Zepto') return Color(0xFF8B3CF7);
    if (p == 'Blinkit') return Color(0xFFFACC15);
    return Color(0xFF84CC16);
  }
  IconData getPlatformIcon(String p) {
    if (p == 'Swiggy') return Icons.delivery_dining;
    if (p == 'Zomato') return Icons.restaurant;
    if (p == 'Zepto') return Icons.bolt;
    if (p == 'Blinkit') return Icons.flash_on;
    return Icons.shopping_cart;
  }

  @override Widget build(BuildContext context){
    var foods = platformData[selectedPlatform]!;
    Color pColor = getPlatformColor(selectedPlatform);
    bool isDarkText = selectedPlatform == 'Blinkit' || selectedPlatform == 'BigBasket';
    return Scaffold(
      appBar: AppBar(title: Text('Food - $selectedPlatform'), backgroundColor: pColor, foregroundColor: isDarkText? Colors.black: Colors.white, actions: [Stack(children: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){ _showCart(); }), if(cart.isNotEmpty) Positioned(right:6, top:6, child: CircleAvatar(radius:9, backgroundColor: Colors.black, child: Text('${cart.length}', style: TextStyle(fontSize:10, color: Colors.white))))])]),
      body: Column(children: [
        Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), color: Colors.grey.shade100, child: Row(children: [Icon(Icons.location_on, color: Colors.red, size: 18), SizedBox(width:4), Text('Deliver:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), SizedBox(width:6), Expanded(child: DropdownButtonHideUnderline(child: DropdownButton<String>(value: selectedDistrict, isExpanded: true, isDense: true, style: TextStyle(fontSize:13, color: Colors.black, fontWeight: FontWeight.bold), icon: Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.red), items: districts.map((d)=> DropdownMenuItem(value: d, child: Text(d))).toList(), onChanged: (val){ if(val!=null){ setState((){ selectedDistrict = val; }); } },))) ,])),
        Container(height: 54, padding: EdgeInsets.symmetric(vertical:6), child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.symmetric(horizontal: 8), children: ['Swiggy','Zomato','Zepto','Blinkit','BigBasket'].map((p)=> Padding(padding: EdgeInsets.only(right:8), child: platformChip(p))).toList())),
        Container(padding: EdgeInsets.symmetric(horizontal:12, vertical:6), color: pColor.withOpacity(0.15), child: Row(children: [Icon(Icons.store, size:14, color: pColor), SizedBox(width:6), Expanded(child: Text('$selectedPlatform • $selectedDistrict • ${selectedPlatform=='Blinkit' || selectedPlatform=='Zepto' ? '8-10 mins' : selectedPlatform=='BigBasket' ? '2 Hours Slot' : '25-30 mins'}', style: TextStyle(fontSize:11, fontWeight: FontWeight.bold, color: pColor))) ,])),
        Expanded(child: ListView.builder(padding: EdgeInsets.all(10), itemCount: foods.length, itemBuilder: (c,i){ Color col = getPlatformColor(selectedPlatform); return Card(margin: EdgeInsets.only(bottom:10), child: ListTile(leading: CircleAvatar(backgroundColor: col.withOpacity(0.15), child: Icon(foods[i]['icon'] as IconData, color: col, size: 20)), title: Text(foods[i]['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)), subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('${foods[i]['shop']} • ${foods[i]['time']}', style: TextStyle(fontSize: 10)), Text('Rs. ${foods[i]['price']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]), trailing: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: col, foregroundColor: (selectedPlatform=='Blinkit'||selectedPlatform=='BigBasket')? Colors.black: Colors.white), onPressed: (){ setState((){ cart.add({'name': foods[i]['name'], 'price': foods[i]['price'], 'platform': selectedPlatform, 'shop': foods[i]['shop']}); }); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${foods[i]['name']} added!'), duration: Duration(milliseconds: 700))); }, child: Text('ADD', style: TextStyle(fontSize: 11))))); })),
        if(cart.isNotEmpty) Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)]), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Rs. $total Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize:14)), Text('${cart.length} items • $selectedDistrict', style: TextStyle(fontSize: 10, color: Colors.grey))]), ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: (){ _showCart(); }, child: Text('Order Now (${cart.length})'))])),
      ]),
    );
  }

  Widget platformChip(String name){
    bool isSel = selectedPlatform==name;
    Color color = getPlatformColor(name);
    bool darkText = name=='Blinkit' || name=='BigBasket';
    Color textColor;
    if(isSel){
      textColor = darkText? Colors.black : Colors.white;
    } else {
      textColor = color;
    }
    return GestureDetector(
      onTap: (){ setState((){ selectedPlatform = name; }); },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:14, vertical:8),
        decoration: BoxDecoration(color: isSel? color : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: color, width: isSel? 2:1.2)),
        child: Row(children: [Icon(getPlatformIcon(name), size:16, color: textColor), SizedBox(width:5), Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: textColor))])
      )
    );
  }

  void _showCart(){
    showModalBottomSheet(context: context, isScrollControlled: true, builder: (_)=> Container(padding: EdgeInsets.all(16), child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text('Cart - $selectedDistrict', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)), SizedBox(height:10),
      ConstrainedBox(constraints: BoxConstraints(maxHeight: 320), child: ListView(children: cart.map((f){ Color col = getPlatformColor(f['platform']); return ListTile(dense:true, leading: CircleAvatar(radius:12, backgroundColor: col, child: Text((f['platform'] as String).substring(0,1), style: TextStyle(fontSize:10, color: Colors.white, fontWeight: FontWeight.bold))), title: Text(f['name'], style: TextStyle(fontSize: 13)), subtitle: Text('${f['platform']} - ${f['shop']}', style: TextStyle(fontSize: 10)), trailing: Text('Rs.${f['price']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))); }).toList())),
      Divider(), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize:18)), Text('Rs. $total', style: TextStyle(fontWeight: FontWeight.bold, fontSize:18))]), SizedBox(height:10),
      SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: EdgeInsets.all(14)), onPressed: (){ Navigator.pop(context); setState((){ cart=[]; }); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Success da! $selectedDistrict ku delivery!'), backgroundColor: Colors.green)); }, child: Text('CONFIRM - Rs. $total'))),
      SizedBox(height: 20),
    ])));
  }
}
