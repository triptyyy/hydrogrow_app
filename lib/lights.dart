import 'package:flutter/material.dart';

class LightsPage extends StatelessWidget {
  const LightsPage({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
             decoration: BoxDecoration(
                border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
          ),
          
          child:Align(
            alignment:Alignment.topLeft,
            child:Padding(
              padding:const EdgeInsets.only(top: 10.0, left: 12.0),
             child: Text(
              'Control mode',
              style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),

            
            ),
              
             )
          ),
          SizedBox(height: 16), 
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.green,
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
          ),
        ],
      ),
    ),
  );
}
}
