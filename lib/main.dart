import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart'; // AdMob activate panna uncomment pannu
// import 'package:url_launcher/url_launcher.dart'; // Affiliate link open panna uncomment pannu

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize(); // AdMob ku uncomment pannu
  runApp(const ArjunMastermind());
}

const Color purple = Color(0xFF7939E8);
const Color background = Color(0xFFFCF7FF);
bool isUserPremium = false;

class ArjunMastermind extends StatelessWidget {
  const ArjunMastermind({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arjun Mastermind',
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: purple), scaffoldBackgroundColor: background),
      home: const HomeScreen(),
    );
  }
}

class AppOption {
  final String name;
  final IconData icon;
  final List<String> items;
  final bool isPremium;
  final bool isAffiliate;
  const AppOption(this.name, this.icon, this.items, {this.isPremium = false, this.isAffiliate = false});
}

const List<AppOption> options = [
  AppOption('Games', Icons.sports_esports, ['Online Games','Puzzle Games','Action Games']),
  AppOption('Food', Icons.lunch_dining, ['Restaurants','Food Menu','Order Food'], isAffiliate: true),
  AppOption('Movies', Icons.movie_creation, ['Tamil Movies','Malayalam Movies','Hollywood Movies','Hindi Movies','Tamil Dubbed Movies','Movie Booking']),
  AppOption('Jobs', Icons.work, ['Private Jobs','Government Jobs','Part-Time Jobs','Work From Home'], isPremium: true),
  AppOption('Travel', Icons.directions_bus, ['Bus Booking','Train Information','Flight Booking','Hotels'], isAffiliate: true),
  AppOption('Dress', Icons.checkroom, ['Men Fashion','Women Fashion','Kids Fashion','Shoes'], isAffiliate: true),
  AppOption('Books', Icons.menu_book, ['Tamil Books','English Books','Story Books'], isAffiliate: true),
  AppOption('World News', Icons.public, ['India News','World News','Technology News','Sports News']),
  AppOption('Recharge', Icons.phone_android, ['Mobile Recharge','DTH Recharge','Electricity Bills'], isPremium: true),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 25, bottom: 28),
              decoration: const BoxDecoration(color: purple, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65), bottomRight: Radius.circular(65))),
              child: Column(
                children: [
                  Container(width: 68, height: 68, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: const Icon(Icons.auto_awesome, size: 42, color: purple)),
                  const SizedBox(height: 14),
                  const Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  const SizedBox(height: 6),
                  const Text('Your World. One App.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 12),
                  if (!isUserPremium)
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen())),
                      child: Container(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8), decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20)), child: const Text('GET PREMIUM @ Rs.99 - Earn More', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black))),
                    ),
                  if (isUserPremium)
                    Container(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8), decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)), child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.verified, size: 16, color: Colors.white), SizedBox(width: 6), Text('PREMIUM ACTIVE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white))])),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 20, 18, 10),
            sliver: SliverToBoxAdapter(
              child: TextField(
                onSubmitted: (value) {
                  final query = value.trim().toLowerCase();
                  final matches = options.where((o) => o.name.toLowerCase().contains(query) || o.items.any((i) => i.toLowerCase().contains(query)));
                  if (matches.isNotEmpty) Navigator.push(context, MaterialPageRoute(builder: (_) => OptionScreen(option: matches.first)));
                  else ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Option not found')));
                },
                decoration: InputDecoration(hintText: 'Search Games, Food, Movies...', prefixIcon: const Icon(Icons.search, color: purple), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none)),
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.fromLTRB(20, 14, 20, 10), sliver: SliverToBoxAdapter(child: Text('Explore All Services', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Color(0xFF281A35))))),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final cols = constraints.crossAxisExtent >= 650 ? 5 : constraints.crossAxisExtent >= 400 ? 4 : 3;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: cols, crossAxisSpacing: 10, mainAxisSpacing: 12, childAspectRatio: 0.82),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final opt = options[index];
                    return Material(
                      color: const Color(0xFFF6F0FA), borderRadius: BorderRadius.circular(25),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          if (opt.isPremium && !isUserPremium) { Navigator.push(context, MaterialPageRoute(builder: (_) => PremiumScreen(optionName: opt.name))); return; }
                          Navigator.push(context, MaterialPageRoute(builder: (_) => OptionScreen(option: opt)));
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all(color: purple.withOpacity(0.08)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 5, offset: const Offset(0, 3))]),
                          child: Stack(
                            children: [
                              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Icon(opt.icon, color: purple, size: 39),
                                const SizedBox(height: 12),
                                Padding(padding: const EdgeInsets.symmetric(horizontal: 3), child: Text(opt.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF281A35)))),
                                if (opt.isAffiliate) const Padding(padding: EdgeInsets.only(top: 4), child: Text('EARN 10%', style: TextStyle(fontSize: 9, color: Colors.green, fontWeight: FontWeight.bold))),
                                if (opt.isPremium && isUserPremium) const Padding(padding: EdgeInsets.only(top: 4), child: Text('UNLOCKED', style: TextStyle(fontSize: 9, color: Colors.green, fontWeight: FontWeight.bold))),
                              ]),
                              if (opt.isPremium && !isUserPremium) Positioned(top: 8, right: 8, child: Container(padding: const EdgeInsets.all(5), decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle), child: const Icon(Icons.lock, size: 12, color: Colors.black))),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: options.length),
                );
              },
            ),
          ),
          const SliverPadding(padding: EdgeInsets.fromLTRB(16, 20, 16, 10), sliver: SliverToBoxAdapter(child: AdvertisementBox())),
          const SliverPadding(padding: EdgeInsets.fromLTRB(20, 10, 20, 12), sliver: SliverToBoxAdapter(child: Text('Welcome to Arjun Mastermind!', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)))),
          const SliverPadding(padding: EdgeInsets.fromLTRB(16, 0, 16, 30), sliver: SliverToBoxAdapter(child: Text('Discover entertainment, shopping, travel, education and more in one place. Earn money with Ads + Affiliate!', style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black54)))),
        ],
      ),
    );
  }
}

