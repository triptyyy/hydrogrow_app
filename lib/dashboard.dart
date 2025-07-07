import 'package:flutter/material.dart';
import 'package:major_project/alerts.dart';
import 'package:major_project/lights.dart';
import 'package:major_project/settings.dart';
import 'package:major_project/login.dart';
import 'package:major_project/threshold.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPage = 0;
  bool showThresholdFromAlerts = false;

  late final List<Widget> _pages;

  final List<String> _titles = [
    'Dashboard',
    'Lights',
    'Alerts',
    'Settings',
    'Thresholds',
  ];

  @override
  void initState() {
    super.initState();

    _pages = [
      const DashboardContent(),
      const LightsPage(),
      // placeholder, actual content controlled dynamically
      const SizedBox.shrink(),
      const SettingsPage(),
      const ThresholdPage(),
    ];
  }

  Widget getPageForCurrentIndex() {
    if (currentPage == 2) {
      if (showThresholdFromAlerts) {
        return const ThresholdPage();
      } else {
        return AlertsPage(
          onNavigateToThreshold: () {
            setState(() {
              showThresholdFromAlerts = true;
              currentPage = 2;
            });
          },
        );
      }
    } else {
      showThresholdFromAlerts = false;
      return _pages[currentPage];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (currentPage == 2 && showThresholdFromAlerts)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    showThresholdFromAlerts = false;
                  });
                },
              )
            : Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
        title: Text(
          (currentPage == 2 && showThresholdFromAlerts)
              ? 'Thresholds'
              : _titles[currentPage],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(child: Text('Menu')),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                setState(() {
                  currentPage = 0;
                  showThresholdFromAlerts = false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Lights'),
              onTap: () {
                setState(() {
                  currentPage = 1;
                  showThresholdFromAlerts = false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Alerts'),
              trailing: const Icon(Icons.notifications_none),
              onTap: () {
                setState(() {
                  currentPage = 2;
                  showThresholdFromAlerts = false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  currentPage = 3;
                  showThresholdFromAlerts = false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
            ListTile(
              title: const Text('Configure Thresholds'),
              onTap: () {
                setState(() {
                  currentPage = 4;
                  showThresholdFromAlerts = false;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: getPageForCurrentIndex(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPage,
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
            showThresholdFromAlerts = false;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.light_mode), label: 'Lights'),
          NavigationDestination(icon: Icon(Icons.notifications_none), label: 'Alerts'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            children: [
              SizedBox(
                height: 420,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
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
                child: const Column(
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
