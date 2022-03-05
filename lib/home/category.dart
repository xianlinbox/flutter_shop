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
        "name": "Electronics",
        "image":
            "https://img2.exportersindia.com/product_images/bc-full/2019/2/6114156/electrical-electronic-1550471706-4727918.jpeg"
      },
      {
        "name": "Sports",
        "image":
            "https://kubrick.htvapps.com/htv-prod-media.s3.amazonaws.com/images/sports-1584678012.jpg?crop=1.00xw:1.00xh;0,0&resize=1200:*"
      },
      {
        "name": "Grocery",
        "image":
            "http://media.foxbusiness.com/BrightCove/854081161001/201912/951/854081161001_6118487245001_6118485083001-vs.jpg"
      }
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ListView.builder(
          itemCount: _categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _CategoryItem(
                  name: _categories[index]["name"]!,
                  imageUrl: _categories[index]["image"]!),
            );
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
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            _imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          _name,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).textSelectionTheme.selectionColor),
        )
      ]),
    );
  }
}
