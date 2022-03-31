import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/login/login_screen.dart';
import 'package:flutter_shop/login/signup_screen.dart';
import 'package:flutter_shop/screens/app.dart';
import 'package:flutter_shop/shared/app_dialog.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LandingScreen extends StatefulWidget {
  static String rouetName = '/landing';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _signInWithGoogle() async {
    final _googleSignIn = GoogleSignIn();
    final googleAccount = await _googleSignIn.signIn();

    if (googleAccount != null) {
      print(googleAccount);
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          await FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user?.uid)
              .set({
            'id': authResult.user?.uid,
            'name': authResult.user?.displayName,
            'email': authResult.user?.email,
            'phoneNumber': authResult.user?.phoneNumber,
            'imageUrl': authResult.user?.photoURL,
            'createdAt': Timestamp.now()
          });
        } catch (error) {
          AppDialog.showErrorDialog(context, "Whoops", error.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              "https://media.istockphoto.com/photos/man-at-the-shopping-picture-id868718238?k=6&m=868718238&s=612x612&w=0&h=ZUPCx8Us3fGhnSOlecWIZ68y3H4rCiTnANtnjHk0bvo=",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              LinearProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          alignment: FractionalOffset(_animation.value, 0),
        ),
        Container(
          margin: const EdgeInsets.only(top: 100),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Welcome to the biggest online store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: AppColors.backgroundColor),
                        ),
                      )),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
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
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink.shade400),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side:
                                  BorderSide(color: AppColors.backgroundColor),
                            ),
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            AppIcons.userPlus,
                            size: 18,
                          )
                        ],
                      )),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Or continue with',
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: _signInWithGoogle,
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(width: 2, color: Colors.red),
                    ),
                    child: const Text('Google +'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed(App.routeName);
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                    ),
                    child: const Text('Continue as a guest'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ],
    ));
  }
}
