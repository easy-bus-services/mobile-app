import 'dart:ui';

import 'package:flutter/material.dart';

class MyAlert extends StatelessWidget{
  final String message;
  final VoidCallback onPress;

  const MyAlert({super.key,required this.message, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: EdgeInsets.only(left: 40, right: 40, top: 20),
            actionsPadding: EdgeInsets.only(top: 15, bottom: 30),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(                  
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all(4),
                    padding: WidgetStateProperty.all(EdgeInsets.only(
                        right: 30, left: 30, top: 10, bottom: 10)),
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    textStyle: WidgetStateProperty.all(
                      const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: onPress,
                  child: Text(
                    "RETRY",
                    style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 7,
                        wordSpacing: 5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  ),
            ],
            content: Text(message!,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black)),
          ),
        ),
      ),
    );
  }

}