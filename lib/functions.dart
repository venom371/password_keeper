import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

TextField inputField(String title, TextEditingController ctrl){
  return TextField(
    controller: ctrl,
    onTap: () async{
      if(await Vibration.hasVibrator()?? false) {
        Vibration.vibrate(duration: 50, amplitude: 50);
      }
    },
    decoration: InputDecoration(
    border: const OutlineInputBorder(),
    focusedBorder: myFocusedBorder(),
    hintText: title,
    contentPadding: const EdgeInsets.all(10.0),
    ),
  );
}


OutlineInputBorder myFocusedBorder(){
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blueGrey,
      width: 2.0,
    )
  );
}

bool validData(String app, String username, String password){
  if(app.isEmpty || username.isEmpty || password.isEmpty) {
    return false;
  }
  return true;
}

