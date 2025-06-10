import 'package:flutter/material.dart';
import 'package:belajar_flutter/Tugas 11/database/db_helper.dart';
import 'package:belajar_flutter/Tugas 11/model/bus_model.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  final TextEditingController ruteController = TextEditingController();
  final TextEditingController waktuController = TextEditingController();
  TimeOfDay? selectedTime;

  List<JadwalBus> jadwalBusList = [];
  JadwalBus? _jadwalYangDiedit;

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DBHelper.getAllJadwal();
    setState(() {
      jadwalBusList = data;
    });
  }

  Future<void> simpanData() async {
    if (_formKey.currentState!.validate()) {
      final nama = nameController.text;
      final kelas = int.parse(kelasController.text);
      final rute = ruteController.text;
      final waktu = waktuController.text;

      if (_jadwalYangDiedit != null) {
        final updatedJadwal = JadwalBus(
          id: _jadwalYangDiedit!.id,
          nama: nama,
          kelas: kelas,
          rute: rute,
          waktu: waktu,
        );
        await DBHelper.updateJadwal(updatedJadwal);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Jadwal berhasil diperbarui')),
        );
      } else {
        await DBHelper.insertJadwal(
          JadwalBus(nama: nama, kelas: kelas, rute: rute, waktu: waktu),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Jadwal berhasil disimpan')),
        );
      }

      // Reset
      _jadwalYangDiedit = null;
      nameController.clear();
      kelasController.clear();
      ruteController.clear();
      waktuController.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        title: const Text(
          ' Jadwal Bus Sekolah',
          style: TextStyle(color: Color(0xffAFDDFF)),
        ),
        backgroundColor: const Color(0xff60B5FF),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff60B5FF),
                    Color(0xffAFDDFF),
                    Color(0xff60B5FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Form Input Jadwal',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildInput(
                      controller: nameController,
                      label: 'Nama Penumpang',
                      icon: Icons.person,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Nama wajib diisi'
                                  : null,
                    ),
                    const SizedBox(height: 10),
                    _buildInput(
                      controller: kelasController,
                      label: 'Kelas',
                      icon: Icons.class_,
                      keyboardType: TextInputType.number,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Kelas wajib diisi'
                                  : null,
                    ),
                    const SizedBox(height: 10),
                    _buildInput(
                      controller: ruteController,
                      label: 'Rute',
                      icon: Icons.map,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Rute wajib diisi'
                                  : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: waktuController,
                      readOnly: true,
                      onTap: () async {
                        final picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedTime = picked;
                            waktuController.text = picked.format(context);
                          });
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Waktu',
                        prefixIcon: const Icon(Icons.access_time),
                        fillColor: const Color(0xffFFECDB),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? 'Waktu wajib dipilih'
                                  : null,
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      label: Text(
                        _jadwalYangDiedit != null
                            ? 'Perbarui Jadwal'
                            : 'Simpan Jadwal',
                      ),
                      onPressed: simpanData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '📋 Daftar Jadwal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ...jadwalBusList.map(
              (item) => Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xff60B5FF)),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xff60B5FF),
                    child: Icon(Icons.directions_bus, color: Color(0xffFF9149)),
                  ),
                  title: Text('${item.nama} (Kelas ${item.kelas})'),
                  subtitle: Text('Rute: ${item.rute} • Waktu: ${item.waktu}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.green),
                        onPressed: () {
                          setState(() {
                            _jadwalYangDiedit = item;
                            nameController.text = item.nama;
                            kelasController.text = item.kelas.toString();
                            ruteController.text = item.rute;
                            waktuController.text = item.waktu;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Edit jadwal: ${item.nama}'),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await DBHelper.deleteJadwal(item.id!);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Jadwal ${item.nama} dihapus'),
                            ),
                          );
                          muatData();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: const Color(0xffFFECDB),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: validator,
    );
  }
}