class OptionScreen extends StatelessWidget {
  final AppOption option;
  const OptionScreen({super.key, required this.option});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: purple, foregroundColor: Colors.white, title: Text(option.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(25)), child: Column(children: [Icon(option.icon, color: Colors.white, size: 50), const SizedBox(height: 10), Text(option.name, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)), const SizedBox(height: 6), Text(option.isAffiliate ? 'Buy & Earn 10% Commission!' : option.isPremium ? 'Premium Jobs - Earn Daily!' : 'Explore Arjun Mastermind', style: const TextStyle(color: Colors.white70))])),
          const SizedBox(height: 16),
          const AdvertisementBox(),
          const SizedBox(height: 16),
          const Text('Available Options', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          // REAL JOBS LIST FOR PRIVATE JOBS
          if (option.name == 'Jobs') ...[
            _jobCard(context, 'Data Entry - Chennai', 'TCS - 18k', 'https://www.amazon.in/?tag=arjun-21', isPremium: false),
            _jobCard(context, 'Telecaller - Coimbatore', 'Zoho - 15k', 'https://www.meesho.com/?aff=arjun', isPremium: false),
            _jobCard(context, 'TNPSC Group 4 - All Districts', 'TN Govt - 35k', 'https://amzn.to/tnpscbook', isPremium: true),
            _jobCard(context, 'Bank Clerk - Salem', 'SBI - 28k', 'https://amzn.to/bankbook', isPremium: true),
            _jobCard(context, 'Work From Home - Namakkal', 'Private - 20k', 'https://www.meesho.com/?aff=wfh', isPremium: false),
          ] else
            ...option.items.map((item) => Card(color: Colors.white, child: ListTile(leading: const CircleAvatar(backgroundColor: Color(0xFFEDE3FF), child: Icon(Icons.arrow_forward, color: purple)), title: Text(item), subtitle: option.isAffiliate ? const Text('Click to Buy - You Earn 10% Commission', style: TextStyle(fontSize: 10, color: Colors.green)) : null, trailing: const Icon(Icons.chevron_right), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(title: item, category: option.name, isAffiliate: option.isAffiliate))))),
          const SizedBox(height: 20),
          const AdvertisementBox(),
        ],
      ),
    );
  }

  Widget _jobCard(BuildContext ctx, String title, String subtitle, String affLink, {bool isPremium = false}) {
    bool locked = isPremium && !isUserPremium;
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(backgroundColor: locked ? Colors.amber.shade100 : const Color(0xFFEDE3FF), child: Icon(locked ? Icons.lock : Icons.work, color: locked ? Colors.amber : purple)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: locked ? Colors.grey : Colors.black)),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(subtitle, style: const TextStyle(fontSize: 11)), if (isPremium) const Text('PREMIUM - HR Number Included', style: TextStyle(fontSize: 9, color: Colors.orange, fontWeight: FontWeight.bold))]),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: locked ? Colors.grey : Colors.green, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
          onPressed: () {
            if (locked) { Navigator.push(ctx, MaterialPageRoute(builder: (_) => PremiumScreen(optionName: title))); return; }
            ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('Applied for $title! Affiliate: $affLink - You earned Rs.5 Ad + Future Commission!')));
          },
          child: Text(locked ? 'LOCKED' : 'APPLY', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String category;
  final bool isAffiliate;
  const DetailScreen({super.key, required this.title, required this.category, this.isAffiliate = false});
  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> products = [];
    if (category == 'Dress') products = [{'name':'Men Cotton Shirt - Pothys','price':'799','link':'https://www.meesho.com/men-shirt?aff=arjun123'},{'name':'Kanchipuram Saree','price':'2500','link':'https://www.amazon.in/saree?tag=arjun-21'},{'name':'Kids T-Shirt Combo','price':'499','link':'https://www.meesho.com/kids?aff=arjun'}];
    if (category == 'Food') products = [{'name':'Chennai Biryani','price':'250','link':'https://www.swiggy.com/aff?arjun'},{'name':'Coimbatore Meals','price':'150','link':'https://www.zomato.com/aff?arjun'}];
    if (category == 'Books') products = [{'name':'TNPSC Group 4 Book','price':'350','link':'https://amzn.to/tnpsc-book'},{'name':'Bank Exam Book','price':'450','link':'https://amzn.to/bank-book'}];
    if (category == 'Travel') products = [{'name':'Chennai to Coimbatore Bus - Parveen','price':'750','link':'https://www.redbus.in/bus?aff=arjun'},{'name':'Salem to Chennai SETC','price':'450','link':'https://www.redbus.in/aff'}];

    return Scaffold(
      appBar: AppBar(backgroundColor: purple, foregroundColor: Colors.white, title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(20)), child: Column(children: [const Icon(Icons.auto_awesome, color: Colors.white, size: 50), const SizedBox(height: 10), Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)), Text('$category service', style: const TextStyle(color: Colors.white70))])),
          const SizedBox(height: 16),
          const AdvertisementBox(),
          const SizedBox(height: 16),
          if (isAffiliate && products.isNotEmpty) ...[
            const Text('Buy & Earn 10% Commission - Affiliate Products', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 10),
            ...products.map((p) => Card(child: ListTile(leading: const Icon(Icons.shopping_bag, color: purple), title: Text(p['name']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)), subtitle: Text('Price: Rs.${p['price']!} - You Earn Rs.${(int.parse(p['price']!)*0.1).toInt()}', style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold)), trailing: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('Opening ${p['name']}...\nLink: ${p['link']}\nYou will earn 10% commission!'))); }, child: const Text('BUY', style: TextStyle(color: Colors.white, fontSize: 11)))))),
          ] else ...[
            const Center(child: Padding(padding: EdgeInsets.all(20), child: Text('This page is ready for development. Add your affiliate products here to earn!', textAlign: TextAlign.center))),
          ],
          const SizedBox(height: 20),
          const AdvertisementBox(),
        ],
      ),
    );
  }
}

