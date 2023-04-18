import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'underline_view.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

List<Widget> createBottomDetailColum(Product item) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientText('細部說明', colors: const [Colors.blue, Colors.green]),
        const Expanded(
          child: HorizontalLine(
            dashedWidth: 500,
            dashedHeight: 1,
            color: Colors.black,
          ),
        ),
      ],
    ),
    SizedBox(
      width: 570,
      child: Text(item.story),
    ),
    Column(
      children: _createPicList(item),
    )
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
      const SizedBox(
        height: 15,
      ),
    );
  }
  return imageList;
}
