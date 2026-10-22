import 'package:flutter/material.dart';
void main(){runApp(const MyApp());}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(debugShowCheckedModeBanner:false,home:HomePage());
  }
}
class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:const Color(0xFFFAF5FF),
      body:Column(
        children:[
          Container(
            padding:const EdgeInsets.fromLTRB(20,60,20,40),
            decoration:const BoxDecoration(color:Color(0xFF7C3AED),borderRadius:BorderRadius.only(bottomLeft:Radius.circular(40),bottomRight:Radius.circular(40))),
            child:const Center(child:Text('ARJUN MASTERMIND',style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold))),
          ),
          Expanded(
            child:GridView.count(
              crossAxisCount:3,
              padding:const EdgeInsets.all(16),
              children:[
                _card(context,'Games',Icons.sports_esports,const GamesPage()),
                _card(context,'Food',Icons.fastfood,const FoodPage()),
                _card(context,'Movies',Icons.movie,const MoviePage()),
                _card(context,'Jobs',Icons.work,const JobsPage()),
                _card(context,'Travel',Icons.directions_bus,const TravelPage()),
                _card(context,'Dress',Icons.checkroom,const DressPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _card(BuildContext ctx,String t,IconData ic,Widget p){
    return GestureDetector(
      onTap:(){Navigator.push(ctx,MaterialPageRoute(builder:(_)=>p));},
      child:Card(shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Icon(ic,size:40,color:const Color(0xFF7C3AED)),const SizedBox(height:8),Text(t,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:12))])),);
  }
}
class GamesPage extends StatelessWidget{const GamesPage({super.key});@override Widget build(BuildContext context){return Scaffold(appBar:AppBar(title:const Text('Games')),body:const Center(child:Text('Tic Tac Toe - Working')));}}
class FoodPage extends StatelessWidget{const FoodPage({super.key});@override Widget build(BuildContext context){return Scaffold(appBar:AppBar(title:const Text('Food')),body:const Center(child:Text('Food - Swiggy/Zomato Working')));}}
class MoviePage extends StatelessWidget{const MoviePage({super.key});@override Widget build(BuildContext context){return Scaffold(appBar:AppBar(title:const Text('Movies')),body:const Center(child:Text('Movies - Seat Booking')));}}
class JobsPage extends StatelessWidget{const JobsPage({super.key});@override Widget build(BuildContext context){return Scaffold(appBar:AppBar(title:const Text('Jobs')),body:const Center(child:Text('Jobs - 38 Districts')));}}

class TravelPage extends StatefulWidget{const TravelPage({super.key});@override State<TravelPage> createState()=>TravelState();}
class TravelState extends State<TravelPage>{
  String from='Chennai';
  String to='Coimbatore';
  List<String> list=['Chennai','Coimbatore','Madurai','Salem','Trichy','Thanjavur','Vellore','Erode','Tiruppur'];
  List<Map<String,String>> buses=[
    {'name':'Parveen Travels','time':'8 PM','price':'750','from':'Chennai','to':'Coimbatore'},
    {'name':'SETC','time':'10:30 PM','price':'450','from':'Chennai','to':'Madurai'},
    {'name':'SRS','time':'9:15 PM','price':'900','from':'Coimbatore','to':'Chennai'},
  ];
  List<String> seats=[];
  @override
  Widget build(BuildContext context){
    var show=buses.where((b)=>b['from']==from && b['to']==to).toList();
    return Scaffold(
      appBar:AppBar(title:const Text('Travel - TN Buses'),backgroundColor:const Color(0xFF059669)),
      body:Column(
        children:[
          Padding(
            padding:const EdgeInsets.all(12),
            child:Row(
              children:[
                Expanded(child:DropdownButton<String>(value:from,isExpanded:true,items:list.map((d)=>DropdownMenuItem(value:d,child:Text(d))).toList(),onChanged:(v){setState((){from=v!;});})),
                const SizedBox(width:12),
                Expanded(child:DropdownButton<String>(value:to,isExpanded:true,items:list.map((d)=>DropdownMenuItem(value:d,child:Text(d))).toList(),onChanged:(v){setState((){to=v!;});})),
              ],
            ),
          ),
          Text('$from to $to - ${show.length} buses'),
          Expanded(
            child:ListView.builder(
              itemCount:show.length,
              itemBuilder:(c,i){
                var b=show[i];
                return Card(child:ListTile(title:Text(b['name']!),subtitle:Text('${b['time']!} - Rs.${b['price']!}'),trailing:ElevatedButton(onPressed:(){_openSeats(b);},child:const Text('Book'))));
              },
            ),
          ),
        ],
      ),
    );
  }
  void _openSeats(Map<String,String> bus){
    showModalBottomSheet(context:context,builder:(ctx){
      return StatefulBuilder(builder:(ctx,set2){
        return Container(
          padding:const EdgeInsets.all(20),
          child:Column(
            children:[
              Text('${bus['name']!} - ${bus['from']!} to ${bus['to']!}'),
              const SizedBox(height:12),
              Expanded(child:GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:6),itemCount:24,itemBuilder:(c,i){
                String s='S${i+1}';
                bool sel=seats.contains(s);
                return GestureDetector(onTap:(){set2((){if(sel){seats.remove(s);}else{seats.add(s);}});setState((){});},child:Container(margin:const EdgeInsets.all(4),color:sel?Colors.green:Colors.grey.shade300,child:Center(child:Text(s,style:const TextStyle(fontSize:10)))));
              })),
              ElevatedButton(onPressed:(){Navigator.pop(ctx);ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Booked ${seats.join(",")} in ${bus['name']!}')));setState((){seats=[];});},child:Text('Pay Rs.${seats.length*int.parse(bus['price']!)}')),
            ],
          ),
        );
      });
    });
  }
}

class DressPage extends StatefulWidget{const DressPage({super.key});@override State<DressPage> createState()=>DressState();}
class DressState extends State<DressPage>{
  String cat='All';
  List<String> cats=['All','Mens','Womens','Kids'];
  List<Map<String,String>> dresses=[
    {'name':'Mens Shirt','price':'799','cat':'Mens'},
    {'name':'Saree Silk','price':'2500','cat':'Womens'},
    {'name':'Kids T-Shirt','price':'499','cat':'Kids'},
    {'name':'Womens Kurta','price':'1200','cat':'Womens'},
    {'name':'Mens Jeans','price':'1500','cat':'Mens'},
  ];
  List<Map<String,String>> cart=[];
  List<Map<String,String>> get filtered{ if(cat=='All'){return dresses;} return dresses.where((d)=>d['cat']==cat).toList(); }
  int total(){int s=0;for(var e in cart){s+=int.parse(e['price']!);}return s;}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title:const Text('Dress Order'),backgroundColor:const Color(0xFFDB2777)),
      body:Column(
        children:[
          SizedBox(height:50,child:ListView(scrollDirection:Axis.horizontal,children:cats.map((c){return Padding(padding:const EdgeInsets.only(right:8),child:ChoiceChip(label:Text(c),selected:cat==c,onSelected:(v){setState((){cat=c;});}));}).toList())),
          Expanded(child:GridView.builder(padding:const EdgeInsets.all(10),gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio:0.7),itemCount:filtered.length,itemBuilder:(c,i){var d=filtered[i];return Card(child:Padding(padding:const EdgeInsets.all(10),child:Column(children:[const Icon(Icons.checkroom,size:50,color:Color(0xFFDB2777)),Text(d['name']!,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:12)),Text('Rs.${d['price']!}',style:const TextStyle(color:Color(0xFFDB2777),fontWeight:FontWeight.bold)),const Spacer(),ElevatedButton(onPressed:(){setState((){cart.add(d);});},child:const Text('ADD'))])));})),
          if(cart.isNotEmpty) Container(padding:const EdgeInsets.all(12),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text('Cart ${cart.length} - Rs.${total()}'),ElevatedButton(onPressed:(){setState((){cart=[];});ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Order Success! Dress Delivered da!')));},child:const Text('Order Now'))])),
        ],
      ),
    );
  }
}                                                      
