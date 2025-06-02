import 'package:belajar_flutter/meet_2/tugas2_flutter.dart';
import 'package:belajar_flutter/meet_5/tugas5_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TugasEnam extends StatefulWidget {
  const TugasEnam({super.key});

  @override
  State<TugasEnam> createState() => _TugasEnamState();
}

class _TugasEnamState extends State<TugasEnam> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/porsche.jpg'),
              ),
            ),
          ),

          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/dodge.jpg"),
          //     fit: BoxFit.none, // menyesuaikan gambar ke seluruh layar
          //     alignment: Alignment.bottomCenter,
          //   ),
          // ),
          SingleChildScrollView(
            child: Column(
              children: [         
                const SizedBox(height: 80),
                Text(
                  "Hallo!",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Please login to get full access from us",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 132), // spasi sebelum kotak hitam
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: usernameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Agus Setiawan",
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Colors.grey[900],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          color: const Color(0xff999999),
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "********",
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Colors.grey[900],
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white54,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7D00D0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TugasLima(),
                              ),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF000000),
                                    Color(0xFFFFFFFF),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Or continue with",
                              style: GoogleFonts.poppins(
                                color: const Color(0xffffffff),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFF000000),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 90,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff111111),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.elliptical(10, 10),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Image.asset('assets/images/google.png'),
                            ),
                          ),
                          const SizedBox(width: 32),
                          SizedBox(
                            width: 87,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff111111),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.elliptical(10, 10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/tugas2");
                              },
                              child: Image.asset('assets/images/apple.png'),
                            ),
                          ),
                          const SizedBox(width: 32),
                          SizedBox(
                            width: 90,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff111111),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.elliptical(10, 10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TugasDua(),
                                  ),
                                );
                              },
                              child: Image.asset('assets/images/twiter.png'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
