import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("search by your city name",style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(32),
              suffixIcon: Icon(Icons.search),
              labelText: "Search",
              hintText: "City Name..?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )
            ),
          ),
        ),
      ),
    );
  }
}