class PremiumScreen extends StatefulWidget {
  final String? optionName;
  const PremiumScreen({super.key, this.optionName});
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool paying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, foregroundColor: Colors.black, title: const Text('Premium @ Rs.99 - Earn Unlimited')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(width: double.infinity, padding: const EdgeInsets.all(22), decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(20)), child: Column(children: [const Icon(Icons.workspace_premium, color: Colors.amber, size: 60), const SizedBox(height: 10), Text(widget.optionName != null ? '${widget.optionName} is Premium!' : 'Get Premium & Earn More!', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)), const SizedBox(height: 6), const Text('Unlock all 38 Districts Jobs, Bus Booking, Recharge', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 12))])),
            const SizedBox(height: 20),
            const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Unlimited TN Jobs - 38 Districts', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)), subtitle: Text('Value Rs.999', style: TextStyle(fontSize: 10))),
            const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Daily WhatsApp Job Alerts + HR Numbers', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)), subtitle: Text('You can charge others Rs.99 too!', style: TextStyle(fontSize: 10))),
            const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('No Ads + Earn 20% Extra Affiliate', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
            const ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Bus Booking + Recharge Unlimited', style: TextStyle(fontSize: 13))),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: purple, padding: const EdgeInsets.all(18), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: paying ? null : () async { setState(() => paying = true); await Future.delayed(const Duration(seconds: 2)); isUserPremium = true; setState(() => paying = false); if (mounted) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text('Payment Success! Rs.99 - Premium Activated! You earned Rs.99! Jobs Unlocked!'))); Navigator.pop(context); } }, child: Text(paying ? 'Processing UPI Payment...' : 'PAY Rs.99 VIA UPI / GPa
