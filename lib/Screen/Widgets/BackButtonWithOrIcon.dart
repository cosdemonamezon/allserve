import 'package:allserve/appTheme.dart';
import 'package:flutter/material.dart';

class BackButtonWithOrIcon extends StatelessWidget {
  const BackButtonWithOrIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset(
            'assets/icons/arrow-left.png',
            height: appFontSize?.bigSize,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Image.asset('assets/images/ALLZERVE.png', width: 120, height: 50),
        )
      ],
    );
  }
}
