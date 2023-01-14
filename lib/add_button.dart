import 'package:flutter/material.dart';
import 'package:password_keeper/main.dart';
import 'hero_dialog_route.dart';
import 'functions.dart';
import 'package:vibration/vibration.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          showDialog(context: context, builder: (context) => Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: AddButtonPopUp(),
          )
          );
        },
        child: Material(
          color: Colors.blueGrey[100],
          elevation: 5.0,
          shadowColor: Colors.blueGrey[5],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: const Icon(
            Icons.add,
            size: 60.0,
          ),
        ),
      ),
    );
  }
}

class AddButtonPopUp extends StatelessWidget {
  AddButtonPopUp({super.key});
  final appName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 250.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                inputField('App Name', appName),
                const SizedBox(height: 7.0),
                inputField('Username', username),
                const SizedBox(height: 7.0),
                inputField('Password', password),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if(validData(appName.text.trim(), username.text.trim(), password.text.trim())){

                      }
                      else if(await Vibration.hasVibrator()?? false) {
                        showAlertDialog(context);
                        Vibration.vibrate(duration: 50, amplitude: 50);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blueGrey[900]),
                      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 9))
                    ),
                    child: const Text('Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context){
  AlertDialog alert = const AlertDialog(
    title: Text('invalid input'),
    content: Text('please fill all input fields'),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}