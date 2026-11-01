import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const ArjunMastermindApp());
}

class ArjunMastermindApp extends StatelessWidget {
  const ArjunMastermindApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arjun Mastermind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF0A194E)),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A194E),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.asset('assets/logo_final.png', width: 180, height: 180, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(width:180,height:180,decoration:BoxDecoration(color:const Color(0xFF0A194E),borderRadius:BorderRadius.circular(30),border:Border.all(color:const Color(0xFFFFD700),width:3)),child:const Center(child:Text('AM',style:TextStyle(color:Color(0xFFFFD700),fontSize:50,fontWeight:FontWeight.bold)))))),
          const SizedBox(height: 20),
          const Text('Arjun Mastermind', style: TextStyle(color: Color(0xFFFFD700), fontSize: 26, fontWeight: FontWeight.bold)),
          const Text('Namma Ooru Super App', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 30),
          const CircularProgressIndicator(color: Color(0xFFFFD700)),
        ]),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? _bannerAd; bool _isReady = false;
  @override
  void initState() {super.initState(); _bannerAd=BannerAd(adUnitId:'ca-app-pub-3940256099942544/6300978111',request:const AdRequest(),size:AdSize.banner,listener:BannerAdListener(onAdLoaded: (_)=>setState(()=>_isReady=true),onAdFailedToLoad: (a,e){a.dispose();}))..load();}
  @override
  void dispose() {_bannerAd?.dispose(); super.dispose();}

  final features = [
    {'title':'Games','icon':Icons.sports_esports,'color':Colors.purple,'screen':const GamesScreen()},
    {'title':'Food','icon':Icons.restaurant,'color':Colors.orange,'screen':const FoodScreen()},
    {'title':'Fashion','icon':Icons.checkroom,'color':Colors.pink,'screen':const FashionScreen()},
    {'title':'Jobs','icon':Icons.work,'color':Colors.blue,'screen':const JobsScreen()},
    {'title':'Movies','icon':Icons.movie,'color':Colors.red,'screen':const MoviesScreen()},
    {'title':'Travel','icon':Icons.flight,'color':Colors.teal,'screen':const TravelScreen()},
    {'title':'Books','icon':Icons.menu_book,'color':Colors.brown,'screen':const BooksScreen()},
    {'title':'News','icon':Icons.newspaper,'color':Colors.indigo,'screen':const NewsScreen()},
    {'title':'Recharge','icon':Icons.phone_android,'color':Colors.green,'screen':const RechargeScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: const Color(0xFF0A194E), title: Row(children: [ClipRRect(borderRadius:BorderRadius.circular(8),child:Image.asset('assets/logo_final.png',width:40,height:40,fit:BoxFit.cover,errorBuilder:(c,e,s)=>const Text('AM',style:TextStyle(color:Color(0xFFFFD700))))),const SizedBox(width:10),const Text('Arjun Mastermind',style:TextStyle(color:Color(0xFFFFD700),fontWeight:FontWeight.bold,fontSize:18))]), elevation: 0),
      body: Column(children: [
        Container(padding:const EdgeInsets.all(12),color:const Color(0xFF0A194E),child:const Row(children:[Icon(Icons.verified_user,color:Color(0xFFFFD700)),SizedBox(width:8),Text('All Features Working!',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))])),
        Expanded(child: GridView.builder(padding:const EdgeInsets.all(16),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,childAspectRatio:0.9,crossAxisSpacing:12,mainAxisSpacing:12),itemCount:features.length,itemBuilder:(c,i){final f=features[i]; return GestureDetector(onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>f['screen'] as Widget)),child:Container(decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(16),boxShadow:[BoxShadow(color:(f['color'] as Color).withOpacity(0.2),blurRadius:8,offset:const Offset(0,4))]),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Container(padding:const EdgeInsets.all(12),decoration:BoxDecoration(color:(f['color'] as Color).withOpacity(0.15),shape:BoxShape.circle),child:Icon(f['icon'] as IconData,color:f['color'] as Color,size:32)),const SizedBox(height:8),Text(f['title'] as String,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:13))])));})),
        if(_isReady&&_bannerAd!=null) Container(alignment:Alignment.center,width:_bannerAd!.size.width.toDouble(),height:_bannerAd!.size.height.toDouble(),child:AdWidget(ad:_bannerAd!)),
      ]),
    );
  }
}

