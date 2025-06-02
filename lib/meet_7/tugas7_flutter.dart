// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     const MaterialApp(home: TugasTujuh(), 
//     debugShowCheckedModeBanner: false,
//     ),
//   );
// }

// class TugasTujuh extends StatefulWidget {
//   const TugasTujuh({super.key});

//   @override
//   State<TugasTujuh> createState() => _TugasTujuhState();
// }

// class _TugasTujuhState extends State<TugasTujuh> {
//   bool isDarkMode = false;
//   bool isChecked = false;
//   String selectedMenu = 'Syarat & Ketentuan';
//   String? selectedCategory;
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   final List<Map<String, dynamic>> menuItems = [
//   {'title': 'Syarat & Ketentuan', 'icon': Icons.description},
//   {'title': 'Mode Gelap', 'icon': Icons.dark_mode},
//   {'title': 'Pilih Kategori Produk', 'icon': Icons.category},
//   {'title': 'Pilih Tanggal Lahir', 'icon': Icons.calendar_today},
//   {'title': 'Atur Pengingat', 'icon': Icons.alarm},
// ];

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       child: Scaffold(
//         appBar: AppBar(title: Text(selectedMenu)),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.blue),
//                 child: Text(
//                   'Menu Form',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//               ...menuItems.map(
//                 (menu) => ListTile(
//                   leading:  Icon(menu['icon']),
//                   title: Text(menu['title']),
//                   onTap: () {
//                     setState(() => selectedMenu = menu['title']);
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: Padding(padding: const EdgeInsets.all(16.0), child: _buildBody()),
//       ),
//     );
//   }

//   Widget _buildBody() {
//     if (selectedMenu == 'Syarat & Ketentuan') {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CheckboxListTile(
//             title: const Text('Saya menyetujui semua persyaratan'),
//             value: isChecked,
//             onChanged: (val) => setState(() => isChecked = val ?? false),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             isChecked ? 'Boleh lanjut!' : 'Belum bisa lanjut',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: isChecked ? Colors.green : Colors.red,
//             ),
//           ),
//         ],
//       );
//     } else if (selectedMenu == 'Mode Gelap') {
//       return Row(
//         children: [
//           Switch(
//             value: isDarkMode,
//             onChanged: (val) => setState(() => isDarkMode = val),
//           ),
//           const SizedBox(width: 12),
//           Text(
//             isDarkMode ? "Mode Gelap Aktif" : "Mode Terang Aktif",
//             style: const TextStyle(fontSize: 16),
//           ),
//         ],
//       );
//     } else if (selectedMenu == 'Pilih Kategori Produk') {
//       final categories = ['Elektronik', 'Pakaian', 'Makanan', 'Minuman'];
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           DropdownButtonFormField<String>(
//             decoration: const InputDecoration(labelText: 'Pilih Kategori'),
//             value: selectedCategory,
//             items:
//                 categories
//                     .map(
//                       (item) =>
//                           DropdownMenuItem(value: item, child: Text(item)),
//                     )
//                     .toList(),
//             onChanged: (val) => setState(() => selectedCategory = val),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             selectedCategory != null
//                 ? "Kategori: $selectedCategory"
//                 : "Belum memilih kategori",
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ],
//       );
//     } else if (selectedMenu == 'Pilih Tanggal Lahir') {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//              ElevatedButton(
//             onPressed: () async {
//               DateTime? picked = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(1900),
//                 lastDate: DateTime(2100),
//               );
//               if (picked != null) {
//                 setState(() => selectedDate = picked);
//               }
//             },
//             child: const Text("Pilih Tanggal Lahir"),
//           ),
//           if (selectedDate != null)
//             Text("Tanggal Lahir: ${formatDate(selectedDate!)}"),
//         ],
//       );
//     } else if (selectedMenu == 'Atur Pengingat') {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               final picked = await showTimePicker(
//                 context: context,
//                 initialTime: TimeOfDay.now(),
//               );
//               if (picked != null) {
//                 setState(() => selectedTime = picked);
//               }
//             },
//             child: const Text("Pilih Waktu Pengingat"),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             selectedTime != null
//                 ? "Pengingat: ${selectedTime!.format(context)}"
//                 : "Belum mengatur pengingat",
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ],
//       );
//     }
//     return const SizedBox(); // fallback
//   }
//    String formatDate(DateTime date) {
//     return "${date.day} ${monthName(date.month)} ${date.year}";
//   }

//   String monthName(int month) {
//     final months = [
//       'Januari',
//       'Februari',
//       'Maret',
//       'April',
//       'Mei',
//       'Juni',
//       'Juli',
//       'Agustus',
//       'September',
//       'Oktober',
//       'November',
//       'Desember',
//     ];
//     return months[month - 1];
//   }
// }
