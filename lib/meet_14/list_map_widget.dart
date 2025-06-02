import 'package:flutter/material.dart';

class ListInMap extends StatefulWidget {
  const ListInMap({super.key});

  @override
  State<ListInMap> createState() => _ListInMapState();
}

class _ListInMapState extends State<ListInMap> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Action Figure',  "icon": Icons.child_care},
    {'name': 'Mobil mobilan',  "icon": Icons.toys},
    {'name': 'Puzzle',  "icon": Icons.view_quilt},
    {'name': 'Game Pad',  "icon": Icons.gamepad},
    {'name': 'Lego',  "icon": Icons.build},
    {'name': 'Pesawat pesawatan',  "icon": Icons.flight},
    {'name': 'Tembak tembakan',  "icon": Icons.track_changes_outlined},
    {'name': 'Bola',  "icon": Icons.sports_basketball},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("List in map")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Icon(product['icon']),
            title: Text(product['name']),
          );
        },
      )
      );
  }
}
