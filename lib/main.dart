import 'package:flutter/material.dart';

void main() { runApp(ArjunApp()); }

class ArjunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF5FF),
      body: Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(20,60,20,40),
          decoration: BoxDecoration(color: Color(0xFF7C3AED), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
          child: Center(child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
        ),
        Expanded(child: GridView.count(crossAxisCount: 3, padding: EdgeInsets.all(16), children: [
          card(context, 'Games', Icons.sports_esports, PlaceholderPage(t: 'Games')),
          card(context, 'Food', Icons.fastfood, PlaceholderPage(t: 'Food')),
          card(context, 'Movies', Icons.movie, MoviePage()),
          card(context, 'Jobs', Icons.work, JobsHubPage()),
          card(context, 'Travel', Icons.directions_bus, PlaceholderPage(t: 'Travel')),
          card(context, 'Dress', Icons.checkroom, PlaceholderPage(t: 'Dress')),
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

class PlaceholderPage extends StatelessWidget {
  final String t;
  PlaceholderPage({required this.t});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(t)), body: Center(child: Text('$t Coming Soon')));
}

class MoviePage extends StatefulWidget { @override State<MoviePage> createState() => MoviePageState(); }
class MoviePageState extends State<MoviePage> {
  String district = 'Coimbatore';
  String filter = 'Tamil';
  List<String> districts = ['Chennai','Coimbatore','Madurai','Salem','Trichy'];
  List<Map<String, dynamic>> movies = [
    {'title':'Jailer 2','sub':'367K+ likes','lang':'Tamil','col':Colors.brown},
    {'title':'Street Fighter','sub':'7.3  3.6K+ votes','lang':'English','col':Colors.red},
    {'title':'Drones','sub':'8.9  1.4K+ votes','lang':'Tamil','col':Colors.orange},
    {'title':'Baththa','sub':'9.2  37.2K+ votes','lang':'Tamil','col':Colors.deepOrange},
  ];
  List<Map<String, dynamic>> get filtered => filter=='All' ? movies : movies.where((m)=>m['lang']==filter).toList();
  Widget chip(String l){bool s=filter==l;return Container(margin: EdgeInsets.only(right:8), child: ChoiceChip(label: Text(l), selected: s, onSelected: (v)=>setState(()=>filter=l)));}
  @override Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black), title: Text('Now Showing - $district', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      body: Column(children: [
        DropdownButton<String>(value: district, isExpanded: true, items: districts.map((d)=>DropdownMenuItem(value: d, child: Text(d))).toList(), onChanged: (v)=>setState(()=>district=v!)),
        SingleChildScrollView(scrollDirection: Axis.horizontal, padding: EdgeInsets.all(8), child: Row(children: [chip('All'), chip('Tamil'), chip('English'), chip('Hindi')])),
        Expanded(child: GridView.builder(padding: EdgeInsets.all(12), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.62, crossAxisSpacing: 12, mainAxisSpacing: 12), itemCount: filtered.length, itemBuilder: (c,i){var m=filtered[i];return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(height: 200, decoration: BoxDecoration(color: m['col'], borderRadius: BorderRadius.circular(12)), child: Center(child: Text(m['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)))), SizedBox(height:6), Text(m['sub'], style: TextStyle(fontSize:11, color: Colors.grey)), Text(m['title'], style: TextStyle(fontWeight: FontWeight.bold))]);})),
      ]),
    );
  }
}

class JobsHubPage extends StatefulWidget { @override State<JobsHubPage> createState() => JobsHubPageState(); }

class JobsHubPageState extends State<JobsHubPage> {
  String district = 'Chennai';
  String filter = 'All';
  String search = '';

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
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10))),
              SizedBox(height: 16),
              Icon(job['icon'], size: 50, color: job['col']),
              SizedBox(height: 10),
              Text(job['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(job['company'], style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16),
              TextField(decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person))),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: 'Phone', border: OutlineInputBorder(), prefixIcon: Icon(Icons.phone))),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: 'District', hintText: district, border: OutlineInputBorder(), prefixIcon: Icon(Icons.location_city))),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7C3AED), padding: EdgeInsets.all(16)),
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Applied Success! ${job['title']} - We will call you da!'), backgroundColor: Colors.green));
                  },
                  child: Text('APPLY NOW', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 20),
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F7FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Jobs in Tamil Nadu', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
          Text('$district | ${filteredJobs.length} Jobs', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ]),
      ),
      body: Column(children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          child: Column(children: [
            TextField(onChanged: (v)=>setState(()=>search=v), decoration: InputDecoration(hintText: 'Search jobs...', prefixIcon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: district,
              decoration: InputDecoration(labelText: 'District - 38 Districts', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), prefixIcon: Icon(Icons.location_on, color: Colors.red)),
              items: districts.map((d)=>DropdownMenuItem(value: d, child: Text(d, style: TextStyle(fontSize: 12)))).toList(),
              onChanged: (v)=>setState(()=>district=v!),
            ),
          ]),
        ),
        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            children: ['All','IT','Government','Private'].map((f){
              bool sel=filter==f;
              return Padding(padding: EdgeInsets.only(right:8), child: ChoiceChip(label: Text(f), selected: sel, selectedColor: Color(0xFF7C3AED), labelStyle: TextStyle(color: sel?Colors.white:Colors.black), onSelected: (v)=>setState(()=>filter=f)));
            }).toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: filteredJobs.length,
            itemBuilder: (c,i){
              var j=filteredJobs[i];
              return Card(
                margin: EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Row(children: [
                    Container(width: 50, height: 50, decoration: BoxDecoration(color: (j['col'] as Color).withOpacity(0.15), borderRadius: BorderRadius.circular(12)), child: Icon(j['icon'], color: j['col'])),
                    SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(j['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(j['company'], style: TextStyle(color: Colors.grey, fontSize: 11)),
                      SizedBox(height: 4),
                      Row(children: [
                        Container(padding: EdgeInsets.symmetric(horizontal:6, vertical:2), decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(4)), child: Text(j['salary'], style: TextStyle(fontSize:10, color: Colors.green, fontWeight: FontWeight.bold))),
                        SizedBox(width:6),
                        Icon(Icons.location_on, size:12, color: Colors.red),
                        Text(j['loc'], style: TextStyle(fontSize:10)),
                      ]),
                    ])),
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7C3AED), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), onPressed: ()=>applyJob(j), child: Text('Apply', style: TextStyle(color: Colors.white, fontSize:11))),
                  ]),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
