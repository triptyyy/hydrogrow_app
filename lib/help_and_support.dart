import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  @override
  _HelpSupportScreenState createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  List<bool> _isExpanded = [false, false, false, false];

  final faqItems = [
    {
      'question': 'How do I connect new sensors to my system?',
      'answer':
          'To connect new sensors, navigate to Settings > Add Sensor. Follow the step-by-step instructions on the screen which usually involve powering on the sensor, ensuring Bluetooth or Wi-Fi is enabled, and pairing the device with your system. Make sure your sensor is compatible and fully charged before starting.'
    },
    {
      'question': 'My crop data is not syncing. What should I do?',
      'answer':
          'If your crop data isn’t syncing, first check that your device has a stable internet connection. Try toggling Wi-Fi or mobile data off and on again. If the issue persists, restart both your device and the sensors. Also, ensure the app has necessary permissions and is updated to the latest version.'
    },
    {
      'question': 'How can I optimize irrigation schedules?',
      'answer':
          'You can optimize irrigation by using the smart scheduling feature found in Settings > Irrigation. This feature uses sensor data like soil moisture and weather forecasts to automatically adjust watering times and amounts, helping save water while ensuring your crops get the right moisture.'
    },
    {
      'question': 'What do the sensor readings mean?',
      'answer':
          'Sensor readings give you real-time data about your environment. For example, soil moisture indicates the water content in your soil, air temperature affects plant growth rates, humidity shows moisture in the air, and ambient light intensity influences photosynthesis. Tap on each reading for a detailed explanation and tips on ideal ranges.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: faqItems.length + 1,
        itemBuilder: (context, index) {
          if (index == faqItems.length) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(top: 30),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  children: [
                    const Icon(Icons.email_outlined,
                        color: Colors.red, size: 40),
                    const SizedBox(height: 12),
                    const Text(
                      'Contact Support',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Get personalized assistance from our team.'),
                    const SizedBox(height: 12),
                    Text(
                      'Phone no: 9861606528',
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final item = faqItems[index];
          final isOpen = _isExpanded[index];

          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isExpanded[index] = !isOpen;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item['question']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        AnimatedRotation(
                          turns: isOpen ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child:
                              const Icon(Icons.keyboard_arrow_down, size: 28),
                        ),
                      ],
                    ),
                  ),
                  if (isOpen)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 8, right: 8),
                      child: Text(
                        item['answer']!,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black87),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
