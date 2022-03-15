import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrandProductItem extends StatelessWidget {
  const BrandProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        margin: const EdgeInsets.only(right: 20.0, bottom: 5, top: 18),
        constraints: const BoxConstraints(
            minHeight: 150, minWidth: double.infinity, maxHeight: 180),
        child: const Text('Brand product detail'),
      ),
    );
  }
}
