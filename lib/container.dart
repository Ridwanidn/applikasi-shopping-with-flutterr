import 'package:flutter/material.dart';
import 'package:skl_ui_app_1/chekout.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Atur tinggi AppBar sesuai kebutuhan
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow[900], // Warna background AppBar
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), // Radius untuk kiri bawah
              bottomRight: Radius.circular(30), // Radius untuk kanan bawah
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Set background transparan agar warna dari Container digunakan
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white), // Ikon kembali
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Men Shoes',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white), // Tambahkan ikon keranjang
                onPressed: () {
                  // Aksi ketika ikon keranjang ditekan
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: shoesData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.65, // Sesuaikan childAspectRatio agar lebih tinggi
          ),
          itemBuilder: (context, index) {
            return ShoeCard(shoe: shoesData[index]);
          },
        ),
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  const ShoeCard({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  shoe.image,
                  height: 160, // Tinggikan gambar agar lebih terlihat
                  width: double.infinity,
                  fit: BoxFit.contain, // Mengubah dari cover menjadi contain agar gambar tidak terpotong
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Icon(
                  shoe.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: shoe.isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${shoe.price}',
                  style: TextStyle(
                    color: shoe.isDiscounted ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                if (shoe.isDiscounted)
                  Text(
                    '\$${shoe.oldPrice}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                SizedBox(height: 15),
                // Tambahkan tombol di dalam container
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChekoutPage(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[900],  // Warna tombol oranye
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Shoe {
  final String name;
  final String image;
  final double price;
  final double? oldPrice;
  final bool isFavorite;
  final bool isDiscounted;

  Shoe({
    required this.name,
    required this.image,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
    this.isDiscounted = false,
  });
}

final shoesData = [
  Shoe(
    name: 'NMD_R1 Shoes',
    image: 'assets/tv.jpg',
    price: 180.00,
    isFavorite: true,
  ),
  Shoe(
    name: 'NMD_R1 V2 Shoes',
    image: 'assets/ipong.jpg',
    price: 120.00,
  ),
  Shoe(
    name: 'Kaptir Shoes',
    image: 'assets/iphone.jpg',
    price: 90.00,
    oldPrice: 100.00,
    isDiscounted: true,
  ),
  Shoe(
    name: 'Ultraboost 20 Shoes',
    image: 'assets/tv.jpg',
    price: 180.00,
  ),
  Shoe(
    name: 'Ultraboost DNA Shoes',
    image: 'assets/ipong.jpg',
    price: 180.00,
  ),
  Shoe(
    name: 'Ultraboost 10 Shoes',
    image: 'assets/tv.jpg',
    price: 180.00,
  ),
];
