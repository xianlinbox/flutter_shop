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
              children: [
                const SizedBox(height: 30),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: CircleAvatar(
                    radius: 71,
                    backgroundColor: AppColors.gradiendLEnd,
                    child: CircleAvatar(
                        radius: 65,
                        backgroundColor: AppColors.gradiendFEnd,
                        backgroundImage: null),
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