class GamesScreen extends StatefulWidget {const GamesScreen({super.key}); @override State<GamesScreen> createState()=>_GamesScreenState();}
class _GamesScreenState extends State<GamesScreen>{
  List<String> board=List.filled(9,''); String turn='X'; String winner='';
  void tap(int i){if(board[i]==''&&winner==''){setState((){board[i]=turn; if(_checkWin()){winner=turn;}else if(!board.contains('')){winner='Draw';}else{turn=turn=='X'?'O':'X';}});}}
  bool _checkWin(){List<List<int>> w=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]; for(var l in w){if(board[l[0]]!=''&&board[l[0]]==board[l[1]]&&board[l[1]]==board[l[2]]) return true;} return false;}
  @override
  Widget build(BuildContext context){return Scaffold(appBar: AppBar(title:const Text('Games - TicTacToe'),backgroundColor:Colors.purple),body:Column(children:[const SizedBox(height:20),Text(winner==''?'Turn: $turn':winner=='Draw'?'Draw!':'Winner: $winner',style:const TextStyle(fontSize:24,fontWeight:FontWeight.bold)),const SizedBox(height:20),Expanded(child:GridView.builder(padding:const EdgeInsets.all(20),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3),itemCount:9,itemBuilder:(c,i)=>GestureDetector(onTap:()=>tap(i),child:Container(margin:const EdgeInsets.all(4),decoration:BoxDecoration(border:Border.all(width:2),borderRadius:BorderRadius.circular(8)),child:Center(child:Text(board[i],style:const TextStyle(fontSize:40,fontWeight:FontWeight.bold))))))),ElevatedButton(onPressed: ()=>setState((){board=List.filled(9,'');winner='';turn='X';}), child:const Text('Restart Game')),const SizedBox(height:20)]));}
}

