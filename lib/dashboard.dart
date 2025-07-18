import 'package:flutter/material.dart';
import 'package:major_project/alerts.dart';
import 'package:major_project/lights.dart';
import 'package:major_project/settings.dart';
import 'package:major_project/login.dart';
import 'package:major_project/threshold.dart';
import 'package:major_project/profile.dart';
import 'help_and_Support.dart';
import 'aboutpage.dart';
import 'deviceinfo.dart';

class Dashboard extends StatefulWidget {
  
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPage = 0;
  bool showThresholdFromAlerts = false;
  bool showProfileFromSettings = false;
  bool showHelpFromSettings = false;
  bool showAboutPage = false;
  bool showDeviceInfoPage = false;

  late final List<Widget> _pages;

  final List<String> _titles = [
    'Dashboard',
    'Lights',
    'Alerts',
    'Settings',
    'Configure Thresholds',
    'Profile',
    'Help and Support',
  ];

  @override
  void initState() {
    super.initState();

    _pages = [
       DashboardContent(
        onViewDetails: (){
          setState((){
            showDeviceInfoPage=true;
            currentPage = 0;
          });
        },
      ),
      const LightsPage(),
      const SizedBox.shrink(),
      SettingsPage(onNavigateToProfile: () {
        setState(() {
          currentPage = 5;
          showProfileFromSettings = true;
          showHelpFromSettings = false;
        });
      }, onNavigateToAlerts: () {
        setState(() {
          currentPage = 2;
          showThresholdFromAlerts = false;
        });
      }, onNavigateToHelp: () {
        setState(() {
          currentPage = 6;
          showHelpFromSettings = true;
          showProfileFromSettings = false;
        });
      }, onNavigateToAbout: () {
        setState(() {
          showAboutPage = true;
        });
      }, onNavigateToThreshold: () {
        setState(() {
          currentPage = 4;
          showThresholdFromAlerts = false;
        });
      }, onNavigateToDeviceInfo: () {
        setState(() {
          showDeviceInfoPage = true;
        });
      }),
      const ThresholdPage(),
      const ProfilePage(),
      HelpSupportScreen(),
    ];
  }

