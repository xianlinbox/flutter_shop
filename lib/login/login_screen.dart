import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/shared/input_validator.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String _emailAddress = '';
  String _password = '';

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
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  //  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://365psd.com/images/previews/3b6/small-store-icon-psd-53185.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          key: const ValueKey('email'),
                          validator: (value) {
                            return InputValidator.isValidEmail(value)
                                ? null
                                : 'Please enter a valid email address';
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              filled: true,
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'Email Address',
                              fillColor: Theme.of(context).backgroundColor),
                          onSaved: (value) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          key: const ValueKey('password'),
                          validator: (value) {
                            return InputValidator.isValidPassword(value ?? '')
                                ? null
                                : 'Please enter a valid password';
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              filled: true,
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              labelText: 'Password',
                              fillColor: Theme.of(context).backgroundColor),
                          onSaved: (value) {},
                          obscureText: _obscureText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 20),
                          child: TextButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, '');
                              },
                              child: Text(
                                'Forget password?',
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    decoration: TextDecoration.underline),
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 10),
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                      color: AppColors.backgroundColor),
                                ),
                              )),
                              onPressed: () {
                                _formKey.currentState?.validate();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    AppIcons.user,
                                    size: 18,
                                  )
                                ],
                              )),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        )
      ],
    ));
  }
}
