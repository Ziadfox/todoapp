import 'package:flutter/material.dart';

class Archived extends StatelessWidget {
  const Archived({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center
      (child:
       Text(
            "Archived",
            style:TextStyle
            (
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),
           ),
      );
  }
}