import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/colors.dart';

class BlackLayerMenu extends StatelessWidget {
  const BlackLayerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.starterColor, AppColors.endColor],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
            ),
          ),
        )
      ],
    );
  }
}
