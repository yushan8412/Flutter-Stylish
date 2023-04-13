import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'main.dart';
import 'second_page.dart';
import 'component/listview_withpic.dart';
import 'data_manager.dart';

class HorizontalView extends StatefulWidget {
  HorizontalView(BuildContext context);

  @override
  State<HorizontalView> createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {
  final apiService = ApiService();

  List<Product> womenDatas = [];
  List<Product> menDatas = [];
  List<Product> accessoriesDatas = [];

  @override
  void initState() {
    super.initState();
    Future.wait([
      apiService.fetchAllProducts('women'),
      apiService.fetchAllProducts('men'),
      apiService.fetchAllProducts('accessories'),
    ]).then((results) {
      setState(() {
        womenDatas = results[0];
        menDatas = results[1];
        accessoriesDatas = results[2];
      });
    });
  }

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
                          child: Text('女裝'),
                        ),
                        Expanded(child: createlistView(womenDatas)),
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
                          child: Text('男裝'),
                        ),
                        Expanded(child: createlistView(menDatas)),
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
                        child: Text('飾品'),
                      ),
                      Expanded(child: createlistView(accessoriesDatas)),
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
