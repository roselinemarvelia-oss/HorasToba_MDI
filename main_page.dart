import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // NAVBAR
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "HorasSamosir",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F4C81),
                  ),
                ),
                Row(
                  children: const [
                    Text("Home"),
                    SizedBox(width: 20),
                    Text("Destinations"),
                    SizedBox(width: 20),
                    Text("Culinary"),
                    SizedBox(width: 20),
                    Text("Transport"),
                    SizedBox(width: 20),
                    Text("Reviews"),
                  ],
                ),
              ],
            ),
          ),

          // HERO SECTION
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/hero_lake.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.3),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Explore the Magic of Lake Toba",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Discover the beauty and culture of Samosir Island",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
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
