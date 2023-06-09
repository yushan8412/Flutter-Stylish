import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'package:flutterweek1/detail_page/second_page.dart';

Widget createlistView(List<Product> itemsData) {
  return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SecondPage(
                          item: itemsData[index],
                        )));
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SizedBox(
                    height: 130,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(itemsData[index].mainImage),
                      ),
                    )),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(itemsData[index].title),
                      Text('NT\$ ${itemsData[index].price}')
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, _) => const SizedBox(
            height: 8,
          ),
      itemCount: itemsData.length);
}
