import 'package:flutter/material.dart';
import 'navigation_screen.dart';
import '../user_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                // LOGO
                Center(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3A7BFF),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.travel_explore,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // TITLE
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "HorasToba",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1B1B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Horas! Dison ma mula pardalananmu na dame.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // SIGN UP NAME
                if (!isLogin) ...[
                  const Text(
                    "Full Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  customField(
                    controller: nameController,
                    hint: "Enter your name",
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),
                ],

                // EMAIL
                const Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                customField(
                  controller: emailController,
                  hint: "Enter your email",
                  icon: Icons.email,
                ),

                const SizedBox(height: 20),

                // PASSWORD
                const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                customField(
                  controller: passwordController,
                  hint: "Enter your password",
                  icon: Icons.lock,
                  isPassword: true,
                ),

                const SizedBox(height: 35),

                // BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3A7BFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      if (!isLogin) {
                        UserData.name = nameController.text;
                      } else {
                        UserData.name = emailController.text.split("@").first;
                      }

                      UserData.email = emailController.text;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      isLogin ? "Sign In" : "Sign Up",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // SWITCH LOGIN / SIGNUP
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLogin
                            ? "Don't have an account?"
                            : "Already have an account?",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin ? "Sign Up" : "Sign In",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3A7BFF),
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
      ),
    );
  }

  Widget customField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Color(0xFF3A7BFF),
            width: 2,
          ),
        ),
      ),
    );
  }
}
