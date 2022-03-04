import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> _categories = [
      {
        "name": "Clothes",
        "image":
            "https://cf-assets-clover-app.thredup.com/uploads/2022-02-17/clothes-2ffd68f2.png"
      },
      {
        "name": "Beauty",
        "image":
            "https://img.ti-media.net/wp/uploads/sites/46/2021/06/GettyImages-1249466095-1-920x518.jpg"
      },
      {
        "name": "Beauty",
        "image":
            "https://img.ti-media.net/wp/uploads/sites/46/2021/06/GettyImages-1249466095-1-920x518.jpg"
      }
    ];

    return SizedBox(
      width: 100,
      height: 150,
      child: ListView.builder(
          itemCount: _categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _CategoryItem(
                name: _categories[index]["name"]!,
                imageUrl: _categories[index]["image"]!);
          }),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    Key? key,
    required String name,
    required String imageUrl,
  })  : _name = name,
        _imageUrl = imageUrl,
        super(key: key);

  final String _name;
  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.network(
            _imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          _name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}
