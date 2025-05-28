// import 'package:belajar_flutter/meet_7/experiment.dart';
import 'package:belajar_flutter/meet_7/experiment.dart';
// import 'package:belajar_flutter/meet_7/tugas7_flutter.dart';
import 'package:flutter/material.dart';

class TugasDelapan extends StatefulWidget {
  const TugasDelapan({super.key});

  @override
  State<TugasDelapan> createState() => _TugasDelapanState();
}

class _TugasDelapanState extends State<TugasDelapan> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const TugasTujuh(), const AboutPage()];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff454545),
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
         selectedItemColor: Colors.orange, // warna ikon & label aktif
        unselectedItemColor: Colors.white70, // warna ikon & label nonaktif
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),  label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Text(
            'Tentang Aplikasi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Aplikasi ini dibuat sebagai tugas Flutter yang menampilkan form input interaktif dengan Drawer, dan navigasi bawah menggunakan BottomNavigationBar.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text('Pembuat: Haikal Althaaf Firoos', style: TextStyle(fontSize: 16)),
          Text('Versi: 1.0.0', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
