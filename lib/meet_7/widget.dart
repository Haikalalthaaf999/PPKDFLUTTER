import 'package:flutter/material.dart';

class DatePickerForm extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime?> onDateChanged;

  const DatePickerForm({
    super.key,
    this.initialDate,
    required this.onDateChanged,
  });

  @override
  State<DatePickerForm> createState() => _DatePickerFormState();
}

class _DatePickerFormState extends State<DatePickerForm> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  void didUpdateWidget(DatePickerForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDate != oldWidget.initialDate) {
      setState(() {
        selectedDate = widget.initialDate;
      });
    }
  }

  String formatDate(DateTime date) {
    return "${date.day} ${monthName(date.month)} ${date.year}";
  }

  String monthName(int month) {
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                });
                widget.onDateChanged(picked);
              }
            },
            child: const Text("Pilih Tanggal Lahir"),
          ),
          if (selectedDate != null)
            Text("Tanggal Lahir: ${formatDate(selectedDate!)}"),
        ],
      ),
    );
  }
}

class CheckboxForm extends StatefulWidget {
  final bool initialChecked;
  final ValueChanged<bool?> onChanged;

  const CheckboxForm({
    super.key,
    required this.initialChecked,
    required this.onChanged,
  });

  @override
  State<CheckboxForm> createState() => _CheckboxFormState();
}

class _CheckboxFormState extends State<CheckboxForm> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialChecked;
  }

  @override
  void didUpdateWidget(CheckboxForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialChecked != oldWidget.initialChecked) {
      setState(() {
        isChecked = widget.initialChecked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: const Text('Saya menyetujui semua persyaratan'),
          value: isChecked,
          onChanged: (val) {
            setState(() {
              isChecked = val ?? false;
            });
            widget.onChanged(val);
          },
        ),
        const SizedBox(height: 20),
        Text(
          isChecked ? 'Boleh lanjut!' : 'Belum bisa lanjut',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isChecked ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

class SwitchForm extends StatefulWidget {
  final bool initialDarkMode;
  final ValueChanged<bool> onToggle;

  const SwitchForm({
    super.key,
    required this.initialDarkMode,
    required this.onToggle,
  });

  @override
  State<SwitchForm> createState() => _SwitchFormState();
}

class _SwitchFormState extends State<SwitchForm> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.initialDarkMode;
  }

  @override
  void didUpdateWidget(SwitchForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDarkMode != oldWidget.initialDarkMode) {
      setState(() {
        isDarkMode = widget.initialDarkMode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: isDarkMode,
          onChanged: (val) {
            setState(() {
              isDarkMode = val;
            });
            widget.onToggle(val);
          },
        ),
        const SizedBox(width: 12),
        Text(
          isDarkMode ? "Mode Gelap Aktif" : "Mode Terang Aktif",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class Dropdown extends StatefulWidget {
  final String? initialCategory;
  final ValueChanged<String?> onChanged;

  const Dropdown({
    super.key,
    this.initialCategory,
    required this.onChanged,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
  }

  @override
  void didUpdateWidget(Dropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCategory != oldWidget.initialCategory) {
      setState(() {
        selectedCategory = widget.initialCategory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['Elektronik', 'Pakaian', 'Makanan', 'Minuman'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: 'Pilih Kategori'),
          value: selectedCategory,
          items: categories
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (val) {
            setState(() {
              selectedCategory = val;
            });
            widget.onChanged(val);
          },
        ),
        const SizedBox(height: 20),
        Text(
          selectedCategory != null
              ? "Kategori: $selectedCategory"
              : "Belum memilih kategori",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class TimePicker extends StatefulWidget {
  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay?> onTimeChanged;

  const TimePicker({
    super.key,
    this.initialTime,
    required this.onTimeChanged,
  });

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime;
  }

  @override
  void didUpdateWidget(TimePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialTime != oldWidget.initialTime) {
      setState(() {
        selectedTime = widget.initialTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              setState(() {
                selectedTime = picked;
              });
              widget.onTimeChanged(picked);
            }
          },
          child: const Text("Pilih Waktu Pengingat"),
        ),
        const SizedBox(height: 20),
        Text(
          selectedTime != null
              ? "Pengingat: ${selectedTime!.format(context)}"
              : "Belum mengatur pengingat",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}