import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const ArjunMastermindApp());
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
    ServiceLink('Browser games', 'https://www.google.com/search?q=free+browser+games', 'Find browser games.'),
    ServiceLink('Puzzle games', 'https://www.google.com/search?q=free+online+puzzle+games', 'Find puzzle games.'),
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
    ServiceLink('JustWatch India', 'https://www.justwatch.com/in', 'Find legal streaming options.'),
    ServiceLink('BookMyShow', 'https://in.bookmyshow.com/', 'Explore cinema listings and tickets.'),
    ServiceLink('Tamil movies', 'https://www.google.com/search?q=Tamil+movies+official+streaming', 'Find official streaming options.'),
    ServiceLink('Malayalam movies', 'https://www.google.com/search?q=Malayalam+movies+official+streaming', 'Find official streaming options.'),
    ServiceLink('Hindi movies', 'https://www.google.com/search?q=Hindi+movies+official+streaming', 'Find official streaming options.'),
    ServiceLink('Hollywood movies', 'https://www.google.com/search?q=Hollywood+movies+official+streaming+India', 'Find official streaming options.'),
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
    ServiceLink('Airtel', 'https://www.airtel.in/recharge', 'Open Airtel recharge.'),
    ServiceLink('Jio', 'https://www.jio.com/selfcare/recharge/mobility/', 'Open Jio recharge.'),
    ServiceLink('Vi', 'https://www.myvi.in/', 'Open Vi services.'),
    ServiceLink('Bharat BillPay', 'https://www.google.com/search?q=official+Bharat+BillPay', 'Find official bill-payment options.'),
  ]),
];

class ArjunMastermindApp extends StatelessWidget {
  const ArjunMastermindApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Arjun Mastermind',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: brandPurple),
      scaffoldBackgroundColor: pageBg, useMaterial3: true),
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
      s.subtitle.toLowerCase().contains(query.toLowerCase()) ||
      s.links.any((l) => l.title.toLowerCase().contains(query.toLowerCase()))).toList();
    return Scaffold(
      appBar: AppBar(backgroundColor: brandPurple, foregroundColor: Colors.white,
        title: const Text('Arjun Mastermind', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.info_outline), onPressed: () => showAboutDialog(
          context: context, applicationName: 'Arjun Mastermind',
          children: const [Text('This starter opens service websites. External providers manage their own accounts, terms and payments.')]))]),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Container(width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 22),
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [brandPurple, Color(0xFF9575CD)]),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(28))),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(Icons.auto_awesome, color: Colors.white, size: 42), SizedBox(height: 12),
            Text('Your World. One App.', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 6), Text('Games • Shopping • Jobs • Movies • Travel • News', style: TextStyle(color: Colors.white70)),
          ]))),
        SliverPadding(padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
          sliver: SliverToBoxAdapter(child: TextField(onChanged: (v) => setState(() => query = v.trim()),
            decoration: InputDecoration(hintText: 'Search services...', prefixIcon: const Icon(Icons.search),
              filled: true, fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none))))),
        SliverPadding(padding: const EdgeInsets.all(14), sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            final service = shown[index];
            return InkWell(borderRadius: BorderRadius.circular(20),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServicePage(service: service))),
              child: Card(color: Colors.white, elevation: 1, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(padding: const EdgeInsets.all(12), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(radius: 27, backgroundColor: brandPurple.withOpacity(.10),
                    child: Icon(service.icon, color: brandPurple, size: 29)),
                  const SizedBox(height: 12),
                  Text(service.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 5), Text('${service.links.length} links', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                ]))),
            );
          }, childCount: shown.length),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.02))),
        const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(20, 4, 20, 24),
          child: Text('Note: Orders, bookings, recharge, live data, payments and ad earnings need approved providers and integrations. This starter does not collect payments or guarantee earnings.',
            style: TextStyle(fontSize: 12, color: Colors.black54)))),
      ]),
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
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open this link. Try again.')));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check your internet connection and try again.')));
      }
    }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(service.title), backgroundColor: brandPurple, foregroundColor: Colors.white),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: brandPurple, borderRadius: BorderRadius.circular(22)),
        child: Row(children: [Icon(service.icon, size: 42, color: Colors.white), const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(service.title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5), Text(service.subtitle, style: const TextStyle(color: Colors.white70)),
          ]))])),
      const SizedBox(height: 18),
      for (final link in service.links) Card(color: Colors.white, child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.open_in_new)),
        title: Text(link.title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(link.description), trailing: const Icon(Icons.chevron_right),
        onTap: () => openLink(context, link.url))),
    ]),
  );
}
