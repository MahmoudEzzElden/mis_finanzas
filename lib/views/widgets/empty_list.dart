import 'package:flutter/material.dart';
import 'package:mis_finanzas/core/utils/assets_manager.dart';
import 'package:sizer/sizer.dart';

class EmptyList extends StatelessWidget {
  final String? text;
  const EmptyList({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AssetManager.emptyListImg,fit: BoxFit.fill,),
        PositionedDirectional(
          start: 90,
            top:50
            ,
            child: Text(text!,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
      ],
    );

  }
}
