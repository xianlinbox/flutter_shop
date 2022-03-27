import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/shared/widgets/wave_background.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WaveBackground.build(context),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        child: CircleAvatar(
                          radius: 71,
                          backgroundColor: AppColors.gradiendLEnd,
                          child: CircleAvatar(
                              radius: 65,
                              backgroundColor: AppColors.gradiendFEnd,
                              backgroundImage: null),
                        ),
                      ),
                      Positioned(
                          top: 120,
                          left: 110,
                          child: RawMaterialButton(
                              elevation: 10,
                              fillColor: AppColors.gradiendLEnd,
                              child: const Icon(Icons.add_a_photo),
                              padding: const EdgeInsets.all(15.0),
                              shape: const CircleBorder(),
                              onPressed: () {})),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
