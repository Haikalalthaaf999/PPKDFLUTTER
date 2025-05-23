import 'package:flutter/material.dart';

class TugasEmpat extends StatelessWidget {
  const TugasEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff626F47),
        title: Text(
          "Tugas  4",
          style: TextStyle(
            color: Color(0xffA4B465),
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Color(0xffF5ECD5),
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0), // Padding dalam Container
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Nama',
                hintText: "Masukkan Nama",
                icon: Icon(Icons.person, color: Color(0xffF0BB78)),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Color(0xffF5ECD5),
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0), // Padding dalam Container
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: "Masukkan Email",
                icon: Icon(Icons.email, color: Color(0xffF0BB78)),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Color(0xffF5ECD5),
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0), // Padding dalam Container
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'No Hp',
                hintText: "Masukkan No Hp",
                icon: Icon(Icons.phone, color: Color(0xffF0BB78)),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Color(0xffF5ECD5),
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0), // Padding dalam Container
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                icon: Icon(Icons.description, color: Color(0xffF0BB78)),
                border: InputBorder.none,
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "Daftar Produk",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff626F47),
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/images/porsche.jpg',
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Porsche  911 GT3"),
            subtitle: Text("Rp. 19.999.999.999"),
            trailing: Icon(Icons.arrow_forward_ios),
            tileColor: Color(0xffF5ECD5),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/images/chevrolet.jpg',
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Chevrolet Corvette"),
            subtitle: Text("Rp. 20.999.999.999"),
            trailing: Icon(Icons.arrow_forward_ios),
            tileColor: Color(0xffF5ECD5),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/pagani.jpg', fit: BoxFit.cover),
            ),
            title: Text("Pagani Huayra"),
            subtitle: Text("Rp. 21.999.999.999"),
            trailing: Icon(Icons.arrow_forward_ios),
            tileColor: Color(0xffF5ECD5),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/images/mercedes amg gt.jpg',
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Mercedes AMG GT"),
            subtitle: Text("Rp. 22.999.999.999"),
            trailing: Icon(Icons.arrow_forward_ios),
            tileColor: Color(0xffF5ECD5),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/dodge.jpg', fit: BoxFit.cover),
            ),
            title: Text("Dodge Challenger SRT"),
            subtitle: Text("Rp. 23.999.999.999"),
            trailing: Icon(Icons.arrow_forward_ios),
            tileColor: Color(0xffF5ECD5),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/images/revuelto.jpg',
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Lamborghini Revuelto"),
            subtitle: Text("Rp. 24.999.999.999"),
            trailing: Icon(Icons.arrow_forward_ios),
            tileColor: Color(0xffF5ECD5),
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
