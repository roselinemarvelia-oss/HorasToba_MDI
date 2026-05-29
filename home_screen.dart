import 'package:flutter/material.dart';
import '../user_data.dart';
import 'profile_screen.dart';
import 'explore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> allDestinations = [
    {
      "title": "Samosir Island",
      "location": "Lake Toba, North Sumatra",
      "image": "https://picsum.photos/500/300?1",
    },
    {
      "title": "Sipiso Piso",
      "location": "Karo Regency",
      "image": "https://picsum.photos/500/300?2",
    },
    {
      "title": "Tomok Village",
      "location": "Samosir Island",
      "image": "https://picsum.photos/500/300?3",
    },
    {
      "title": "Bukit Holbung",
      "location": "Samosir Regency",
      "image": "https://picsum.photos/500/300?4",
    },
    {
      "title": "Patung Tuhan Yesus Sibea Bea",
      "location": "Samosir Regency",
      "image": "https://picsum.photos/500/300?5",
    },
  ];

  List<Map<String, String>> filteredDestinations = [];

  @override
  void initState() {
    super.initState();

    filteredDestinations = allDestinations;
  }

  void searchDestination(String keyword) {
    setState(() {
      filteredDestinations = allDestinations.where((destination) {
        return destination["title"]!.toLowerCase().contains(
                  keyword.toLowerCase(),
                ) ||
            destination["location"]!.toLowerCase().contains(
                  keyword.toLowerCase(),
                );
      }).toList();
    });

    if (keyword.isNotEmpty && filteredDestinations.isNotEmpty) {
      Future.delayed(
        const Duration(
          milliseconds: 300,
        ),
        () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              final destination = filteredDestinations.first;

              return Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        destination["image"]!,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      destination["title"]!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      destination["location"]!,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Explore Destination",
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
  }

  void showAllDestinations() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "All Destinations",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: allDestinations.length,
                  itemBuilder: (context, index) {
                    final destination = allDestinations[index];

                    return Card(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            destination["image"]!,
                            width: 65,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          destination["title"]!,
                        ),
                        subtitle: Text(
                          destination["location"]!,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void categoryClicked(String category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "$category category selected",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F8FF),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "HorasToba",
          style: TextStyle(
            color: Color(0xFF0B5C9D),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
      ),
      backgroundColor: const Color(0xFFF4F8FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Horas! 👋",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          UserData.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // SEARCH
                Container(
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: searchController,
                    onSubmitted: searchDestination,
                    decoration: const InputDecoration(
                      hintText: "Search destination...",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        top: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // OPENING BANNER
                Container(
                  width: double.infinity,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://picsum.photos/900/700",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "History of Batak Land",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "The Batak land is rich in culture, tradition, and history. Located around Lake Toba in North Sumatra, Batak culture is known for its strong family values, traditional houses, ulos fabric, and unique customs passed down through generations.",
                          style: TextStyle(
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ExploreScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Explore Now",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // CATEGORY TITLE
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                // CATEGORIES
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryItem(
                      Icons.place,
                      "Destination",
                    ),
                    categoryItem(
                      Icons.restaurant,
                      "Culinary",
                    ),
                    categoryItem(
                      Icons.temple_buddhist,
                      "Culture",
                    ),
                    categoryItem(
                      Icons.directions_boat,
                      "Transport",
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // DESTINATION TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular Destinations",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: showAllDestinations,
                      child: const Text(
                        "See All",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // DESTINATION LIST
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredDestinations.length,
                    itemBuilder: (context, index) {
                      final destination = filteredDestinations[index];

                      return Container(
                        width: 220,
                        margin: const EdgeInsets.only(
                          right: 18,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                              child: Image.network(
                                destination["image"]!,
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    destination["title"]!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          destination["location"]!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 35),

                // LEARN BATAK
                const Text(
                  "Learn Batak Language",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                learnBatakCard(
                  "Horas",
                  "Hello / Greetings",
                ),

                learnBatakCard(
                  "Mauliate",
                  "Thank You",
                ),

                learnBatakCard(
                  "Ito",
                  "Brother / Sister / Friend",
                ),

                learnBatakCard(
                  "Amang",
                  "Father",
                ),

                learnBatakCard(
                  "Inang",
                  "Mother",
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItem(
    IconData icon,
    String title,
  ) {
    return GestureDetector(
      onTap: () {
        categoryClicked(title);
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }

  Widget learnBatakCard(
    String word,
    String meaning,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 14,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4FF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.translate,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  meaning,
                  style: const TextStyle(
                    color: Colors.grey,
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