class FoodScreen extends StatefulWidget{const FoodScreen({super.key});@override State<FoodScreen> createState()=>_FoodScreenState();}
class _FoodScreenState extends State<FoodScreen>{
  List<Map<String, dynamic>> cart=[];
  final List<Map<String, dynamic>> foods=[
    {'name':'Chicken Biryani','price':199},
    {'name':'Dosa','price':60},
    {'name':'Meals','price':120},
    {'name':'Parotta','price':80},
    {'name':'Pizza','price':299},
    {'name':'Burger','price':149},
  ];
  @override
  Widget build(BuildContext context){
    int total=0;
    for(var item in cart){ total += item['price'] as int; }
    return Scaffold(
      appBar:AppBar(title:Text('Food Order - Cart: ${cart.length}'),backgroundColor:Colors.orange),
      body:Column(children:[
        Expanded(child:ListView.builder(itemCount:foods.length,itemBuilder:(c,i){
          final f=foods[i];
          return ListTile(
            leading:const Icon(Icons.fastfood,color:Colors.orange,size:30),
            title:Text(f['name'] as String),
            subtitle:Text('Rs ${f['price']}'),
            trailing:ElevatedButton(onPressed: ()=>setState(()=>cart.add(f)), child:const Text('Add')),
          );
        })),
        Container(padding:const EdgeInsets.all(16),color:Colors.orange.shade100,child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text('Total: Rs $total',style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),ElevatedButton(onPressed: cart.isEmpty?null:(){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Order Placed! Total Rs $total - Delivery in 30min!'))); setState(()=>cart.clear());}, child:const Text('Order Now'))])),
      ]),
    );
  }
}

class FashionScreen extends StatelessWidget{const FashionScreen({super.key}); @override Widget build(BuildContext context){final items=[{'name':'T-Shirt','price':'Rs 399','color':Colors.blue},{'name':'Jeans','price':'Rs 899','color':Colors.indigo},{'name':'Shoes','price':'Rs 1299','color':Colors.brown},{'name':'Watch','price':'Rs 1999','color':Colors.grey},{'name':'Cap','price':'Rs 199','color':Colors.orange},{'name':'Jacket','price':'Rs 1499','color':Colors.black}]; return Scaffold(appBar:AppBar(title:const Text('Fashion Store'),backgroundColor:Colors.pink),body:GridView.builder(padding:const EdgeInsets.all(12),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio:0.8,crossAxisSpacing:12,mainAxisSpacing:12),itemCount:items.length,itemBuilder:(c,i){final it=items[i]; return Card(child:Column(children:[Expanded(child:Container(color:(it['color'] as Color).withOpacity(0.2),child:Center(child:Icon(Icons.checkroom,size:60,color:it['color'] as Color)))),Padding(padding:const EdgeInsets.all(8),child:Column(children:[Text(it['name'] as String,style:const TextStyle(fontWeight:FontWeight.bold)),Text(it['price'] as String,style:const TextStyle(color:Colors.pink,fontWeight:FontWeight.bold)),ElevatedButton(onPressed: ()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('${it['name']} Added to Cart!'))), child:const Text('Buy'))]))]));}));}}
class JobsScreen extends StatelessWidget{const JobsScreen({super.key}); @override Widget build(BuildContext context){final jobs=[{'title':'Delivery Boy','company':'Swiggy','salary':'Rs 15k-20k'},{'title':'Sales Executive','company':'Local Shop','salary':'Rs 12k-18k'},{'title':'Driver','company':'Auto/Taxi','salary':'Rs 18k-25k'}]; return Scaffold(appBar:AppBar(title:const Text('Namma Ooru Jobs'),backgroundColor:Colors.blue),body:ListView.builder(itemCount:jobs.length,itemBuilder:(c,i){final j=jobs[i]; return Card(margin:const EdgeInsets.all(8),child:ListTile(leading:const CircleAvatar(child:Icon(Icons.work)),title:Text(j['title'] as String),subtitle:Text('${j['company']} - ${j['salary']}'),trailing:ElevatedButton(onPressed: ()=>ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content:Text('Applied! Company will call you!'))), child:const Text('Apply'))));}));}}
class MoviesScreen extends StatelessWidget{const MoviesScreen({super.key}); @override Widget build(BuildContext context){final movies=['Leo - Vijay','Jailer - Rajini','Ponniyin Selvan','Varisu','Thunivu','Love Today']; return Scaffold(appBar:AppBar(title:const Text('Movies & Shows'),backgroundColor:Colors.red),body:ListView.builder(itemCount:movies.length,itemBuilder:(c,i)=>Card(child:ListTile(leading:const Icon(Icons.movie,color:Colors.red,size:40),title:Text(movies[i]),subtitle:const Text('HD - Tamil - 2h 30m'),trailing:IconButton(icon:const Icon(Icons.play_circle_fill,color:Colors.red,size:40),onPressed: ()=>ScaffoldMessenger.of(c).showSnackBar(SnackBar(content:Text('Playing ${movies[i]}...')))))))); }}
class TravelScreen extends StatefulWidget{const TravelScreen({super.key});@override State<TravelScreen> createState()=>_TravelScreenState();}
class _TravelScreenState extends State<TravelScreen>{String from='Coimbatore'; String to='Chennai'; @override Widget build(BuildContext context){return Scaffold(appBar:AppBar(title:const Text('Travel Booking'),backgroundColor:Colors.teal),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[DropdownButtonFormField(value:from,items:['Coimbatore','Podanur','Tirupur','Salem'].map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),onChanged: (v)=>setState(()=>from=v!),decoration:const InputDecoration(labelText:'From',border:OutlineInputBorder())),const SizedBox(height:16),DropdownButtonFormField(value:to,items:['Chennai','Bangalore','Madurai','Trichy'].map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),onChanged: (v)=>setState(()=>to=v!),decoration:const InputDecoration(labelText:'To',border:OutlineInputBorder())),const SizedBox(height:20),Card(child:Padding(padding:const EdgeInsets.all(12),child:Column(children:[ListTile(leading:const Icon(Icons.directions_bus,color:Colors.teal),title:Text('$from to $to'),subtitle:const Text('Govt Bus - 6:00 AM - Rs 350'),trailing:ElevatedButton(onPressed: ()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Bus Booked! $from to $to'))), child:const Text('Book'))),ListTile(leading:const Icon(Icons.train,color:Colors.teal),title:Text('$from to $to'),subtitle:const Text('Express Train - 10:00 PM - Rs 250'),trailing:ElevatedButton(onPressed: ()=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Train Booked! $from to $to'))), child:const Text('Book')))]))) ])));}}
class BooksScreen extends StatelessWidget{const BooksScreen({super.key}); @override Widget build(BuildContext context){final books=['Tamil Stories','GK for TNPSC','Computer Basics','English Speaking','Business Ideas','Farmer Guide']; return Scaffold(appBar:AppBar(title:const Text('Books & Education'),backgroundColor:Colors.brown),body:ListView.builder(itemCount:books.length,itemBuilder:(c,i)=>Card(child:ListTile(leading:const Icon(Icons.menu_book,color:Colors.brown,size:40),title:Text(books[i]),subtitle:const Text('Free - Read Offline'),trailing:ElevatedButton(onPressed: ()=>ScaffoldMessenger.of(c).showSnackBar(SnackBar(content:Text('Opening ${books[i]}...'))), child:const Text('Read'))))));}}
class NewsScreen extends StatelessWidget{const NewsScreen({super.key}); @override Widget build(BuildContext context){final news=[{'title':'Coimbatore la heavy rain','time':'2h ago'},{'title':'Podanur la new shop open','time':'5h ago'},{'title':'Tamil Nadu Jobs 2026','time':'1d ago'}]; return Scaffold(appBar:AppBar(title:const Text('Namma Ooru News'),backgroundColor:Colors.indigo),body:ListView.builder(itemCount:news.length,itemBuilder:(c,i){final n=news[i]; return Card(child:ListTile(leading:const Icon(Icons.newspaper,color:Colors.indigo),title:Text(n['title'] as String),subtitle:Text(n['time'] as String),onTap: ()=>ScaffoldMessenger.of(c).showSnackBar(SnackBar(content:Text(n['title'] as String)))));})) ;}}
class RechargeScreen extends StatefulWidget{const RechargeScreen({super.key});@override State<RechargeScreen> createState()=>_RechargeScreenState();}
class _RechargeScreenState extends State<RechargeScreen>{final _phone=TextEditingController(); String _operator='Jio'; @override Widget build(BuildContext context){return Scaffold(appBar:AppBar(title:const Text('Recharge'),backgroundColor:Colors.green),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(controller:_phone,keyboardType:TextInputType.phone,decoration:const InputDecoration(labelText:'Mobile Number',border:OutlineInputBorder(),prefixText:'+91 ')),const SizedBox(height:16),DropdownButtonFormField(value:_operator,items:['Jio','Airtel','Vi','BSNL'].map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),onChanged: (v)=>setState(()=>_operator=v!),decoration:const InputDecoration(labelText:'Operator',border:OutlineInputBorder())),const SizedBox(height:20),SizedBox(width:double.infinity,child:ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Colors.green,padding:const EdgeInsets.all(16)),onPressed: (){if(_phone.text.length==10){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Recharge Success! Rs 199 to ${_phone.text} ($_operator)')));}else{ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Enter 10 digit number')));}}, child:const Text('Recharge Now',style:TextStyle(fontSize:18,color:Colors.white))))])));}}
