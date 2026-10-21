// MOVIE WITH 38 DISTRICTS - FULL BOOKING SHEET
class MovieHubPage extends StatefulWidget {
  @override
  _MovieHubPageState createState() => _MovieHubPageState();
}

class _MovieHubPageState extends State<MovieHubPage> {
  String selectedDistrict = 'Chennai';

  List<String> districts = [
    'Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode',
    'Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai',
    'Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet',
    'Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli',
    'Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'
  ];

  List<String> getTheaters(String district) {
    if (district == 'Chennai') return ['Sathyam Cinemas - Royapettah','PVR VR Mall - Anna Nagar','INOX Citi Center','Rohini Silver Screens - Koyambedu'];
    if (district == 'Coimbatore') return ['KG Cinemas - RS Puram','INOX Prozone Mall','The Cinema - Brookefields','Broadway Cinemas'];
    if (district == 'Madurai') return ['Vetri Cinemas','INOX Visal Mall','Thangam Cinemas','Sundar Theater'];
    if (district == 'Salem') return ['ARRS Multiplex','Kailash Prakash','Royal Cinemas - 5 Roads','Big Cinemas Salem'];
    return ['$district Sathyam Cinemas','PVR $district - Main Road','INOX $district - Bus Stand','Arjun Multiplex - $district','City $district Talkies'];
  }

  List<Map<String, dynamic>> movies = [
    {'title': 'Leo 2','rating': '4.5','type': 'Action','price': 180,'color': Colors.red},
    {'title': 'Vikram Returns','rating': '4.7','type': 'Thriller','price': 200,'color': Colors.black},
    {'title': 'Jailer 2','rating': '4.6','type': 'Comedy','price': 190,'color': Colors.orange},
    {'title': 'PS 3','rating': '4.8','type': 'Historical','price': 220,'color': Colors.brown},
    {'title': 'Thunivu 2','rating': '4.4','type': 'Action','price': 170,'color': Colors.blue},
    {'title': 'KGF 3','rating': '4.9','type': 'Action','price': 250,'color': Colors.amber},
    {'title': 'Avatar 3','rating': '4.6','type': 'Sci-Fi','price': 300,'color': Colors.teal},
  ];

  void openBooking(Map<String, dynamic> movie) {
    List<String> theaters = getTheaters(selectedDistrict);
    String selectedTheater = theaters[0];
    String selectedTime = '7:00 PM';
    List<String> times = ['10:00 AM','1:30 PM','4:00 PM','7:00 PM','10:00 PM'];
    List<int> selectedSeats = [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Color(0xFF1F1F1F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(
          builder: (ctx, setSheet) {
            return Container(
              padding: EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10))),
                    SizedBox(height: 12),
                    Text('${movie['title']} - $selectedDistrict', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('${movie['rating']} * ${movie['type']} - Rs.${movie['price']}', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 16),
                    Align(alignment: Alignment.centerLeft, child: Text('Select Theater in $selectedDistrict', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedTheater,
                          isExpanded: true,
                          dropdownColor: Color(0xFF2A2A2A),
                          style: TextStyle(color: Colors.white, fontSize: 13),
                          items: theaters.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                          onChanged: (v) { setSheet(() { selectedTheater = v!; }); },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(alignment: Alignment.centerLeft, child: Text('Select Show Time', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: times.map((t) => ChoiceChip(
                        label: Text(t, style: TextStyle(fontSize: 12)),
                        selected: selectedTime == t,
                        selectedColor: Color(0xFFE50914),
                        labelStyle: TextStyle(color: selectedTime == t ? Colors.white : Colors.black),
                        onSelected: (v) { setSheet(() { selectedTime = t; }); },
                      )).toList(),
                    ),
                    SizedBox(height: 16),
                    Align(alignment: Alignment.centerLeft, child: Text('Select Seats - Rs.${movie['price']} each', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    SizedBox(height: 8),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8, crossAxisSpacing: 6, mainAxisSpacing: 6),
                      itemCount: 40,
                      itemBuilder: (c, idx) {
                        bool sel = selectedSeats.contains(idx);
                        return GestureDetector(
                          onTap: () {
                            setSheet(() {
                              if (sel) selectedSeats.remove(idx);
                              else selectedSeats.add(idx);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(color: sel ? Color(0xFFE50914) : Colors.grey.shade300, borderRadius: BorderRadius.circular(4)),
                            child: Icon(Icons.chair, size: 16, color: sel ? Colors.white : Colors.black54),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    Text('SCREEN THIS WAY', style: TextStyle(color: Colors.grey, fontSize: 10, letterSpacing: 2)),
                    Container(height: 3, margin: EdgeInsets.symmetric(vertical: 6), decoration: BoxDecoration(color: Color(0xFFE50914), borderRadius: BorderRadius.circular(2))),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${selectedSeats.length} Seats selected', style: TextStyle(color: Colors.white)),
                        Text('Total: Rs.${selectedSeats.length * (movie['price'] as int)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE50914), padding: EdgeInsets.all(16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        onPressed: selectedSeats.isEmpty ? null : () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('SUCCESS! ${movie['title']} booked at $selectedTheater, $selectedTime, $selectedDistrict - ${selectedSeats.length} tickets - Rs.${selectedSeats.length * (movie['price'] as int)}'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 4),
                          ));
                        },
                        child: Text(selectedSeats.isEmpty ? 'SELECT SEATS' : 'PAY Rs.${selectedSeats.length * (movie['price'] as int)} & BOOK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> theaters = getTheaters(selectedDistrict);
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      appBar: AppBar(title: Text('Movies - $selectedDistrict'), backgroundColor: Color(0xFFE50914), foregroundColor: Colors.white),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.location_city, color: Colors.red, size: 20),
                SizedBox(width: 6),
                Text('City:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedDistrict,
                      isExpanded: true,
                      items: districts.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                      onChanged: (val) {
                        if (val != null) setState(() { selectedDistrict = val; });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                  child: Text('${theaters.length} Theaters', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: movies.length,
              itemBuilder: (c, i) {
                var m = movies[i];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  color: Color(0xFF1F1F1F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Container(width: 60, height: 80, decoration: BoxDecoration(color: (m['color'] as Color).withOpacity(0.3), borderRadius: BorderRadius.circular(8)), child: Icon(Icons.movie, size: 30, color: m['color'] as Color)),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(m['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                              SizedBox(height: 4),
                              Text('${m['rating']} * ${m['type']} - Rs.${m['price']} - $selectedDistrict - ${theaters.length} theaters', style: TextStyle(color: Colors.grey, fontSize: 11)),
                              SizedBox(height: 4),
                              Text('Theaters: ${theaters[0]}', style: TextStyle(color: Colors.white54, fontSize: 9), maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE50914), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          onPressed: () { openBooking(m); },
                          child: Text('Book', style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
