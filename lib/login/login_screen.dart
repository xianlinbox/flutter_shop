import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/app_dialog.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/shared/input_validator.dart';
import 'package:flutter_shop/shared/widgets/input_fields.dart';
import 'package:flutter_shop/shared/widgets/wave_background.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _emailAddress = '';
  String _password = '';
  bool _isLoading = false;
  bool _obscureText = true;

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      _formKey.currentState?.save();
      setState(() {
        _isLoading = true;
      });
      await _auth
          .signInWithEmailAndPassword(
              email: _emailAddress.toLowerCase().trim(),
              password: _password.trim())
          .then((value) => {print(value)})
          .catchError((error) {
        print(error);
        AppDialog.showErrorDialog(
            context, "Whoops", "there is an error happened, please try again.");
      }).whenComplete(() {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        WaveBackground.build(context),
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
                      InputFields.emailField(
                        context,
                        (value) => _emailAddress = value,
                        null,
                        _passwordFocusNode,
                      ),
                      InputFields.passwordField(
                        context,
                        (value) => _password = value,
                        _passwordFocusNode,
                        null,
                        _obscureText,
                        () => setState(() {
                          _obscureText = !_obscureText;
                        }),
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
                          _isLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: AppColors.backgroundColor),
                                    ),
                                  )),
                                  onPressed: _submit,
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
