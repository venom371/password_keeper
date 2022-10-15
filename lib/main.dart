import 'package:flutter/material.dart';
import 'password_data.dart';

void main() => runApp(const MaterialApp(
    home: MainApp(),
    debugShowCheckedModeBanner: false,
));

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<PasswordData> passwords = [
    PasswordData(name: 'app1', username: 'mihir', password: 'secret'),
    PasswordData(name: 'app2', username: 'user2', password: 'super Secret'),
    PasswordData(name: 'app3', username: 'user3', password: 'i won\'t tell'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passwords'),
        backgroundColor: Colors.blueGrey[900],
        elevation: 1.0,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey[800],
          ),
          SingleChildScrollView(
            child: Column(
              children: passwords.map((currPassword) => PasswordCard(currPassword: currPassword)).toList(),
            ),
          ),

        ],
      ),
    );
  }
}


