import 'package:flutter/material.dart';
import 'package:major_project/alerts.dart';
import 'package:major_project/dashboard.dart';
import 'package:major_project/lights.dart';
import 'package:major_project/login.dart';
import 'package:major_project/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3:true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        
        
        
      ),
      home: Login(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 4;

  //pages
  final List<Widget> _pages=[
    const Dashboard(),
    const LightsPage(),
    const AlertsPage(),  
    const SettingsPage(),  
    const Login(),  
  ];

  final List<String> _titles = [
  'Dashboard',  // for index 0
  'Lights',     // for index 1
  'Alerts',     // for index 2
  'Settings',   // for index 3
  'Login',   // for index 3
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[currentPage]), 
      ),
      drawer: Drawer(
        child:ListView(
          children:[
            ListTile(
              title:Text('Home'),
              onTap:(){
                setState((){
                  currentPage=0;
                });
              },
            ),
            ListTile(
              title:Text('Dashboard'),
              onTap:(){
                setState((){
                  currentPage=1;
                });
              },
            ),

            ListTile(
              title:Text('Alert'),
              onTap:(){
                setState((){
                  currentPage=2;
                });
              },
            ),
          ]
        )
      ),

      
      body:_pages[currentPage],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Folating Action Button');
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:currentPage,
        onDestinationSelected:(int index){
          setState((){
            currentPage=index;
          });
        },
        
        // selectedIconTheme: const IconThemeData(color: Colors.green),

        destinations: const[
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.light_mode), label: 'Lights'),
          NavigationDestination(icon: Icon(Icons.notifications_none), label: 'Alerts'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        
      ),
    );
  }
}
