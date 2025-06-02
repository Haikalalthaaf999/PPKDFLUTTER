import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TugasTiga(),
    );
  }
}

// Main screen widget
class TugasTiga extends StatelessWidget {
  const TugasTiga({super.key});
  static const id = '/TugasTiga';

  @override
  Widget build(BuildContext context) {
    // Warna untuk kotak galeri
    final List<Color> colors = [
      Colors.yellow,
      Colors.orange,
      Colors.redAccent,
      Colors.blue,
      Colors.purple,
      Colors.black,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 3 Flutter'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView biar halaman bisa discroll
        child: Column(
          children: [
            // Formulir
            Padding(
              padding: const EdgeInsets.all(16.0), // Padding luar formulir
              child: Column(
                children: [
                  // TextField untuk Nama
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(
                      8.0,
                    ), // Padding dalam Container
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        hintText: "Masukkan Nama",
                        icon: Icon(Icons.person, color: Colors.orange),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // TextField untuk Email
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: "Masukan Email",
                        icon: Icon(Icons.email, color: Colors.orange),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // TextField untuk Nomor Telepon
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Nomor Telepon',
                        hintText: "Masukan Nomor Telepon",
                        icon: Icon(Icons.phone, color: Colors.orange),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // TextField untuk Deskripsi
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Deskripsi',
                        icon: Icon(Icons.description, color: Colors.orange),
                        border: InputBorder.none,
                      ),
                      maxLines: 3, // Biar bisa input beberapa baris
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tombol Submit
                ],
              ),
            ),

            // Galeri
            Padding(
              padding: const EdgeInsets.all(8.0), // Padding luar galeri
              child: GridView.count(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 8.0, // Jarak antar kolom
                mainAxisSpacing: 8.0, // Jarak antar baris
                shrinkWrap: true, // Grid ga ngambil ruang berlebih
                physics:
                    const NeverScrollableScrollPhysics(), // Scroll utama di SingleChildScrollView
                children: List.generate(6, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: colors[index], // Warna beda tiap kotak
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Label pake Positioned di kiri bawah
                        Positioned(
                          bottom: 8.0, // Jarak label dari bawah
                          left: 8.0, // Jarak label dari kiri
                          child: Text(
                            'Kotak ${index + 1}', // Label dinamis                               
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
