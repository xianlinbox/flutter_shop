import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/shared/widgets/wave_background.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  File? _pickedImage;
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
                              backgroundImage: _pickedImage == null
                                  ? null
                                  : FileImage(_pickedImage!)),
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
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Choose option',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.gradiendLStart),
                                        ),
                                        content: SingleChildScrollView(
                                            child: ListBody(
                                          children: [
                                            _optionItem('Camera', Icons.camera,
                                                _pickImageFromCamera),
                                            _optionItem('Gallery', Icons.image,
                                                _pickImageFromGallery),
                                            _optionItem('Remove',
                                                Icons.remove_circle, _remove),
                                          ],
                                        )),
                                      );
                                    });
                              })),
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

  Widget _optionItem(String title, IconData icon, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      splashColor: Colors.purpleAccent,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.purpleAccent,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.title),
        )
      ]),
    );
  }

  void _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = pickedImage;
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
    });
    Navigator.pop(context);
  }

  void _remove() {
    setState(() {
      _pickedImage = null;
    });
    Navigator.pop(context);
  }

  void _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }
}
