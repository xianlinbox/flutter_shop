import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/shared/app_dialog.dart';
import 'package:flutter_shop/shared/app_icons.dart';
import 'package:flutter_shop/shared/colors.dart';
import 'package:flutter_shop/shared/input_validator.dart';
import 'package:flutter_shop/shared/widgets/input_fields.dart';
import 'package:flutter_shop/shared/widgets/wave_background.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FocusNode? _emailFocusNode;
  FocusNode? _passwordFocusNode;
  FocusNode? _phoneNumberFocusNode;

  File? _pickedImage;
  String? _fullName;
  String? _emailAddress;
  String? _password;
  String? _phoneNumber;

  bool _obscureText = true;
  bool _isLoading = false;

  void _submitForm() async {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid == true) {
      _formKey.currentState?.save();
      try {
        setState(() {
          _isLoading = true;
        });

        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('$_fullName.jpg');

        if (_pickedImage != null) {
          await storageRef.putFile(_pickedImage!);
        }
        final photoUrl = await storageRef.getDownloadURL();
        await _auth.createUserWithEmailAndPassword(
            email: _emailAddress!.toLowerCase().trim(),
            password: _password!.trim());
        final user = _auth.currentUser;
        user?.updatePhotoURL(photoUrl);
        user?.updateDisplayName(_fullName!.trim());
        user?.reload();
        final _uid = user?.uid;
        if (_uid != null) {
          await FirebaseFirestore.instance.collection('users').doc(_uid).set({
            'id': _uid,
            'fullName': _fullName,
            'emailAddress': _emailAddress,
            'password': _password,
            'phoneNumber': _phoneNumber,
            'image': photoUrl,
          });
        }
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      } catch (error) {
        AppDialog.showErrorDialog(context, "Whoops", error.toString());
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            key: const ValueKey('name'),
                            validator: (value) {
                              if (InputValidator.isValidEmail(value)) {
                                return 'name cannot be null';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_emailFocusNode),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                filled: true,
                                prefixIcon: const Icon(Icons.person),
                                labelText: 'Full name',
                                fillColor: Theme.of(context).backgroundColor),
                            onSaved: (value) {
                              _fullName = value;
                            },
                          ),
                        ),
                        InputFields.emailField(
                          context,
                          (value) => _emailAddress = value,
                          _emailFocusNode,
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
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            key: const ValueKey('phone number'),
                            focusNode: _phoneNumberFocusNode,
                            validator: (value) {
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.next,
                            onEditingComplete: _submitForm,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                filled: true,
                                prefixIcon: const Icon(Icons.phone_android),
                                labelText: 'Phone number',
                                fillColor: Theme.of(context).backgroundColor),
                            onSaved: (value) {
                              _phoneNumber = value;
                            },
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(
                                              color: AppColors.backgroundColor),
                                        ),
                                      )),
                                      onPressed: _submitForm,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Sign up',
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
                            ]),
                      ],
                    ))
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
