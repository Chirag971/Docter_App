import 'package:flutter/material.dart';

import '../../../../constant.dart';

// ignore: must_be_immutable
class DetailContainer extends StatelessWidget {
  Widget child;
  DetailContainer({Key ?key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: appWhiteColor,
          borderRadius: cr12,
          border: Border.all(color: buttonBorderColor,
          width:  2,
          )),
      child: child,
    );
  }
}
