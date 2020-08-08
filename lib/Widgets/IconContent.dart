import 'package:bmw/const/Const.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icons, this.caption});
  final IconData icons;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icons,
          size: 80,
        ),
        Text(caption,style: KlabelTextStyle,)
      ],
    );
  }
}
