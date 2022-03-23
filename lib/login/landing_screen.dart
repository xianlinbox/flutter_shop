import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  static String rouetName = '/landing';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
        ),
        // CachedNetworkImage(
        //   imageUrl:
        //       'https://media.istockphoto.com/photos/man-at-the-shopping-picture-id868718238?k=6&m=868718238&s=612x612&w=0&h=ZUPCx8Us3fGhnSOlecWIZ68y3H4rCiTnANtnjHk0bvo=',
        //   placeholder: (context, url) => Image.network(
        //     'https://image.flaticon.com/icons/png/128/564/564619.png',
        //     fit: BoxFit.contain,
        //   ),
        //   errorWidget: (context, url, error) => const Icon(Icons.error),
        //   fit: BoxFit.contain,
        //   height: double.infinity,
        //   width: double.infinity,
        //   // alignment: const FractionalOffset(0, 0),
        // ),
      ],
    ));
  }
}
