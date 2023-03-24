import 'package:flutter/material.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center
      (child:
       Text(
            "Don",
            style:TextStyle
            (
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),
           ),
      );
  }
}