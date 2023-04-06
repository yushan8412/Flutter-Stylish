import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'data_model.dart';
import 'underline_view.dart';

class SecondPage extends StatefulWidget {
  final itemData item;

  const SecondPage({required this.item});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 70,
          width: 200,
          child: Image.network(
            'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png',
            height: 100,
            width: 100,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  size.width >= 600
                      ? Container(
                          height: 400,
                          width: 300,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(widget.item.image),
                          ),
                        )
                      : SizedBox.shrink(),
                  size.width < 600
                      ? Container(
                          height: 400,
                          width: 350,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(widget.item.image),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    width: 15,
                  ),
                  size.width >= 600
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: createTopDetailColum(widget.item, 260),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              size.width < 600
                  ? Container(
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: createTopDetailColum(widget.item, 500),
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(
                height: 20,
              ),
              size.width >= 600
                  ? Container(
                      width: 570,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: createBottomDetailColum(),
                      ),
                    )
                  : SizedBox.shrink(),
              size.width < 600
                  ? Container(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: createBottomDetailColum(),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

//Function
  SizedBox buildBtnwithText(int index, String text) {
    return SizedBox(
      height: 25,
      width: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: selectedIndex == index ? Colors.blue : Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        child: Text(
          text,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Image createPicBox(String url) {
    return Image.network(
      url,
      width: 570,
      height: 330,
      fit: BoxFit.fill,
    );
  }

  List<Widget> createTopDetailColum(itemData item, double underlineWidth) {
    return [
      Text(
        'Uniqlo 特級輕羽絨',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      Text(item.name),
      SizedBox(
        height: 15,
      ),
      Text(
        'NT\$ ' + (item.price).toString(),
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(
        height: 10,
      ),
      HorizontalLine(
        dashedWidth: underlineWidth,
        dashedHeight: 1,
        color: Color.fromARGB(255, 160, 164, 166),
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        children: [
          Text('顏色｜'),
          buildBtnWithColorBox(Colors.green),
          SizedBox(
            width: 5,
          ),
          buildBtnWithColorBox(Colors.blue)
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text('尺寸｜'),
          buildBtnwithText(0, '1'),
          SizedBox(
            width: 5,
          ),
          buildBtnwithText(1, '2'),
          SizedBox(
            width: 5,
          ),
          buildBtnwithText(2, '3'),
        ],
      ),
      SizedBox(
        height: 25,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('數量｜'),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove),
            iconSize: 20,
          ),
          SizedBox(
            width: 50,
            height: 25,
            child: TextField(
              decoration:
                  InputDecoration(border: OutlineInputBorder(), labelText: '1'),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 20,
            height: 20,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 10,
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 45,
        width: underlineWidth,
        child: TextButton(
          onPressed: () {},
          child: Text(
            '請選擇尺寸',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          style: TextButton.styleFrom(
            shape: BeveledRectangleBorder(),
            backgroundColor: Color.fromARGB(255, 75, 60, 60),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        '12312312312312',
        style: TextStyle(fontSize: 16),
      ),
      Text(
        '12312312312312',
        style: TextStyle(fontSize: 16),
      ),
      Text(
        '12312312312312',
        style: TextStyle(fontSize: 16),
      ),
      Text(
        '12312312312312',
        style: TextStyle(fontSize: 16),
      ),
      Text(
        '12312312312312',
        style: TextStyle(fontSize: 16),
      ),
      Text(
        '12312312312312',
        style: TextStyle(fontSize: 16),
      ),
    ];
  }

  List<Widget> createBottomDetailColum() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('123123123'),
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
        child: Text(
            '測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字測試文字'),
      ),
      SizedBox(
        height: 15,
      ),
      createPicBox(widget.item.image),
      SizedBox(
        height: 15,
      ),
      createPicBox(widget.item.image),
      SizedBox(
        height: 15,
      ),
      createPicBox(widget.item.image),
    ];
  }
}

SizedBox buildBtnWithColorBox(Color color) {
  return SizedBox(
    height: 15,
    width: 15,
    child: ElevatedButton(
      onPressed: () {
        print('pressssss');
      },
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(''),
    ),
  );
}
