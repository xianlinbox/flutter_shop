import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
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
        ),
      ],
    ));
  }
}