  Widget getPageForCurrentIndex() {
    if (showDeviceInfoPage) {
      return DeviceInfoPage();
    }
    if (showAboutPage) {
      return const AboutPage();
    }
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
    } else if (currentPage == 3) {
      if (showProfileFromSettings) {
        return const ProfilePage();
      } else if (showHelpFromSettings) {
        return HelpSupportScreen();
      } else {
        return SettingsPage(
          onNavigateToAlerts: () {
            setState(() {
              currentPage = 2;
              showThresholdFromAlerts = false;
            });
          },
          onNavigateToProfile: () {
            setState(() {
              currentPage = 5;
              showProfileFromSettings = true;
              showHelpFromSettings = false;
            });
          },
          onNavigateToHelp: () {
            setState(() {
              currentPage = 6;
              showHelpFromSettings = true;
              showProfileFromSettings = false;
            });
          },
          onNavigateToAbout: () {
            setState(() {
              showAboutPage = true;
            });
          },
          onNavigateToDeviceInfo: () {
            setState(() {
              showDeviceInfoPage = true;

              currentPage = 3;
            });
          },
          onNavigateToThreshold: () {
            setState(() {
              currentPage = 4; // Navigate to Threshold Page index
              showThresholdFromAlerts = false;
            });
          },
        );
      }
    } else {
      if (currentPage != 2) showThresholdFromAlerts = false;
      if (currentPage != 3 && currentPage != 5) showProfileFromSettings = false;
      if (currentPage != 3 && currentPage != 6) showHelpFromSettings = false;
      return _pages[currentPage];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        leading: (showDeviceInfoPage) ||
                (currentPage == 2 && showThresholdFromAlerts) ||
                (currentPage == 5 && showProfileFromSettings) ||
                (currentPage == 6 && showHelpFromSettings) ||
                showAboutPage
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    if (showDeviceInfoPage) {
                      showDeviceInfoPage = false;
                      currentPage = 3;
                      return;
                    }
                    if (currentPage == 2 && showThresholdFromAlerts) {
                      showThresholdFromAlerts = false;
                    } else if (currentPage == 5 && showProfileFromSettings) {
                      currentPage = 3;
                      showProfileFromSettings = false;
                    } else if (currentPage == 6 && showHelpFromSettings) {
                      currentPage = 3;
                      showHelpFromSettings = false;
                    } else if (showAboutPage) {
                      showAboutPage = false;
                      currentPage = 3;
                    }
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
          showDeviceInfoPage
              ? 'Device Info'
              : (currentPage == 2 && showThresholdFromAlerts)
                  ? 'Thresholds'
                  : (currentPage == 5 && showProfileFromSettings)
                      ? 'Profile'
                      : (currentPage == 6 && showHelpFromSettings)
                          ? 'Help and Support'
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
                  showProfileFromSettings = false;
                  showHelpFromSettings = false;
                  showAboutPage = false;
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
              title: const Text('Configure Thresholds'),
              onTap: () {
                setState(() {
                  currentPage = 4;
                  showThresholdFromAlerts = false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My profile'),
              onTap: () {
                setState(() {
                  currentPage = 5;
                  showProfileFromSettings = false;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Help and Support'),
              onTap: () {
                setState(() {
                  currentPage = 6;
                  showThresholdFromAlerts = false;
                  showProfileFromSettings = false;
                  showHelpFromSettings =
                      false; // Since this is direct from drawer
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: getPageForCurrentIndex(),
      bottomNavigationBar: (currentPage <= 4 ||
              (currentPage == 5 && showProfileFromSettings) ||
              (currentPage == 6 && showHelpFromSettings))
          ? NavigationBar(
              selectedIndex: currentPage > 3 ? 3 : currentPage,
              onDestinationSelected: (int index) {
                setState(() {
                  currentPage = index;
                  showThresholdFromAlerts = false;
                  showProfileFromSettings = false;
                  showHelpFromSettings = false;
                  showAboutPage = false;
                  showDeviceInfoPage = false;
                });
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.dashboard), label: 'Dashboard'),
                NavigationDestination(
                    icon: Icon(Icons.light_mode), label: 'Lights'),
                NavigationDestination(
                    icon: Icon(Icons.notifications_none), label: 'Alerts'),
                NavigationDestination(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            )
          : null,
    );
  }
}

class DashboardContent extends StatelessWidget {
  final VoidCallback? onViewDetails;
  const DashboardContent({super.key, this.onViewDetails});

  Widget statCard({
    required IconData icon,
    required String title,
    required String value,
    required String unit,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 6,
                width: 100,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.8,
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  color: statusColor,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
              ),
            ],
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
                    statCard(
                      icon: Icons.water_drop_outlined,
                      title: 'Soil Moisture',
                      value: '65',
                      unit: '%',
                      status: 'Optimal Level',
                      statusColor: Colors.green,
                    ),
                    statCard(
                      icon: Icons.thermostat_outlined,
                      title: 'Air Temperature',
                      value: '24.5',
                      unit: '°C',
                      status: 'Normal Range',
                      statusColor: Colors.green,
                    ),
                    statCard(
                      icon: Icons.air_outlined,
                      title: 'Air Humidity',
                      value: '58',
                      unit: '%',
                      status: 'Ideal Humidity',
                      statusColor: Colors.green,
                    ),
                    statCard(
                      icon: Icons.light_mode_outlined,
                      title: 'Ambient Light',
                      value: '130',
                      unit: 'lux',
                      status: 'Grow Lights on',
                      statusColor: Colors.orange,
                    ),
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
                padding: const EdgeInsets.all(16),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Device Status",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Icon(Icons.wifi, color: Colors.green, size: 24),
                        SizedBox(width: 8),
                        Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "HydroGrow Device is connected and operating normally.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: ElevatedButton(
                        onPressed:onViewDetails,
                        style: ElevatedButton.styleFrom(
                          
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
