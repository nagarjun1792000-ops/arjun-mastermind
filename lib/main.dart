import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const ArjunMastermindApp());
}

const brandPurple = Color(0xFF673AB7);
const pageBg = Color(0xFFF6F4FB);

class Service {
  final String title, subtitle;
  final IconData icon;
  final List<ServiceLink> links;
  const Service(this.title, this.subtitle, this.icon, this.links);
}

class ServiceLink {
  final String title, url, description;
  const ServiceLink(this.title, this.url, this.description);
}

const services = <Service>[
  Service('Games', 'Online games and gaming discovery', Icons.sports_esports, [
    ServiceLink('Browser games', 'https://www.google.com/search?q=free+browser+games', 'Find browser games'),
  ]),
  Service('Food Order', 'Discover restaurants and food delivery', Icons.restaurant, [
    ServiceLink('Swiggy', 'https://www.swiggy.com/', 'Open food delivery.'),
    ServiceLink('Zomato', 'https://www.zomato.com/', 'Browse restaurants.'),
  ]),
  Service('Dress Order', 'Clothing and fashion shopping', Icons.checkroom, [
    ServiceLink('Myntra', 'https://www.myntra.com/', 'Open fashion shopping.'),
    ServiceLink('AJIO', 'https://www.ajio.com/', 'Browse clothes and accessories.'),
  ]),
  Service('Jobs', 'Search jobs and career opportunities', Icons.work, [
    ServiceLink('National Career Service', 'https://www.ncs.gov.in/', 'Government job portal.'),
    ServiceLink('LinkedIn Jobs', 'https://www.linkedin.com/jobs/', 'Search job listings.'),
  ]),
  Service('Movies', 'Tamil, Malayalam, Hindi and Hollywood movies', Icons.movie, [
    ServiceLink('JustWatch India', 'https://www.justwatch.com/in', 'Find legal streaming options'),
    ServiceLink('BookMyShow', 'https://in.bookmyshow.com/', 'Explore cinema listings and tickets'),
  ]),
  Service('Travel Booking', 'Plan trips and compare travel options', Icons.flight_takeoff, [
    ServiceLink('IRCTC', 'https://www.irctc.co.in/', 'Official railway ticket booking.'),
    ServiceLink('RedBus', 'https://www.redbus.in/', 'Explore bus tickets.'),
    ServiceLink('MakeMyTrip', 'https://www.makemytrip.com/', 'Explore travel booking.'),
  ]),
  Service('Books', 'Find books and reading resources', Icons.menu_book, [
    ServiceLink('Google Books', 'https://books.google.com/', 'Discover books and previews.'),
    ServiceLink('Project Gutenberg', 'https://www.gutenberg.org/', 'Read public-domain ebooks.'),
  ]),
  Service('World News', 'Read current news from trusted sources', Icons.public, [
    ServiceLink('BBC News', 'https://www.bbc.com/news', 'Open international news.'),
    ServiceLink('Reuters', 'https://www.reuters.com/world/', 'Open world news.'),
    ServiceLink('The Hindu', 'https://www.thehindu.com/', 'Read Indian and international news.'),
  ]),
  Service('Mobile Recharge', 'Open recharge and bill payment services', Icons.phone_android, [
    ServiceLink('Airtel', 'https://www.airtel.in/recharge/', 'Open Airtel recharge.'),
    ServiceLink('Jio', 'https://www.jio.com/selfcare/recharge/mobility/', 'Open Jio recharge.'),
    ServiceLink('Vi', 'https://www.myvi.in/', 'Open Vi services.'),
  ]),
];

class ArjunMastermindApp extends StatelessWidget {
  const ArjunMastermindApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Arjun Mastermind',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: brandPurple),
      scaffoldBackgroundColor: pageBg,
      useMaterial3: true,
    ),
    home: const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final shown = services.where((s) =>
      s.title.toLowerCase().contains(query.toLowerCase()) ||
      s.subtitle.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: brandPurple,
        foregroundColor: Colors.white,
        title: Row(children: [
          Container(
            width: 38, height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.amber, width: 2),
              boxShadow: [BoxShadow(color: Colors.amber.withOpacity(0.6), blurRadius: 8)],
            ),
            child: ClipOval(
              child: Image.asset('assets/logo.png', fit: BoxFit.cover,
                errorBuilder: (c,e,s)=> const Icon(Icons.auto_awesome, size: 20)),
            ),
          ),
          const SizedBox(width: 10),
          const Text('Arjun Mastermind', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ]),
        actions: [
          IconButton(icon: const Icon(Icons.info_outline), onPressed: () => showAboutDialog(
            context: context,
            applicationName: 'Arjun Mastermind',
            children: const [Text('Your World. One App. - Arjun Mastermind\nAll services in one place')],
          )),
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A1931), Color(0xFF1A237E), Color(0xFF673AB7)],
                begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            child: Column(children: [
              Container(
                width: 220, height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFFFC107), width: 4),
                  boxShadow: [
                    BoxShadow(color: Color(0xFFFFC107).withOpacity(0.9), blurRadius: 30, spreadRadius: 2),
                    BoxShadow(color: Colors.blue.withOpacity(0.4), blurRadius: 40),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset('assets/logo.png', fit: BoxFit.cover,
                    errorBuilder: (c,e,s)=> Container(color: Colors.white, child: const Icon(Icons.auto_awesome, size: 50))),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Your World. One App.',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Games • Food • Fashion • Jobs • Movies • Travel • Books • News • Recharge',
                style: TextStyle(color: Colors.white70, fontSize: 11), textAlign: TextAlign.center),
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
          sliver: SliverToBoxAdapter(child: TextField(
            onChanged: (v) => setState(() => query = v.trim()),
            decoration: InputDecoration(
              hintText: 'Search services...',
              prefixIcon: const Icon(Icons.search),
              filled: true, fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
            ),
          )),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final service = shown[index];
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServicePage(service: service))),
                child: Card(
                  color: Colors.white, elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CircleAvatar(radius: 27, backgroundColor: brandPurple.withOpacity(.10),
                        child: Icon(service.icon, color: brandPurple, size: 29)),
                      const SizedBox(height: 12),
                      Text(service.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text('${service.links.length} links', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ]),
                  ),
                ),
              );
            }, childCount: shown.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.1),
          ),
        ),
      ]),
      bottomNavigationBar: const BannerAdWidget(),
    );
  }
}

class ServicePage extends StatelessWidget {
  final Service service;
  const ServicePage({super.key, required this.service});

  Future<void> openLink(BuildContext context, String url) async {
    try {
      final ok = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      if (!ok && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check your internet')));
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(service.title), backgroundColor: brandPurple, foregroundColor: Colors.white),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: brandPurple, borderRadius: BorderRadius.circular(22)),
        child: Row(children: [
          Icon(service.icon, size: 42, color: Colors.white),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(service.title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(service.subtitle, style: const TextStyle(color: Colors.white70)),
          ])),
        ]),
      ),
      const SizedBox(height: 18),
      for (final link in service.links)
        Card(
          color: Colors.white,
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.open_in_new)),
            title: Text(link.title, style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(link.description),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => openLink(context, link.url),
          ),
        ),
    ]),
    bottomNavigationBar: const BannerAdWidget(),
  );
}

// ===== ADMOB BANNER WIDGET =====
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});
  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // TEST ID - Real ID later maathanum
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isLoaded = true),
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          debugPrint('Ad failed: $err');
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded || _bannerAd == null) {
      return const SizedBox(height: 0);
    }
    return SafeArea(
      child: SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }
}
