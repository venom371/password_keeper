import 'package:flutter/material.dart';

class PasswordData{
  String username;
  String password;
  String name;

  PasswordData({required this.name, required this.username, required this.password});
}

class PasswordCard extends StatelessWidget {
  final PasswordData currPassword;
  PasswordCard({required this.currPassword});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[100],
      margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      child: GestureDetector(
        onLongPress: () => print('long pressed'),
        onLongPressUp: () => print('press canceled'),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currPassword.name, style: const TextStyle(
                fontSize: 15.0,
                letterSpacing: 2.0,
              ),),
              const SizedBox(height: 7.0,),
              Text('Username:${currPassword.username}', style: const TextStyle(
                fontSize: 10.0,
                letterSpacing: 2.0,
              ),),
              const SizedBox(height: 4.0,),
              Text('Password:${currPassword.password}', style: const TextStyle(
                fontSize: 10.0,
                letterSpacing: 2.0,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
