import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? selectedLevel;

  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;

  bool showResult = false;

  DateTime? startTime;

  Duration quizDuration = Duration.zero;

  final Map<String, List<Map<String, dynamic>>> quizzes = {
    "Easy": [
      {
        "question": "Pulau yang berada di tengah Danau Toba adalah?",
        "options": ["Nias", "Samosir", "Bintan", "Belitung"],
        "answer": 1,
      },
      {
        "question": "Danau Toba berada di provinsi?",
        "options": ["Aceh", "Riau", "Sumatera Utara", "Jambi"],
        "answer": 2,
      },
      {
        "question": "Apa salam khas masyarakat Batak?",
        "options": ["Halo", "Horas", "Permisi", "Salam"],
        "answer": 1,
      },
      {
        "question": "Danau Toba terkenal sebagai danau apa?",
        "options": ["Buatan", "Vulkanik", "Payau", "Karst"],
        "answer": 1,
      },
      {
        "question": "Kota yang menjadi pintu gerbang menuju Danau Toba adalah?",
        "options": ["Medan", "Pekanbaru", "Padang", "Banda Aceh"],
        "answer": 0,
      },
      {
        "question": "Apa nama kain tradisional Batak?",
        "options": ["Songket", "Ulos", "Batik", "Tenun"],
        "answer": 1,
      },
      {
        "question": "Apa nama desa wisata terkenal di Samosir?",
        "options": ["Tomok", "Ubud", "Kuta", "Bromo"],
        "answer": 0,
      },
      {
        "question": "Apa makanan khas Batak dari ikan mas?",
        "options": ["Rendang", "Arsik", "Gudeg", "Pempek"],
        "answer": 1,
      },
      {
        "question": "Apa nama salam khas Batak?",
        "options": ["Horas", "Halo", "Hai", "Permisi"],
        "answer": 0,
      },
      {
        "question": "Danau Toba termasuk danau?",
        "options": ["Buatan", "Vulkanik", "Asin", "Payau"],
        "answer": 1,
      },
    ],
    "Medium": [
      {
        "question": "Apa nama rumah adat Batak Toba?",
        "options": ["Joglo", "Rumah Gadang", "Rumah Bolon", "Limas"],
        "answer": 2,
      },
      {
        "question": "Apa nama kain tradisional Batak?",
        "options": ["Songket", "Ulos", "Batik", "Tenun Ikat"],
        "answer": 1,
      },
      {
        "question": "Apa makanan khas Batak dari ikan mas?",
        "options": ["Pempek", "Gudeg", "Arsik", "Rawon"],
        "answer": 2,
      },
      {
        "question": "Apa alat musik tradisional Batak?",
        "options": ["Sasando", "Taganing", "Angklung", "Kolintang"],
        "answer": 1,
      },
      {
        "question": "Apa nama makam raja yang terkenal di Tomok?",
        "options": [
          "Raja Sidabutar",
          "Raja Batak",
          "Raja Uti",
          "Raja Sisingamangaraja"
        ],
        "answer": 0,
      },
      {
        "question": "Apa nama tarian tradisional Batak?",
        "options": ["Tortor", "Jaipong", "Saman", "Kecak"],
        "answer": 0,
      },
      {
        "question": "Apa fungsi Ulos dalam budaya Batak?",
        "options": ["Mainan", "Hadiah adat", "Dekorasi", "Peralatan"],
        "answer": 1,
      },
      {
        "question": "Apa nama kursi batu terkenal di Samosir?",
        "options": [
          "Kursi Batu Siallagan",
          "Batu Raja",
          "Batu Karang",
          "Batu Hitam"
        ],
        "answer": 0,
      },
      {
        "question": "Apa nama alat musik tradisional Batak?",
        "options": ["Taganing", "Angklung", "Kolintang", "Sasando"],
        "answer": 0,
      },
      {
        "question": "Apa nama rumah adat Batak?",
        "options": ["Rumah Gadang", "Joglo", "Rumah Bolon", "Limas"],
        "answer": 2,
      },
    ],
    "Hard": [
      {
        "question": "Apa arti kata 'Mauliate' dalam bahasa Batak?",
        "options": ["Selamat pagi", "Terima kasih", "Permisi", "Sampai jumpa"],
        "answer": 1,
      },
      {
        "question": "Apa arti kata 'Horas'?",
        "options": [
          "Selamat malam",
          "Salam sehat dan sejahtera",
          "Permisi",
          "Terima kasih"
        ],
        "answer": 1,
      },
      {
        "question": "Apa arti kata 'Ito' dalam bahasa Batak?",
        "options": ["Saudara/Kawan", "Ayah", "Kakek", "Paman"],
        "answer": 0,
      },
      {
        "question": "Siapa tokoh pahlawan nasional dari tanah Batak?",
        "options": [
          "Diponegoro",
          "Sisingamangaraja XII",
          "Pattimura",
          "Cut Nyak Dien"
        ],
        "answer": 1,
      },
      {
        "question": "Apa nama sistem kekerabatan masyarakat Batak?",
        "options": [
          "Dalihan Na Tolu",
          "Pancasila",
          "Tri Hita Karana",
          "Sapta Pesona"
        ],
        "answer": 0,
      },
      {
        "question": "Apa arti kata 'Amang'?",
        "options": ["Ayah", "Ibu", "Paman", "Saudara"],
        "answer": 0,
      },
      {
        "question": "Apa arti kata 'Inang'?",
        "options": ["Kakek", "Ayah", "Ibu", "Teman"],
        "answer": 2,
      },
      {
        "question": "Apa nama aksara tradisional Batak?",
        "options": [
          "Aksara Batak",
          "Aksara Jawa",
          "Aksara Bali",
          "Aksara Sunda"
        ],
        "answer": 0,
      },
      {
        "question": "Apa arti Dalihan Na Tolu?",
        "options": [
          "Tiga Tungku Kehidupan",
          "Tiga Raja",
          "Tiga Gunung",
          "Tiga Danau"
        ],
        "answer": 0,
      },
      {
        "question": "Gunung yang membentuk Danau Toba adalah?",
        "options": ["Kerinci", "Toba Purba", "Sinabung", "Semeru"],
        "answer": 1,
      },
    ],
  };

  void nextQuestion() {
    if (selectedAnswer == null) return;

    if (selectedAnswer == quizzes[selectedLevel]![currentQuestion]["answer"]) {
      score++;
    }

    if (currentQuestion < quizzes[selectedLevel]!.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    } else {
      setState(() {
        quizDuration = DateTime.now().difference(
          startTime!,
        );

        showResult = true;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      selectedLevel = null;

      currentQuestion = 0;

      score = 0;

      selectedAnswer = null;

      showResult = false;

      quizDuration = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selectedLevel == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F7F7),
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
          title: const Text(
            "HorasToba",
            style: TextStyle(
              color: Color(0xFF0B5C9D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Knowledge\nQuizzes",
                    style: TextStyle(
                      fontSize: 42,
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B5C9D),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Test your heritage wisdom and uncover the secrets of the Batak lands.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 35),
                  quizLevelCard(
                    title: "Easy Level",
                    subtitle: "Perfect for beginners learning Batak culture.",
                    level: "Easy",
                    icon: Icons.lightbulb_outline,
                  ),
                  const SizedBox(height: 20),
                  quizLevelCard(
                    title: "Medium Level",
                    subtitle: "Challenge your Batak culture knowledge.",
                    level: "Medium",
                    icon: Icons.menu_book_outlined,
                  ),
                  const SizedBox(height: 20),
                  quizLevelCard(
                    title: "Hard Level",
                    subtitle:
                        "Only true Batak culture masters can finish this.",
                    level: "Hard",
                    icon: Icons.emoji_events_outlined,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (showResult) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F7F7),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.emoji_events,
                    size: 65,
                    color: Color(0xFF0B5C9D),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Quiz Completed",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "$score / ${quizzes[selectedLevel]!.length}",
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B5C9D),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Time: ${formatDuration(quizDuration)}",
                ),
                const SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B5C9D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: resetQuiz,
                    child: const Text(
                      "Play Again",
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back to Home",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final quiz = quizzes[selectedLevel]!;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              selectedLevel = null;

              currentQuestion = 0;

              selectedAnswer = null;

              score = 0;
            });
          },
        ),
        title: const Text(
          "HORAS TOBA QUIZ",
          style: TextStyle(
            color: Color(0xFF0B5C9D),
            fontSize: 13,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestion + 1} of ${quiz.length}",
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: (currentQuestion + 1) / quiz.length,
              backgroundColor: Colors.grey[300],
              color: const Color(0xFF0B5C9D),
            ),
            const SizedBox(height: 40),
            Text(
              quiz[currentQuestion]["question"],
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 35),
            ...List.generate(
              quiz[currentQuestion]["options"].length,
              (index) {
                String optionLetter = String.fromCharCode(
                  65 + index,
                );

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAnswer = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 18,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: selectedAnswer == index
                            ? const Color(0xFF0B5C9D)
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              optionLetter,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            quiz[currentQuestion]["options"][index],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B5C9D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: nextQuestion,
                child: Text(
                  currentQuestion == quiz.length - 1
                      ? "Finish Quiz"
                      : "Next Question",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quizLevelCard({
    required String title,
    required String subtitle,
    required String level,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLevel = level;

          startTime = DateTime.now();
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
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
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3FF),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF0B5C9D),
                size: 32,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0B5C9D),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "10 Questions",
                ),
                Text(
                  level,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B5C9D),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDuration(
    Duration duration,
  ) {
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');

    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return "$minutes:$seconds";
  }
}
