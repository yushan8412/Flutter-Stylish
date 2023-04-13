import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'main.dart';
import 'second_page.dart';
import 'component/listview_withpic.dart';

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
                          child: Text('女裝'),
                        ),
                        Expanded(child: createlistView(manItems)),
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
                        Expanded(child: createlistView(manItems)),
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
                      Expanded(child: createlistView(manItems)),
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
