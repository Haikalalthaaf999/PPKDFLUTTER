import 'package:belajar_flutter/meet_14/konfirmasi.dart';
import 'package:flutter/material.dart';

class Tugas10 extends StatefulWidget {
  const Tugas10({super.key});

  @override
  State<Tugas10> createState() => _Tugas10State();
}

class _Tugas10State extends State<Tugas10> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _kotaController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: const Color(0xFFFFF2D7), // Kuning krem
              title: const Text(
                "Konfirmasi Pendaftaran",
                style: TextStyle(color: Color(0xFF8A6F47)), // Cokelat tua
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_namaController.text.isNotEmpty)
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 20,
                          color: Color(0xFF8A6F47),
                        ), // Cokelat tua
                        const SizedBox(width: 8),
                        Text(
                          "Nama Lengkap: ${_namaController.text}",
                          style: const TextStyle(
                            color: Color(0xFF8A6F47),
                          ), // Cokelat tua
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  if (_emailController.text.isNotEmpty)
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          size: 20,
                          color: Color(0xFF8A6F47),
                        ), // Cokelat tua
                        const SizedBox(width: 8),
                        Text(
                          "Email: ${_emailController.text}",
                          style: const TextStyle(
                            color: Color(0xFF8A6F47),
                          ), // Cokelat tua
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  if (_noHpController.text.isNotEmpty)
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 20,
                          color: Color(0xFF8A6F47),
                        ), // Cokelat tua
                        const SizedBox(width: 8),
                        Text(
                          "Nomor HP: ${_noHpController.text}",
                          style: const TextStyle(
                            color: Color(0xFF8A6F47),
                          ), // Cokelat tua
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                  if (_kotaController.text.isNotEmpty)
                    Row(
                      children: [
                        const Icon(
                          Icons.location_city,
                          size: 20,
                          color: Color(0xFF8A6F47),
                        ), // Cokelat tua
                        const SizedBox(width: 8),
                        Text(
                          "Kota Domisili: ${_kotaController.text}",
                          style: const TextStyle(
                            color: Color(0xFF8A6F47),
                          ), // Cokelat tua
                        ),
                      ],
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Batal",
                    style: TextStyle(
                      color: Color(0x998A6F47),
                    ), // Cokelat tua dengan opacity
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ConfirmationPage(
                              nama: _namaController.text,
                              kota: _kotaController.text,
                            ),
                      ),
                    );
                  },
                  child: const Text(
                    "Lanjut",
                    style: TextStyle(color: Color(0xFFD9B99B)), // Cokelat muda
                  ),
                ),
              ],
            ),
      );
    }
  }

  // @override
  // void dispose() {
  //   _namaController.dispose();
  //   _emailController.dispose();
  //   _noHpController.dispose();
  //   _kotaController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2D7), // Krem muda
      appBar: AppBar(
        title: const Text(
          "Formulir Pendaftaran Kelas Flutter",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: "Nama Lengkap",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF8A6F47),
                  ), // Cokelat tua
                  labelStyle: TextStyle(
                    color: Color(0xFFD9B99B),
                  ), // Cokelat muda
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8A6F47),
                    ), // Cokelat tua
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8A6F47),
                      width: 2,
                    ), // Cokelat tua
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama lengkap wajib di isi";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF8A6F47),
                  ), // Cokelat tua
                  labelStyle: TextStyle(
                    color: Color(0xFFD9B99B),
                  ), // Cokelat muda
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8A6F47),
                    ), // Cokelat tua
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8A6F47),
                      width: 2,
                    ), // Cokelat tua
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email wajib di isi";
                  }
                  if (!value.contains('@')) {
                    return "Email harus mengandung @";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _noHpController,
                decoration: const InputDecoration(
                  labelText: "Nomor HP (boleh kosong)",
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF8A6F47),
                  ), // Cokelat tua
                  labelStyle: TextStyle(
                    color: Color(0xFFD9B99B),
                  ), // Cokelat muda
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8A6F47),
                    ), // Cokelat tua
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8A6F47),
                      width: 2,
                    ), // Cokelat tua
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kotaController,
                decoration: const InputDecoration(
                  labelText: "Kota Domisili",
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Color(0xFF8A6F47),
                  ), // Cokelat tua
                  labelStyle: TextStyle(
                    color: Color(0xFFD9B99B),
                  ), // Cokelat muda
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8A6F47),
                    ), // Cokelat tua
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8A6F47),
                      width: 2,
                    ), // Cokelat tua
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kota domisili wajib di isi";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9B99B), // Cokelat muda
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFFF2D7),
                  ), // Krem muda
                ),
                child: const Text(
                  "Daftar",
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
