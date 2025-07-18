import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'HYDROGROW: SMART\nSUSTAINABLE CROP\nCULTIVATION',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'At Hydrogrow, we believe in\nrevolutionizing agriculture\nthrough innovative, sustainable,\nand tech-driven solutions.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),

            const SizedBox(height: 10),
            Image.asset(
              'assets/images/appstore.png',
              width: 160,
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/googleplay.png',
              width: 160,
            ),

            // Phone Mockup
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/mockup.png',
              width: 180,
            ),

            Container(
              width: double.infinity,
              color: const Color(0xFF44AA79),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get personalized assistance from our team.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  Text('📧 hydrogrowhelp@gmail.com',
                      style: TextStyle(color: Colors.white)),
                  Text('📞 01-4225701', style: TextStyle(color: Colors.white)),
                  Text('www.facebook.com/hydrogrownepal',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
