class JadwalBus {
  final int? id;
  final String nama;
  final int kelas;
  final String rute;
  final String waktu;

  JadwalBus({
    this.id,
    required this.nama,
    required this.kelas,
    required this.rute,
    required this.waktu,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'kelas': kelas,
      'rute': rute,
      'waktu': waktu,
    };
  }

  factory JadwalBus.fromMap(Map<String, dynamic> map) {
    return JadwalBus(
      id: map['id'],
      nama: map['nama'],
      kelas: map['kelas'],
      rute: map['rute'],
      waktu: map['waktu'],
    );
  }
}
