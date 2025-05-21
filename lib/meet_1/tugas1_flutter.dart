import 'package:flutter/material.dart';

class TugasSatu extends StatelessWidget {
  const TugasSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent, // Changed color to indigoAccent
        title: Text("My Profile"), // Changed title to "Pertemuan 1"
        centerTitle: true, // Centered the title
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
          ],
        ),
      ),
      backgroundColor: Colors.grey[100], // Changed background color to white
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
               Text(
                "Haikal Althaaf Firoos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.location_on, color: Colors.red ,size: 20),
               Text(
                "Jl Kr Kwitang ||",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ]),
        
        
          Text(
            "Saya Haikal Althaaf Firoos, seorang pemula yang penuh semangat dan ingin menguasai dunia melalui pembelajaran dan pengalaman baru",
            maxLines: 2,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
        ],
      ),
    );
  }
}