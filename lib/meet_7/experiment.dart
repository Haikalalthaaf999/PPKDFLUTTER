import 'package:belajar_flutter/meet_7/widget.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(home: TugasTujuh(), debugShowCheckedModeBanner: false),
  );
}

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  late Widget _currentScreen;
  bool isDarkMode = false;
  DateTime? selectedDate;
  String? selectedCategory;
  TimeOfDay? selectedTime;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _currentScreen = CheckboxForm(
      initialChecked: isChecked,
      onChanged: (val) {
        setState(() {
          isChecked = val ?? false;
        });
      },
    );
  }

  void _setScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tugas 7 Flutter",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0XFF454545),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: Container(
            color: Color(0xffFFA559), // <- warna latar bawah
            child: Column(
              children: [
                // Header Tanpa Celah
                Container(
                  color: Color(0xFF454545), // warna gelap
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/tugas2");
                        },
                        borderRadius: BorderRadius.circular(35),
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            'assets/images/vyron.jpg',
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Haikal Althaaf Firoos",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "UI/UX Designer",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Menu Tanpa Celah
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero, // Hapus padding default
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.check_box,
                          color: Color(0xffFFE6C7),
                        ),
                        title: const Text(
                          "Syarat & Ketentuan",
                          style: TextStyle(color: Color(0xffFFE6C7)),
                        ),
                        onTap:
                            () => _setScreen(
                              CheckboxForm(
                                initialChecked: isChecked,
                                onChanged: (val) {
                                  setState(() {
                                    isChecked = val ?? false;
                                  });
                                },
                              ),
                            ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.dark_mode,
                          color: Color(0xffFFE6C7),
                        ),
                        title: const Text(
                          "Mode Gelap",
                          style: TextStyle(color: Color(0xffFFE6C7)),
                        ),
                        onTap:
                            () => _setScreen(
                              SwitchForm(
                                initialDarkMode: isDarkMode,
                                onToggle: (val) {
                                  setState(() {
                                    isDarkMode = val;
                                  });
                                },
                              ),
                            ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.list,
                          color: Color(0xffFFE6C7),
                        ),
                        title: const Text(
                          "Pilih Kategori Produk",
                          style: TextStyle(color: Color(0xffFFE6C7)),
                        ),
                        onTap:
                            () => _setScreen(
                              Dropdown(
                                initialCategory: selectedCategory,
                                onChanged: (val) {
                                  setState(() {
                                    selectedCategory = val;
                                  });
                                },
                              ),
                            ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.date_range,
                          color: Color(0xffFFE6C7),
                        ),
                        title: const Text(
                          "Pilih Tanggal Lahir",
                          style: TextStyle(color: Color(0xffFFE6C7)),
                        ),
                        onTap:
                            () => _setScreen(
                              DatePickerForm(
                                initialDate: selectedDate,
                                onDateChanged: (date) {
                                  setState(() {
                                    selectedDate = date;
                                  });
                                },
                              ),
                            ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.access_time,
                          color: Color(0xffFFE6C7),
                        ),
                        title: const Text(
                          "Atur Pengingat",
                          style: TextStyle(color: Color(0xffFFE6C7)),
                        ),
                        onTap:
                            () => _setScreen(
                              TimePicker(
                                initialTime: selectedTime,
                                onTimeChanged: (time) {
                                  setState(() {
                                    selectedTime = time;
                                  });
                                },
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        body: _currentScreen,
      ),
    );
  }
}
