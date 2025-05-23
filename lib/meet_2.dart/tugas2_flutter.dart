import 'package:flutter/material.dart';

class TugasDua extends StatelessWidget {
  const TugasDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Profil Lengkap"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  /*-untuk border radius*/
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ], // warna border gradient
                    ),
                  ),
                  /*-untuk gambar*/
                  child: Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/vyron.jpg'),
                    ),
                  ),
                ),
                /*-untuk nama*/
                SizedBox(height: 10),
                Text(
                  "Haikal Althaaf Firoos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          // Center(child:Column(
          // mainAxisSize: MainAxisSize.min,
          // children: [
          //   CircleAvatar(
          //   radius: 40,
          //   backgroundColor: Colors.blue,
          //   child: Text("H", style: TextStyle(fontSize: 40, color: Colors.white)),
          // )],
          // )
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft, // Mengatur posisi box
              child: Container(
                //mengatur ukuran box
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  //mengatur isi box
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(Icons.email, color: Colors.orange),
                            Spacer(),
                            SizedBox(width: 10),
                            Text(
                              "haikal@gmail.com",
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft, // Mengatur posisi box
              child: Container(
                //mengatur ukuran box
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  //mengatur isi box
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(Icons.phone, color: Colors.orange),
                            Spacer(),
                            SizedBox(width: 10),
                            Text(
                              "085884085680",
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Padding(
          //   //-menggunakan padding +
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Spacer(),
          //       Icon(Icons.phone, color: Colors.orange),
          //       SizedBox(width: 10),
          //       Spacer(),
          //       Text("085884085680", style: TextStyle(fontSize: 16)),
          //       Spacer(),
          //     ],
          //   ),
          // ),
          Padding(
            /*-menggunakan expanded-*/
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "290",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Postingan",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        // Tambahkan widget lain jika perlu, misalnya:
                        // Icon(Icons.people, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  //-menggunakan expanded-*/
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "14 k",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Followers",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        // Tambahkan widget lain jika perlu, misalnya:
                        // Icon(Icons.people, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                //mengatur isi box
                mainAxisSize: MainAxisSize.min, // Lebar Row menyesuaikan konten
                children: [
                  Flexible(
                    child: Text(
                      "Nama Saya Haikal,saat ini saya sedang belajar menjadi mobile programer ."
                      "saya mempunyai hobi mendengarkan lagu, saya juga mempunyai hobi bermain game"
                      "saya suka berolahraga, terutama lari dan renang",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.orangeAccent,
                  Colors.deepOrangeAccent,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
