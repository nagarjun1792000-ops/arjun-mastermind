import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const ArjunMastermindApp());

const Color brandPurple = Color(0xFF5E35B1);
const Color pageBg = Color(0xFFF7F5FC);
bool isPremium = false;

class ArjunMastermindApp extends StatelessWidget {
  const ArjunMastermindApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arjun Mastermind',
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: brandPurple), scaffoldBackgroundColor: pageBg),
      home: const HomeScreen(),
    );
  }
}

class AppFeature {
  final String title; final IconData icon; final List<String> items; final bool premium; final bool partner;
  const AppFeature(this.title, this.icon, this.items, {this.premium = false, this.partner = false});
}

const List<AppFeature> features = [
  AppFeature('Games', Icons.sports_esports_rounded, ['Online Games','Puzzle Games','Action Games']),
  AppFeature('Food Order', Icons.restaurant_rounded, ['Restaurants','Food Menu','Order Food'], partner: true),
  AppFeature('Movies', Icons.movie_creation_rounded, ['Tamil Movies','Hindi Movies','Movie Booking'], partner: true),
  AppFeature('Jobs', Icons.work_rounded, ['Private Jobs','Govt Jobs','Work From Home'], premium: true),
  AppFeature('Travel', Icons.directions_bus_rounded, ['Bus Booking','Train Info','Hotels'], partner: true),
  AppFeature('Dress Order', Icons.checkroom_rounded, ['Men Fashion','Women Fashion','Kids Fashion'], partner: true),
  AppFeature('Books', Icons.menu_book_rounded, ['Tamil Books','English Books','Story Books'], partner: true),
  AppFeature('World News', Icons.public_rounded, ['India News','World News','Tech News']),
  AppFeature('Recharge', Icons.phone_android_rounded, ['Mobile Recharge','DTH','EB Bills'], premium: true),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Container(
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 24),
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF4527A0), Color(0xFF7E57C2)]), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(width: 54, height: 54, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.auto_awesome, color: brandPurple, size: 32)),
              const SizedBox(width: 12),
              const Expanded(child: Text('ARJUN MASTERMIND\nYour World. One App.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              if (!isPremium) GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen())), child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(12)), child: const Text('Rs.99', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)))),
            ]),
            const SizedBox(height: 18),
            TextField(decoration: InputDecoration(hintText: 'Search...', prefixIcon: const Icon(Icons.search, color: brandPurple), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none))),
          ]),
        )),
        SliverPadding(padding: const EdgeInsets.all(16), sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.85),
          delegate: SliverChildBuilderDelegate((ctx, i) {
            final f = features[i];
            return InkWell(onTap: () {
              if (f.premium && !isPremium) { Navigator.push(ctx, MaterialPageRoute(builder: (_) => PremiumScreen(name: f.title))); return; }
              Navigator.push(ctx, MaterialPageRoute(builder: (_) => DetailPage(feature: f)));
            }, child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: brandPurple.withOpacity(0.1))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(f.icon, color: brandPurple, size: 36),
              const SizedBox(height: 10),
              Text(f.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(f.premium ? (isPremium ? 'UNLOCKED' : 'PREMIUM') : f.partner ? 'EARN 10%' : 'EXPLORE', style: TextStyle(fontSize: 9, color: f.partner ? Colors.green : Colors.grey, fontWeight: FontWeight.bold)),
            ])));
          }, childCount: features.length),
        )),
        const SliverPadding(padding: EdgeInsets.all(16), sliver: SliverToBoxAdapter(child: AdBox())),
      ]),
    );
  }
}

class DetailPage extends StatelessWidget {
  final AppFeature feature;
  const DetailPage({super.key, required this.feature});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(feature.title), backgroundColor: brandPurple, foregroundColor: Colors.white),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const AdBox(),
        const SizedBox(height: 12),
        ...feature.items.map((item) => Card(child: ListTile(
          leading: const CircleAvatar(backgroundColor: Color(0xFFEDE7F6), child: Icon(Icons.arrow_forward, color: brandPurple)),
          title: Text(item, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          subtitle: feature.partner ? const Text('Affiliate - You Earn 10%', style: TextStyle(fontSize: 10, color: Colors.green)) : null,
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: feature.partner ? Colors.green : brandPurple),
            onPressed: () async {
              final link = 'https://www.amazon.in/s?k=${item.replaceAll(' ', '+')}&tag=arjun-21';
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('$item clicked! Earn 10% via $link')));
              if (await canLaunchUrl(Uri.parse(link))) { await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication); }
            },
            child: Text(feature.partner ? 'BUY' : 'VIEW', style: const TextStyle(color: Colors.white, fontSize: 11)),
          ),
        ))),
        const SizedBox(height: 12),
        const AdBox(),
      ]),
    );
  }
}

class PremiumScreen extends StatefulWidget {
  final String? name;
  const PremiumScreen({super.key, this.name});
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name ?? 'Premium'), backgroundColor: Colors.amber, foregroundColor: Colors.black),
      body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
        Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: brandPurple, borderRadius: BorderRadius.circular(20)), child: const Column(children: [Icon(Icons.workspace_premium, color: Colors.amber, size: 60), SizedBox(height: 10), Text('Premium @ Rs.99', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))])),
        const SizedBox(height: 20),
        const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('38 Districts Jobs Unlocked', style: TextStyle(fontSize: 13))),
        const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Earn 20% Affiliate Commission', style: TextStyle(fontSize: 13))),
        const Spacer(),
        SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: brandPurple, padding: const EdgeInsets.all(16)), onPressed: loading ? null : () async { setState(() => loading = true); await Future.delayed(const Duration(seconds: 2)); isPremium = true; setState(() => loading = false); if (mounted) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text('Premium Active! Rs.99 Success!'))); Navigator.pop(context); } }, child: Text(loading ? 'Processing...' : 'PAY Rs.99 UPI / GPay', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
        const SizedBox(height: 12),
        const AdBox(),
      ])),
    );
  }
}

class AdBox extends StatelessWidget {
  const AdBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black12)),
      child: Column(children: [
        Container(height: 56, width: double.infinity, decoration: BoxDecoration(color: const Color(0xFFF3E5F5), borderRadius: BorderRadius.circular(12)), child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.campaign, color: brandPurple, size: 20), SizedBox(width: 8), Text('GOOGLE ADSENSE - Rs.5 / click', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: brandPurple))])),
        const SizedBox(height: 8),
        SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [
          _affChip(context, 'Shirt Rs.799'),
          _affChip(context, 'Saree Rs.2500'),
          _affChip(context, 'Book Rs.350'),
          _affChip(context, 'Bus Rs.650'),
        ])),
      ]),
    );
  }
  static Widget _affChip(BuildContext ctx, String name) {
    return Container(margin: const EdgeInsets.only(right: 8), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.green.withOpacity(0.3))), child: Row(children: [const Icon(Icons.shopping_bag, size: 14, color: Colors.green), const SizedBox(width: 4), Text(name, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)), const SizedBox(width: 6), Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)), child: const Text('BUY', style: TextStyle(fontSize: 8, color: Colors.white)))]));
  }
}
