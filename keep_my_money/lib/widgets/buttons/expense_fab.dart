import 'package:flutter/material.dart';

class ExpenseFab extends StatelessWidget {
  const ExpenseFab ({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: 40,
        width: 40,
        color: Colors.grey[300],
        child: Padding(
          padding: EdgeInsetsGeometry.all(5),
          child: Icon(Icons.add,),
        ),
      ),
    );
  }
}