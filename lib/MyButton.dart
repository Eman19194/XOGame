import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  int index;
  Function onButtonClick;
  MyButton({required this.text,required this.onButtonClick,required this.index});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(6),
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              onButtonClick(index);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF032A83), // Set the background color here
            ),
            child: Text(text,
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.values.last),),
          ),
        ),
      ),
    );
  }
}
