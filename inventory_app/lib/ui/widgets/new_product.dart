import 'package:flutter/material.dart';

class NewProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff392850),
      child: FloatingActionButton(
        child: Icon(
          Icons.add
        ),
      ),
    );
  }
}
