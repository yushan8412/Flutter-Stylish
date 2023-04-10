import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'main.dart';
import 'second_page.dart';

List<itemData> womanItems = [
  itemData(
      name: 'QQQ',
      image:
          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q',
      price: 666,
      size: ['S', 'M', 'L']),
  itemData(
      name: 'WWW',
      image:
          'https://www.settour.com.tw/ss_img/info/location/PAR/R0/PAR0000115/PAR0000115_64041.jpg',
      price: 666,
      size: ['S', 'M', 'L']),
  itemData(
      name: 'EEE',
      image:
          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q',
      price: 666,
      size: ['S', 'M', 'L']),
  itemData(
      name: 'AAA',
      image:
          'https://www.settour.com.tw/ss_img/info/location/PAR/R0/PAR0000115/PAR0000115_64041.jpg',
      price: 666,
      size: ['S', 'M', 'L']),
  itemData(
      name: 'CCC',
      image:
          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q',
      price: 666,
      size: ['S', 'M', 'L']),
];

class HorizontalView extends StatelessWidget {
  HorizontalView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 70,
          width: 200,
          child: Image.network(
              'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png'),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: createRowContainer(),
                ),
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 25,
                          child: Text('123'),
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SecondPage(
                                                  item: womanItems[index],
                                                )));
                                  },
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 130,
                                            width: 100,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: Image.network(
                                                    womanItems[index].image),
                                              ),
                                            )),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(womanItems[index].name),
                                            Text('00000000')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, _) => SizedBox(
                                    height: 8,
                                  ),
                              itemCount: womanItems.length),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 25,
                          child: Text('123'),
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SecondPage(
                                                  item: womanItems[index],
                                                )));
                                  },
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 130,
                                            width: 100,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: Image.network(
                                                    womanItems[index].image),
                                              ),
                                            )),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('123123123'),
                                            Text('00000000')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, _) => SizedBox(
                                    height: 8,
                                  ),
                              itemCount: womanItems.length),
                        ),
                      ],
                    ),
                  ),
                  //  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 25,
                        child: Text('00000'),
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SecondPage(
                                                item: womanItems[index],
                                              )));
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 130,
                                          width: 100,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Image.network(
                                                  womanItems[index].image),
                                            ),
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(womanItems[index].name),
                                          Text('00000000')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, _) => SizedBox(
                                  height: 8,
                                ),
                            itemCount: womanItems.length),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
