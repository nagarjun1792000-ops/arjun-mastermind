import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const ArjunMastermindApp());

const Color brandPurple = Color(0xFF5E35B1);
const Color pageBackground = Color(0xFFF7F5FC);
bool isUserPremium = false;

class ArjunMastermindApp extends StatelessWidget {
  const ArjunMastermindApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arjun Mastermind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: brandPurple),
        scaffoldBackgroundColor: pageBackground,
        appBarTheme: const AppBarTheme(backgroundColor: brandPurple, foregroundColor: Colors.white),
      ),
      home: const HomeScreen(),
    );
  }
}

class AppFeature {
  final String title; final String subtitle; final IconData icon;
  final List<ServiceItem> services; final bool premium; final bool partnerLinks;
  const AppFeature({required this.title, required this.subtitle, required this.icon, required this.services, this.premium = false, this.partnerLinks = false});
}

class ServiceItem {
  final String title; final String description; final String affLink; final String price;
  const ServiceItem(this.title, this.description, {this.affLink = '', this.price = ''});
}

const List<AppFeature> appFeatures = [
  AppFeature(title: 'Games', subtitle: 'Game categories and discovery', icon: Icons.sports_esports_rounded, services: [
    ServiceItem('Online Games', 'Discover online game options.'),
    ServiceItem('Puzzle Games', 'Explore puzzle and brain games.'),
    ServiceItem('Action Games', 'Browse action game categories.'),
  ]),
  AppFeature(title: 'Food Order', subtitle: 'Food and restaurant services - Earn 10%', icon: Icons.restaurant_rounded, partnerLinks: true, services: [
    ServiceItem('Restaurants', 'Swiggy Affiliate - Earn Rs.80 per order', affLink: 'https://www.swiggy.com/?aff=arjun123', price: '250'),
    ServiceItem('Food Menu', 'Zomato Partner Link', affLink: 'https://www.zomato.com/?aff=arjun', price: '300'),
    ServiceItem('Order Food', 'Order via Affiliate - Commission', affLink: 'https://www.swiggy.com/order?aff=arjun', price: '200'),
  ]),
  AppFeature(title: 'Movies', subtitle: 'Movies and ticket booking', icon: Icons.movie_creation_rounded, partnerLinks: true, services: [
    ServiceItem('Tamil Movies', 'BookMyShow Affiliate'), ServiceItem('Malayalam Movies', 'Browse info'),
    ServiceItem('Movie Booking', 'TicketNew Affiliate - Rs.30 per ticket', affLink: 'https://in.bookmyshow.com/?aff=arjun', price: '150'),
  ]),
  AppFeature(title: 'Jobs', subtitle: 'Job search resources - Premium', icon: Icons.work_rounded, premium: true, services: [
    ServiceItem('Private Jobs', 'TCS Data Entry Chennai 18k', affLink: 'https://amzn.to/tcs-job', price: 'Free'),
    ServiceItem('Government Jobs', 'TNPSC Group 4 - 35k Govt Job', affLink: 'https://amzn.to/tnpsc-book', price: 'Premium'),
    ServiceItem('Part-Time Jobs', 'Part-time Zoho Coimbatore 15k', affLink: 'https://www.meesho.com/job?aff=arjun', price: 'Free'),
    ServiceItem('Work From Home', 'WFH Namakkal 20k', affLink: 'https://www.meesho.com/wfh?aff=arjun', price: 'Free'),
  ]),
  AppFeature(title: 'Travel', subtitle: 'Travel planning - Earn Rs.40/ticket', icon: Icons.directions_bus_rounded, partnerLinks: true, services: [
    ServiceItem('Bus Booking', 'RedBus Affiliate - Rs.40 per ticket', affLink: 'https://www.redbus.in/?aff=arjun123', price: '750'),
    ServiceItem('Train Information', 'IRCTC Info + Amazon Affiliate', affLink: 'https://www.amazon.in/travel?tag=arjun-21', price: 'Free'),
    ServiceItem('Flight Booking', 'MakeMyTrip Affiliate', affLink: 'https://www.makemytrip.com/?aff=arjun', price: '2500'),
    ServiceItem('Hotels', 'Booking.com Affiliate - 10%', affLink: 'https://www.booking.com/?aff=arjun', price: '2000'),
  ]),
  AppFeature(title: 'Dress Order', subtitle: 'Clothing - Earn 10%', icon: Icons.checkroom_rounded, partnerLinks: true, services: [
    ServiceItem("Men's Fashion", 'Pothys Shirt Meesho 10%', affLink: 'https://www.meesho.com/men-shirt?aff=arjun123', price: '799'),
    ServiceItem("Women's Fashion", 'Kanchipuram Saree Amazon 10%', affLink: 'https://www.amazon.in/saree?tag=arjun-21', price: '2500'),
    ServiceItem('Kids Fashion', 'Kids Combo Meesho', affLink: 'https://www.meesho.com/kids?aff=arjun', price: '499'),
    ServiceItem('Shoes', 'Shoes Amazon Affiliate', affLink: 'https://www.amazon.in/shoes?tag=arjun-21', price: '999'),
  ]),
  AppFeature(title: 'Books', subtitle: 'Books and reading - Earn 10%', icon: Icons.menu_book_rounded, partnerLinks: true, services: [
    ServiceItem('Tamil Books', 'TNPSC Book Amazon 10%', affLink: 'https://amzn.to/tnpsc-book', price: '350'),
    ServiceItem('English Books', 'English Books Amazon', affLink: 'https://amzn.to/english-book', price: '450'),
    ServiceItem('Story Books', 'Story Books Meesho', affLink: 'https://www.meesho.com/books?aff=arjun', price: '200'),
    ServiceItem('Study Books', 'Study Books Amazon 10%', affLink: 'https://amzn.to/study-book', price: '500'),
  ]),
  AppFeature(title: 'World News', subtitle: 'News topics and updates', icon: Icons.public_rounded, services: [
    ServiceItem('India News', 'Live news via API'), ServiceItem('World News', 'World news feed'),
    ServiceItem('Technology News', 'Tech news'), ServiceItem('Sports News', 'Sports news'),
  ]),
  AppFeature(title: 'Mobile Recharge', subtitle: 'Recharge and bill payment - Premium', icon: Icons.phone_android_rounded, premium: true, services: [
    ServiceItem('Mobile Recharge', 'Recharge Provider - Earn Commission', affLink: 'https://www.paytm.com/recharge?aff=arjun', price: 'Premium'),
    ServiceItem('DTH Recharge', 'DTH Provider'), ServiceItem('Electricity Bills', 'Bill Payment Provider'),
  ]),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final filtered = appFeatures.where((f) {
      final q = query.toLowerCase();
      if (q.isEmpty) return true;
      return f.title.toLowerCase().contains(q) || f.subtitle.toLowerCase().contains(q) || f.services.any((s) => s.title.toLowerCase().contains(q));
    }).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 22, 20, 26),
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF4527A0), Color(0xFF7E57C2), Color(0xFF9575CD)], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Container(width: 56, height: 56, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: const Icon(Icons.auto_awesome_rounded, color: brandPurple, size: 34)),
                  const SizedBox(width: 13),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Text(isUserPremium ? 'PREMIUM ACTIVE - Earning Mode ON' : 'Your World. One App. - Earn 10%', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  ])),
                  if (!isUserPremium) GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen())), child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(12)), child: const Text('Rs.99', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)))),
                ]),
                const SizedBox(height: 22),
                const Text('What are you looking for?', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
                const SizedBox(height: 18),
                TextField(onChanged: (v) => setState(() => query = v), decoration: InputDecoration(hintText: 'Search games, food, movies...', prefixIcon: const Icon(Icons.search, color: brandPurple), filled: true, fillColor: Colors.white, contentPadding: const EdgeInsets.symmetric(vertical: 14), border: OutlineInputBorder(borderRadius: BorderRadius.circular(17), borderSide: BorderSide.none))),
              ]),
            ),
          ),
          SliverPadding(padding: const EdgeInsets.fromLTRB(18, 18, 18, 8), sliver: SliverToBoxAdapter(child: Row(children: [const Expanded(child: Text('Explore All Services', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800))), Text('${filtered.length} options', style: const TextStyle(color: Colors.black54, fontSize: 12))]))),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
            sliver: SliverLayoutBuilder(builder: (context, constraints) {
              final w = constraints.crossAxisExtent;
              final cols = w >= 900 ? 5 : w >= 600 ? 4 : w >= 400 ? 3 : 2;
              return SliverGrid(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: cols, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.86), delegate: SliverChildBuilderDelegate((context, index) {
                final f = filtered[index];
                return FeatureCard(feature: f, onTap: () {
                  if (f.premium && !isUserPremium) { Navigator.push(context, MaterialPageRoute(builder: (_) => PremiumScreen(lockName: f.title))); return; }
                  Navigator.push(context, MaterialPageRoute(builder: (_) => FeatureScreen(feature: f)));
                });
              }, childCount: filtered.length));
            }),
          ),
          const SliverPadding(padding: EdgeInsets.fromLTRB(16, 0, 16, 10), sliver: SliverToBoxAdapter(child: AdBox())),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 6, 18, 28),
            sliver: SliverToBoxAdapter(child: Column(children: [
              Card(elevation: 0, color: const Color(0xFFEDE7F6), child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
                const Icon(Icons.workspace_premium_rounded, color: brandPurple, size: 38), const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(isUserPremium ? 'Premium Active - Rs.99 Paid' : 'Arjun Premium @ Rs.99', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)), const SizedBox(height: 4), Text(isUserPremium ? 'All Jobs Unlocked + Extra 10% Commission!' : 'Unlock Jobs + Earn More - UPI Payment', style: const TextStyle(color: Colors.black54, fontSize: 11))])),
                FilledButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen())), child: Text(isUserPremium ? 'Active' : 'View')),
              ]))),
              const SizedBox(height: 10),
              const Text('AdSense + Affiliate Ready - Replace test IDs with yours to earn real money', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.black45)),
            ])),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final AppFeature feature; final VoidCallback onTap;
  const FeatureCard({super.key, required this.feature, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, borderRadius: BorderRadius.circular(21),
      child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(21), child: Container(padding: const EdgeInsets.all(11), decoration: BoxDecoration(borderRadius: BorderRadius.circular(21), border: Border.all(color: brandPurple.withOpacity(0.08)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.035), blurRadius: 11, offset: const Offset(0, 4))]), child: Stack(children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(height: 57, width: 57, decoration: BoxDecoration(color: const Color(0xFFEDE7F6), borderRadius: BorderRadius.circular(18)), child: Icon(feature.icon, color: brandPurple, size: 31)),
          const SizedBox(height: 11),
          Text(feature.title, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
          const SizedBox(height: 5),
          Text(feature.premium ? (isUserPremium ? 'UNLOCKED' : 'PREMIUM - Rs.99') : feature.partnerLinks ? 'EARN 10%' : 'EXPLORE', style: TextStyle(color: feature.premium ? (isUserPremium ? Colors.green : Colors.deepOrange) : feature.partnerLinks ? Colors.teal : Colors.black45, fontSize: 9, fontWeight: FontWeight.bold)),
        ]),
        if (feature.premium && !isUserPremium) Positioned(top: 4, right: 4, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle), child: const Icon(Icons.lock, size: 10))),
      ]))),
    );
  }
}

