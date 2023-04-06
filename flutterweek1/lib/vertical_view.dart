import 'package:flutter/material.dart';
import 'main.dart';
import 'data_model.dart';
import 'horizontal_view.dart';
import 'second_page.dart';

class VerticalView extends StatelessWidget {
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
            _buildHorizontalRow(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    children: [
                      _buildExpansionTile('女裝', womanItems),
                      _buildExpansionTile('男裝', womanItems),
                      _buildExpansionTile('配件', womanItems),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalRow() {
    return Container(
      alignment: Alignment.center,
      height: 180,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: createRowContainer(),
        ),
      ),
    );
  }

  List<Widget> _createRowContainer() {
    List<Widget> rowContainers = [];
    for (int i = 0; i < 5; i++) {
      rowContainers.add(
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    return rowContainers;
  }

  Widget _buildExpansionTile(String title, List<itemData> items) {
    return ExpansionTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      children: [
        ListView.separated(
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
                    Container(
                      height: 130,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                            items[index].image,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(items[index].name),
                        Text('010101010101'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, _) => SizedBox(
            height: 8,
          ),
          itemCount: items.length,
        ),
      ],
    );
  }
}

