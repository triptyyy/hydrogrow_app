import 'package:flutter/material.dart';
import 'package:major_project/login.dart';

Widget myRoundedBox({required IconData icon, required String label}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade300),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 32, color: Colors.green),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dash"), 
      ),
      backgroundColor: const Color(0xFFF5F6FA),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            children: [
              SizedBox(
                height: 420, // fixed height to contain GridView
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(), // disable GridView's own scrolling
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    myRoundedBox(icon: Icons.water_drop_outlined, label: "Soil Moisture"),
                    myRoundedBox(icon: Icons.thermostat_outlined, label: "Air Temperature"),
                    myRoundedBox(icon: Icons.air_outlined, label: "Air Humidity"),
                    myRoundedBox(icon: Icons.light_mode_outlined, label: "Ambient Light Intensity"),
                  ],
                ),
              ),

              //soil moisture trends
              const SizedBox(height: 12),
              Container(
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Center(
                  child: Text(
                    "Soil Moisture Trends (24h)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Device status",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
                    },
                    child: Text("View Details"),
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

void main() {
  runApp(const MaterialApp(
    home: Dashboard(),
  ));
}
