import 'package:flutter/material.dart';
import 'login.dart'; // ✅ Import the login page

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back arrow and title
                Row(
                  children: [
                    IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  ),
                    const SizedBox(width: 16),
                    const Text("Sign Up", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 30),

                // Heading
                const Center(
                  child: Column(
                    children: [
                      Text("Join HydroGrow", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("Start cultivating your smart garden today.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Full Name
                const Text("Full Name"),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline, color: Colors.green),
                    hintText: "Enter your full name",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // Email Address
                const Text("Email Address"),
                const SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.green),
                    hintText: "@example.com",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // Password
                const Text("Password"),
                const SizedBox(height: 8),
                TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.green),
                    hintText: "Minimum 8 characters",
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // Confirm Password
                const Text("Confirm Password"),
                const SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Re-enter your password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _agreed,
                      onChanged: (val) => setState(() => _agreed = val!),
                    ),
                    const Flexible(
                      child: Text.rich(
                        TextSpan(
                          text: "I agree to HydroGrow's ",
                          children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // Handle sign-up logic
                    },
                    child: const Text("Sign Up", style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),

                // Already have an account?
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );
                        },
                        child: const Text("Login", style: TextStyle(color: Colors.green)),
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
}
