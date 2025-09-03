import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Weather App ",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.search,color: Colors.white,),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("There is no weather ",style: TextStyle(color: Colors.black,fontSize: 20),),
            Text("Start searching now 🔎",style: TextStyle(color: Colors.black,fontSize: 20))
          ],
        ),
      ),
    );
  }
}
