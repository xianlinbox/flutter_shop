import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveBackground {
  static Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.95,
      child: RotatedBox(
        quarterTurns: 2,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [AppColors.gradiendFStart, AppColors.gradiendLStart],
              [AppColors.gradiendFEnd, AppColors.gradiendLEnd],
            ],
            durations: [19440, 10800],
            heightPercentages: [0.20, 0.25],
            blur: const MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          waveAmplitude: 0,
          size: const Size(
            double.infinity,
            double.infinity,
          ),
        ),
      ),
    );
  }
}
