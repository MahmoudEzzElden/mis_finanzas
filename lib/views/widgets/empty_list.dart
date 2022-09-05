import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final String? text;
  const EmptyList({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/emptylist.png',fit: BoxFit.fitHeight,),
        Positioned(
          left: 85,
            top: 50
            ,
            child: Text(text!,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
      ],
    );

  }
}
