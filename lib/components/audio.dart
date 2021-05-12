import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer audioPlayer = AudioPlayer();

play(audioUrl) async {
  int result = await audioPlayer.play(audioUrl);

  if (result != 1) {
    Fluttertoast.showToast(
      msg: "Error playing audio file",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[900],
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}