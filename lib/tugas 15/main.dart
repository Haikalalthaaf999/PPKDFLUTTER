import 'package:belajar_flutter/tugas%2015/view/edit.dart';
import 'package:belajar_flutter/tugas%2015/view/home.dart';
import 'package:belajar_flutter/tugas%2015/view/login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil App',
      initialRoute: '/profile',
      routes: {
        '/login':
            (context) => const LoginPage(), // pastikan LoginScreen sudah ada
        '/profile': (context) => const ProfileUserScreen(),
        '/edit': (context) => const EditProfileScreen(),
      },
    );
  }
}