class FeatureScreen extends StatelessWidget {
  final AppFeature feature;
  const FeatureScreen({super.key, required this.feature});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(feature.title)),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(gradient: const LinearGradient(colors: [brandPurple, Color(0xFF9575CD)]), borderRadius: BorderRadius.circular(24)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(feature.icon, size: 48, color: Colors.white), const SizedBox(height: 13), Text(feature.title, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)), const SizedBox(height: 6), Text(feature.subtitle, style: const TextStyle(color: Colors.white70))])),
        const SizedBox(height: 14),
        const AdBox(),
        const SizedBox(height: 14),
        const Text('Available options', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 9),
        ...feature.services.map((s) => Card(color: Colors.white, elevation: 0, child: ListTile(
          leading: const CircleAvatar(backgroundColor: Color(0xFFEDE7F6), child: Icon(Icons.arrow_forward_rounded, color: brandPurple)),
          title: Text(s.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(s.description, style: const TextStyle(fontSize: 11)), if (s.price.isNotEmpty) Text('Price: ${s.price} - Earn 10%', style: const TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold))]),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: feature.partnerLinks ? Colors.green : brandPurple, padding: const EdgeInsets.symmetric(horizontal: 12)),
            onPressed: () async {
              if (s.affLink.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('Opening ${s.title}...\nAffiliate: ${s.affLink}\nYou earn 10% commission!')));
                // Real la: if (await canLaunchUrl(Uri.parse(s.affLink))) await launchUrl(Uri.parse(s.affLink), mode: LaunchMode.externalApplication);
              } else {
                showDialog(context: context, builder: (_) => AlertDialog(title: Text(s.title), content: Text(s.description), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))]));
              }
            },
            child: Text(feature.partnerLinks ? 'BUY' : 'VIEW', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ))),
        const SizedBox(height: 12),
        const AdBox(),
      ]),
    );
  }
}

