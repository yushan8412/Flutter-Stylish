import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'underline_view.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

List<Widget> createBottomDetailColum(Product item) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientText('細部說明', colors: [Colors.blue, Colors.green]),
        Expanded(
          child: HorizontalLine(
            dashedWidth: 500,
            dashedHeight: 1,
            color: Colors.black,
          ),
        ),
      ],
    ),
    Container(
      width: 570,
      child: Text(item.story),
    ),
    Column(
      children: _createPicList(item),
    )
    // SizedBox(
    //   height: 15,
    // ),
    // createPicBox(item.mainImage),
    // SizedBox(
    //   height: 15,
    // ),
    // createPicBox(item.mainImage),
    // SizedBox(
    //   height: 15,
    // ),
    // createPicBox(item.mainImage),
  ];
}

Image createPicBox(String url) {
  return Image.network(
    url,
    width: 570,
    height: 330,
    fit: BoxFit.cover,
  );
}

List<Widget> _createPicList(Product item) {
  List<Widget> imageList = [];
  for (int i = 0; i < item.images.length; i++) {
    imageList.add(createPicBox(item.images[i]));
    imageList.add(
      SizedBox(
        height: 15,
      ),
    );
  }
  return imageList;
}
