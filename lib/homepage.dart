import 'package:flutter/material.dart';
import 'package:skl_ui_app_1/chat.dart';
import 'package:skl_ui_app_1/chekout.dart';
import 'package:skl_ui_app_1/container.dart';
import 'package:skl_ui_app_1/detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.5); 

  List<Map<String, String>> products = [
    {
      'imageUrl': 'assets/ipong.jpg',
      'productName': 'Iphone 13 pro max',
      'price': 'Rp.20.000.000.000',
    },
    {
      'imageUrl': 'assets/iphone.jpg',
      'productName': 'Iphone 15 pro max',
      'price': 'Rp.26.000.000.000',
    },
    {
      'imageUrl': 'assets/tv.jpg',
      'productName': 'Google TV',
      'price': 'Rp.3.000.000.000',
    },
  ];

  int _currentIndex = 0;  // Variabel untuk menyimpan state tombol navigasi yang aktif

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,  // Set background color to dark
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),  // Tinggi app bar
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.white),
          actions: [
            IconButton(
              icon: Icon(Icons.message, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => ChatPage(),));
              },
            ),
          ],
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30.0),  // Menurunkan app bar
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'GadgetHub',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[900],  // Set accent color to yellow
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryTab(text: 'Electronic', isSelected: true),
                CategoryTab(text: 'Shoe'),
                CategoryTab(text: 'Sports'),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                    }
                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: ProductCard(
                          imageUrl: products[index]['imageUrl']!,
                          productName: products[index]['productName']!,
                          price: products[index]['price']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            height: 100,  // Tambahkan height untuk memberi ruang vertikal lebih banyak
            child: BottomNavigationBar(
              backgroundColor: Colors.yellow[900],
              items: [
                BottomNavigationBarItem(
                  icon: Center(child: Icon(Icons.home, color: Colors.white, size: 50)),  // Posisikan ikon di tengah
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Center(child: Icon(Icons.search, color: Colors.white, size: 50)),  // Posisikan ikon di tengah
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Center(child: Icon(Icons.shop_2, color: Colors.white, size: 50)),  // Posisikan ikon di tengah
                  label: '',
                ),
              ],
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                if (index == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContainerPage()));  // Pindah ke halaman ContainerPage
                } else if (index == 2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChekoutPage()));  // Pindah ke halaman ChekoutPage
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  CategoryTab({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        backgroundColor: isSelected ? Colors.yellow[900] : Colors.grey[300],
        label: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;

  ProductCard({required this.imageUrl, required this.productName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 450,  // Disesuaikan untuk menghindari kesan terlalu lebar
        height: 450,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                productName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                price,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow[900],
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => DetailPage(),));
            }, child: Text('')),
          ],
        ),
      ),
    );
  }
}
