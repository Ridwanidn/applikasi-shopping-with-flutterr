import 'package:flutter/material.dart';

class ChekoutPage extends StatelessWidget {
  const ChekoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Column(
        children: [
          // AppBar with rounded bottom edges
          Container(
            margin: const EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              color: Colors.yellow[900],
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: AppBar(
              title: const Text(
                'Chekout',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 20), // Increased vertical margin
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/iphone.jpg',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Product Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '\$100',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                color: Colors.yellow[900],
                                onPressed: () {},
                              ),
                              const Text('1'),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                color: Colors.yellow[900],
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Bottom navigation container with increased size and spacing
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              color: Colors.yellow[900],
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0), // Increased vertical and horizontal padding
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 20, // Increased font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '\$300',
                          style: TextStyle(
                            fontSize: 20, // Increased font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30), // Increased spacing between total and button
                  // Checkout button styled as before
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0), // Increased spacing around the button
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(24.0), // Increased padding for the button
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 22, // Increased font size
                            fontWeight: FontWeight.bold, // Made text bold
                            color: Color.fromARGB(255, 255, 132, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
