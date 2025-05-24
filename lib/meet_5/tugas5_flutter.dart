import 'package:flutter/material.dart';

class TugasLima extends StatefulWidget {
  const TugasLima({super.key});

  @override
  State<TugasLima> createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
  bool _showName = false; // State untuk kontrol teks
  bool _isFavorite = false;
  bool _isPressed = false;
  int nilaiTambah = 0;
  bool _showInkWellText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas 5", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff537D5D),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("tekan disini");
          setState(() {
            nilaiTambah++;
          });
          print("Nilai sekarang: $nilaiTambah");
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showName =
                      !_showName; // Toggle: true jadi false, false jadi true
                });
              },
              child: Text(_showName ? "Sembunyikan Nama" : "Tampilkan Nama"),
            ),
            const SizedBox(height: 5),
            if (_showName) Text("Nama saya: Haikal Althaaf Firoos"),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: _isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
            if (_isFavorite) const Text("Disukai"),
            TextButton(
              onPressed: () {
                setState(() {
                  _isPressed = !_isPressed;
                });
              },
              child: const Text(
                "Lihat Selengkapnya",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            if (_isPressed)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "He doop joke a we",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            Text("Nilai: $nilaiTambah"),
            /*InkWell*/
            SizedBox(height: 20),
            InkWell(
              splashColor: Colors.red,
              onTap: () {
                print("Kotak disentuh"); // Cetak ke console
                setState(() {
                  _showInkWellText = !_showInkWellText; // Toggle teks
                });
              },
              child: Stack(
                alignment: Alignment.center, // Teks di tengah gambar
                children: [
                  Image.asset(
                    "assets/images/dodge.jpg",
                    width: 200,
                    height: 200,
                  ),
                  if (_showInkWellText)
                    Container(
                      padding: const EdgeInsets.all(8.0),

                      child: const Text(
                        "Dodge Challenger SRT Hellcat",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red, // Warna teks kontras
                          backgroundColor: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
            /*GestureDetector*/
            SizedBox(height: 20),
            GestureDetector(
              onLongPress: () {
                print("Tahan lama");
              },
              onDoubleTap: () {
                print("Ditekan dua kali");
              },
              onTap: () {
                print("Ditekan Sekali");

                print(nilaiTambah);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.red,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.touch_app, color: Colors.white, size: 30),
                    Text(
                      "Tekan Aku",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
