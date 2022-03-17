import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrandProductItem extends StatelessWidget {
  const BrandProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 120, width: 120, child: Text('Brand product detail'));
  }
}
