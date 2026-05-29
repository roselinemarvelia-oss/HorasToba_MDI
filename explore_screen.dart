import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int selectedTab = 0;

  final List<String> tabs = [
    "Destination",
    "Culinary",
    "Culture",
    "Transport",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F8FC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "HorasToba",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Explore & Heritage",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // TAB MENU
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                itemBuilder: (context, index) {
                  final isSelected = selectedTab == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 12,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    if (selectedTab == 0)
                      Column(
                        children: [
                          destinationCard(
                            context,
                            "Samosir Island",
                            "The spiritual heart of Lake Toba.",
                            "https://picsum.photos/500/300?1",
                            "Samosir Island is one of the most famous tourism destinations in North Sumatra. Located in the middle of Lake Toba, this island offers beautiful landscapes, Batak culture, traditional villages, and historical sites.",
                          ),
                          destinationCard(
                            context,
                            "Bukit Holbung",
                            "Beautiful green hill panorama.",
                            "https://picsum.photos/500/300?2",
                            "Bukit Holbung is known for its rolling green hills and breathtaking views overlooking Lake Toba. It is one of the best places to enjoy sunrise and nature photography.",
                          ),
                          destinationCard(
                            context,
                            "Sipiso-piso Waterfall",
                            "One of Indonesia's tallest waterfalls.",
                            "https://picsum.photos/500/300?3",
                            "Sipiso-piso Waterfall is a stunning waterfall located near Lake Toba. The waterfall drops dramatically into a deep gorge surrounded by lush greenery.",
                          ),
                        ],
                      ),
                    if (selectedTab == 1)
                      Column(
                        children: [
                          foodCard(
                            "Arsik",
                            "Traditional Batak fish cuisine",
                            "https://picsum.photos/500/300?4",
                          ),
                          foodCard(
                            "Naniura",
                            "Raw fish with Batak spices",
                            "https://picsum.photos/500/300?5",
                          ),
                          foodCard(
                            "Saksang",
                            "Traditional Batak ceremonial dish",
                            "https://picsum.photos/500/300?6",
                          ),
                        ],
                      ),
                    if (selectedTab == 2)
                      Column(
                        children: [
                          languageCard(
                            "Horas",
                            "Hello / Welcome",
                          ),
                          languageCard(
                            "Mauliate",
                            "Thank you",
                          ),
                          languageCard(
                            "Mangan hamu?",
                            "Have you eaten?",
                          ),
                          languageCard(
                            "Ito",
                            "Friend / sibling",
                          ),
                        ],
                      ),
                    if (selectedTab == 3)
                      Column(
                        children: [
                          transportCard(
                            "Speedboat Rental",
                            "Fast transportation across Lake Toba",
                            "Rp 250.000 / trip",
                          ),
                          transportCard(
                            "Private Boat Tour",
                            "Enjoy lake exploration",
                            "Rp 500.000 / trip",
                          ),
                        ],
                      ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // DESTINATION CARD
  Widget destinationCard(
    BuildContext context,
    String title,
    String subtitle,
    String image,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                child: Image.network(
                  image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Destination",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF04558A),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 22),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationDetailScreen(
                          title: title,
                          image: image,
                          description: description,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Text(
                        "View More",
                        style: TextStyle(
                          color: Color(0xFF04558A),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF04558A),
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

  Widget foodCard(
    String title,
    String subtitle,
    String image,
  ) {
    return destinationCard(
      context,
      title,
      subtitle,
      image,
      subtitle,
    );
  }

  Widget languageCard(
    String word,
    String meaning,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
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
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.language,
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
                const SizedBox(height: 4),
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

  Widget transportCard(
    String title,
    String subtitle,
    String price,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.all(20),
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
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF4FF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.directions_boat,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Book",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// DETAIL PAGE
class DestinationDetailScreen extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const DestinationDetailScreen({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    image,
                    height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF04558A),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.7,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF04558A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Explore Destination",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