class PremiumScreen extends StatefulWidget {
  final String? lockName;
  const PremiumScreen({super.key, this.lockName});
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool paying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lockName != null ? '${widget.lockName} Premium' : 'Arjun Premium'), backgroundColor: Colors.amber, foregroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(width: double.infinity, padding: const EdgeInsets.all(22), decoration: BoxDecoration(color: brandPurple, borderRadius: BorderRadius.circular(20)), child: Column(children: [const Icon(Icons.workspace_premium_rounded, color: Colors.amber, size: 60), const SizedBox(height: 10), Text(widget.lockName != null ? '${widget.lockName} is Locked!' : 'Get Premium @ Rs.99', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)), const Text('Unlock Jobs + Extra Affiliate Earning', style: TextStyle(color: Colors.white70))])),
          const SizedBox(height: 20),
          const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Unlimited TN Jobs - 38 Districts', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)), subtitle: Text('Daily Updates')),
          const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('HR Numbers + WhatsApp Alerts', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
          const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Earn 20% Affiliate Instead of 10%', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
          const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('No Ads + Bus Booking + Recharge', style: TextStyle(fontSize: 13))),
          const Spacer(),
          SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: brandPurple, padding: const EdgeInsets.all(18)), onPressed: paying ? null : () async { setState(() => paying = true); await Future.delayed(const Duration(seconds: 2)); isUserPremium = true; setState(() => paying = false); if (mounted) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text('Payment Success Rs.99 - Premium Active! You earned Rs.99!'))); Navigator.pop(context); } }, child: Text(paying ? 'Processing UPI...' : 'PAY Rs.99 VIA UPI / GPay / PhonePe (Razorpay)', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
          const SizedBox(height: 8),
          const Text('Razorpay Real: razorpay.com la API Key eduthu integrate pannu - Rs.99 real payment', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.grey)),
          const SizedBox(height: 12),
          const AdBox(),
        ]),
      ),
    );
  }
}

class AdBox extends StatelessWidget {
  const AdBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black12)),
      child: Column(children: [
        Container(height: 60, decoration: BoxDecoration(color: const Color(0xFFF3E5F5), borderRadius: BorderRadi
