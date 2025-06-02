import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List<String> kategori = [
   'Action Figure',
   'Gasing',
   'Layang Layang',
   'Lego',
   'Puzzle',
   'Robot',
   'Mobil mobilan',
   'Pedang Pedangan',
   'Tembak tembakan',
   'Kapal kapalan'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("List Widget")),
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(kategori[index]),
          );
        },
      ),
    );
  }
}
