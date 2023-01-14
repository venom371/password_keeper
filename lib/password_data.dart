import 'package:flutter/material.dart';
import 'hero_dialog_route.dart';
import 'main.dart';

class PasswordData{
  String username;
  String password;
  String name;

  PasswordData({required this.name, required this.username, required this.password});
}

class PasswordCard extends StatelessWidget {
  final PasswordData currPassword;
  const PasswordCard({super.key, required this.currPassword});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        Navigator.of(context).push(
          HeroDialogRoute(
            builder: (context) => Center(
              child: PopUpWindow(currPassword: currPassword,),
            ),
          ),
        );
      },
      child: Hero(
          tag: currPassword.name,
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 0.0),
              color: Colors.transparent,
              elevation: 0,
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5.0,
                color: Colors.blueGrey[100],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(currPassword.name,
                        style: const TextStyle(
                          fontSize: 15.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Text('Username: ${currPassword.username}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text('Password: ${currPassword.password}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}

class PopUpWindow extends StatelessWidget {
  final PasswordData currPassword;
  const PopUpWindow({super.key, required this.currPassword});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: currPassword.name,
        child: SingleChildScrollView(
          child: Material(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.blueGrey[100],
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                    color: Colors.blueGrey[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currPassword.name,
                          style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                            'Username: ${currPassword.username}',
                            style: const TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        const SizedBox(
                            height: 4.0,
                          ),
                        Text('Password: ${currPassword.password}',
                            style: const TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
