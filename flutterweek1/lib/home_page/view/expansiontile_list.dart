import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'package:flutterweek1/detail_page/second_page.dart';

Widget buildExpansionTile(String title, List<Product> items) {
  return ExpansionTile(
    title: Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    ),
    children: [
      ListView.separated(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    item: items[index],
                  ),
                ),
              );
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 130,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(
                          items[index].mainImage,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(items[index].title),
                      Text('NT\$ ${items[index].price}'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(
          height: 8,
        ),
      ),
    ],
  );
}
