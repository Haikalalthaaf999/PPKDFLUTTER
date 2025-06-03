import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final String nama;
  final String kota;

  const ConfirmationPage({super.key, required this.nama, required this.kota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2D7), // Krem muda
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          "Konfirmasi Pendaftaran",
          style: TextStyle(color: Color(0xFFFFF2D7)), // Krem muda untuk teks
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF8A6F47),
                Color(0xFFD9B99B),
              ], // Cokelat tua ke cokelat muda
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green, 
                size: 100,
              ),
              const SizedBox(height: 20),
              Text(
                "Terima kasih, $nama dari $kota telah mendaftar.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8A6F47), // Cokelat tua
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9B99B), // Cokelat muda
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text(
                  "Kembali",
                  style: TextStyle(color: Color(0xFFFFF2D7)), // Krem muda
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
